--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")

--  =================
--  CLASS DEFINITIONS
--  =================

local function newClass(parent, object)
    local object = object or {}
    setmetatable(object, parent.mt)
    parent.mt.__index = parent
    parent.properties.Counter = 1
    return object
end

local function classFunction_GenerateNextID(parent) return parent.properties.Counter * parent.properties.IDIncrementor end

local function classFunction_Find(parent, ID)
    for key, value in pairs(parent) do if value.ID == ID then return key end end
    return nil
end

local function classFunction_Push(parent, element)
    if type(element) ~="table" then return end
    local position = classFunction_Find(parent, element.ID)
    if position ~= nil then parent[position] = element
    else table.insert(parent, element) end
    parent.properties.Counter = parent.properties.Counter + 1
end

local function classFunction_GetElement(parent, ID)
    local position = parent:Find(ID)
    if position then return parent[position] end
    return nil
end

local function classFunction_Remove(parent, ID)
    local position = parent:Find(ID)
    if position then table.remove(parent, position) end
end

--  JOURNAL LIST
--  ------------

JournalList = {["properties"] = {["Counter"] = 1, ["IDIncrementor"] = 1000000}}
JournalList.mt = {}
setmetatable(JournalList, JournalList.mt)

function JournalList:New(object) return newClass(self, object) end
function JournalList:Find(ID) return classFunction_Find(self, ID) end
function JournalList:GetElement(ID) return classFunction_GetElement(self, ID) end
function JournalList:Remove(ID) classFunction_Remove(self, ID) end
function JournalList:GenerateNextID() return classFunction_GenerateNextID(self) end

--  CHAPTERS LIST
--  -------------

ChapterList = {["properties"] = {["Counter"] = 1, ["IDIncrementor"] = 1000}}
ChapterList.mt = {}
setmetatable(ChapterList, ChapterList.mt)

function ChapterList:New(object) return newClass(self, object) end
function ChapterList:Find(ID) return classFunction_Find(self, ID) end
function ChapterList:GetElement(ID) return classFunction_GetElement(self, ID) end
function ChapterList:Remove(ID) classFunction_Remove(self, ID) end
function ChapterList:GenerateNextID() return classFunction_GenerateNextID(self) end

--  PARAGRAPHS LIST
--  ---------------

ParagraphList = {["properties"] = {["Counter"] = 1, ["IDIncrementor"] = 1}}
ParagraphList.mt = {}
setmetatable(ParagraphList, ParagraphList.mt)

function ParagraphList:New(object) return newClass(self, object) end
function ParagraphList:Find(ID) return classFunction_Find(self, ID) end
function ParagraphList:GetElement(ID) return classFunction_GetElement(self, ID) end
function ParagraphList:Remove(ID) classFunction_Remove(self, ID) end
function ParagraphList:GenerateNextID() return classFunction_GenerateNextID(self) end

function JournalList:Push(element) element.Chapters = ChapterList:New(); classFunction_Push(self, element) end
function ChapterList:Push(element) element.Paragraphs = ParagraphList:New(); classFunction_Push(self, element) end
function ParagraphList:Push(element) classFunction_Push(self, element) end

--  =======
--  JOURNAL
--  =======

UILibrary.GMJournal.prototype = {
    ["Exists"] = false,
    ["UI"] = {},
    ["Root"] = {},
    ["Component"] = {
        ["Strings"] = {
            ["caption"] = "Your Journal",
            ["editButtonCaption"] = "TOGGLE EDIT MODE",
            ["addChapter"] = "Add New Chapter",
            ["addCategory"] = "Add New Category",
            ["addParagraph"] = "Add New Entry...",
            ["shareWithParty"] = "Share with Party"
        }
    },
    ["SubComponent"] = {
        ["ToggleEditButton"] = {
            ["Title"] = "ToggleEditButton",
            ["Visible"] = true
        }
    },
    ["JournalData"] = JournalList:New()
}
UILibrary.GMJournal.mt = {}
setmetatable(UILibrary.GMJournal, UILibrary.GMJournal.mt)
UILibrary.GMJournal.mt.__index = UILibrary.GMJournal.prototype

function UILibrary.GMJournal:New(object)
    local object = object or {}
    setmetatable(object, self.mt)
    self.mt.__index = self.prototype
    return object
end

--  ===============================
Journal = UILibrary.GMJournal:New()
--  ===============================

--  ================
--  HELPER FUNCTIONS
--  ================

--  ---------
--  PRINT ALL
--  ---------

function RevealJournal()
    Ext.Print(Ext.JsonStringify(Journal.JournalData))
end

--  --------
--  PARSE ID
--  --------

local function parseID(ID, reMerge)
    local reMerge = reMerge or true
    local zeroes = GetTrailingZeroes(ID)
    local journalNodeType = 1

    if zeroes >= 6 then journalNodeType = 1
    elseif zeroes < 6 and zeroes >= 3 then journalNodeType = 2
    elseif zeroes < 3 then journalNodeType = 3 end

    local catMapID = math.floor(ID/1000000)*1000000
    local chapMapID = math.floor((ID - catMapID)/1000)*1000
    local paraMapID = math.floor(ID - catMapID - chapMapID)

    if reMerge == true then
        chapMapID = catMapID + chapMapID
        paraMapID = chapMapID + paraMapID
    end

    return catMapID, chapMapID, paraMapID, journalNodeType
end

--  ------------
--  GET POSITION
--  ------------

local function getPos(ID)
    local catMapID, chapMapID, paraMapID, journalNodeType = parseID(ID, true)
    local Pos, catPos, chapPos, paraPos

    if journalNodeType >= 1 then
        catPos = Journal.JournalData:Find(catMapID) or #Journal.JournalData + 1
        Pos = catPos
    end
    if journalNodeType >= 2 then
        chapPos = Journal.JournalData:GetElement(catMapID).Chapters:Find(chapMapID) or #Journal.JournalData:GetElement(catMapID).Chapters + 1
        Pos = chapPos
    end
    if journalNodeType >= 3 then
        paraPos = Journal.JournalData:GetElement(catMapID).Chapters:GetElement(chapMapID).Paragraphs:Find(paraMapID) or #Journal.JournalData:GetElement(catMapID).Chapters:GetElement(chapMapID).Paragraphs + 1
        Pos = paraPos
    end

    return Pos, catPos, chapPos, paraPos
end

--  --------------------------------
--  DETERMINE ENTRY-ID and PARENT-ID
--  --------------------------------

local function determineEntryID(ID)
    local entryID, parentID
    local catMapID, chapMapID, paraMapID, journalNodeType = parseID(ID, true)

    if journalNodeType == 1 then entryID = catMapID; parentID = catMapID
    elseif journalNodeType == 2 then parentID = catMapID; entryID = chapMapID
    elseif journalNodeType == 3 then parentID = chapMapID; entryID = paraMapID
    end return entryID, parentID
end

--  =============
--  ENTRY HANDLER
--  =============

local function handleEntry(data)
    if type(data.ID) == "nil" or type(data.ID) ~= "number" then return end
    local catMapID, chapMapID, paraMapID, journalNodeType = parseID(data.ID)
    Journal.Root.entries[0] = journalNodeType

    local Pos, catPos, chapPos, paraPos = getPos(data.ID)
    Journal.Root.entries[1] = Pos - 1

    local entryID, parentID = determineEntryID(data.ID)
    Journal.Root.entries[2] = entryID
    Journal.Root.entries[3] = parentID
    Journal.Root.entries[4] = data.strContent
    Journal.Root.entries[5] = data.isShared or false
    Journal.Root.updateEntries()

    if journalNodeType == 1 then Journal.JournalData:Push({["ID"] = data.ID, ["strContent"] = data.strContent, ["isShared"] = data.isShared})
    elseif journalNodeType == 2 then Journal.JournalData[catPos]["Chapters"]:Push({["ID"] = data.ID, ["strContent"] = data.strContent, ["isShared"] = data.isShared})
    elseif journalNodeType == 3 then Journal.JournalData[catPos]["Chapters"][chapPos]["Paragraphs"]:Push({["ID"] = data.ID, ["strContent"] = data.strContent, ["isShared"] = data.isShared})
    end
end

--  ==========================
--  REGISTER JOURNAL LISTENERS
--  ==========================

local function RegisterJournalListeners()

    --  ADD CATEGORY
    --  ============

    Ext.RegisterUICall(Journal.UI, 'addCategory', function (ui, call, ...)
        handleEntry({
            ["ID"] = Journal.JournalData:GenerateNextID(),
            ["strContent"] = "New Category",
            ["isShared"] = false
        })
    end)

    --  ADD CHAPTER
    --  ===========

    Ext.RegisterUICall(Journal.UI, 'addChapter', function (ui, call, id)
        local Pos, catPos, chapPos, paraPos = getPos(id)
        handleEntry({
            ["ID"] = id + Journal.JournalData[catPos].Chapters:GenerateNextID(),
            ["strContent"] = "New Chapter",
            ["isShared"] = false
        })
    end)

    --  ADD PARAGRAPH
    --  =============

    Ext.RegisterUICall(Journal.UI, 'addParagraph', function (ui, call, id)
        local Pos, catPos, chapPos, paraPos = getPos(id)
        handleEntry({
            ["ID"] = id + Journal.JournalData[catPos].Chapters[chapPos].Paragraphs:GenerateNextID(),
            ["strContent"] = "New Paragraph",
            ["isShared"] = false
        })
    end)

    --  UPDATE TEXT
    --  -----------

    Ext.RegisterUICall(Journal.UI, "textUpdate", function (ui, call, id, updatedText)
        local catMapID, chapMapID, paraMapID, journalNodeType = parseID(id)
        local Pos, catPos, chapPos, paraPos = getPos(id)

        if journalNodeType == 1 then Journal.JournalData[catPos]["strContent"] = updatedText
        elseif journalNodeType == 2 then Journal.JournalData[catPos]["Chapters"][chapPos]["strContent"] = updatedText
        elseif journalNodeType == 3 then Journal.JournalData[catPos]["Chapters"][chapPos]["Paragraphs"][paraPos]["strContent"] = updatedText
        end
    end)

    --  REMOVE NODES
    --  ============

    Ext.RegisterUICall(Journal.UI, 'removeNode', function(ui, call, id)
        local catMapID, chapMapID, paraMapID, journalNodeType = parseID(id, true)
        local Pos, catPos, chapPos, paraPos = getPos(id)

        if journalNodeType == 1 then Journal.JournalData:Remove(catMapID)
        elseif journalNodeType == 2 then Journal.JournalData[catPos].Chapters:Remove(chapMapID)
        elseif journalNodeType == 3 then Journal.JournalData[catPos].Chapters[chapPos].Paragraphs:Remove(paraMapID)
        end
    end)

    Ext.RegisterUICall(Journal.UI, "S7_Journal_UI_Hide", function(ui, call, ...) Journal.UI:Hide() end)
    RegisterDebugHooks(Journal.UI)
end

--  ########################################################################################################################################

--  ==============
--  CREATE JOURNAL
--  ==============

function CreateJournal(Specs)
    Journal = UILibrary.GMJournal:New()
    Ext.CreateUI("S7Journal", Dir.ModGUI .. "GMJournal.swf", 10)
    Journal.UI = Ext.GetUI("S7Journal")
    Journal.Root = Journal.UI:GetRoot()
    RegisterJournalListeners()
    Journal.Exists = true
end

--  ==============
--  RENDER JOURNAL
--  ==============

function RenderJournal(Specs)
    if not Journal.Exists then CreateJournal(Specs) end
    if Specs ~= nil then
        for specType, specifications in pairs(Specs) do
            if SpecsHandler["Journal"][specType] ~= nil then
                SpecsHandler["Journal"][specType](specifications)
            end
        end
    end

    Journal.UI:Show()
    return Journal
end

--  ==============
--  UPDATE JOURNAL
--  ==============

function UpdateJournal(JournalData)
    local function buildJournal(journalEntry)
        if journalEntry ~= nil and type(journalEntry) == 'table' then

            for _, Data in pairs(journalEntry) do
                handleEntry(Data)
                if Data.Chapters ~= nil then buildJournal(Data.Chapters) end
                if Data.Paragraphs ~= nil then buildJournal(Data.Paragraphs) end
            end
        end
    end
--  ----------------------------------------
    buildJournal(Ext.JsonParse(JournalData))
--  ----------------------------------------
end

--  ==============
--  UNLOAD JOURNAL
--  ==============

function UnloadJournal()
    for _, value in ipairs(Journal.JournalData) do
        Journal.Root.entriesMap[value.ID].onRemove()
    end
end

--  =============
--  SPECS HANDLER
--  =============

SpecsHandler["Journal"] = {
    ["Component"] = function(Component)
        if Journal.Root.strings ~= nil then
            Journal.Root.strings.caption = Component.Strings.caption or Journal.Component.Strings.caption
            Journal.Root.strings.editButtonCaption = Component.Strings.editButtonCaption or Journal.Component.Strings.editButtonCaption
            Journal.Root.strings.addChapter = Component.Strings.addChapter or Journal.Component.Strings.addChapter
            Journal.Root.strings.addCategory = Component.Strings.addCategory or Journal.Component.Strings.addCategory
            Journal.Root.strings.addParagraph = Component.Strings.addParagraph or Journal.Component.Strings.addParagraph
            Journal.Root.strings.shareWithParty = Component.Strings.shareWithParty or Journal.Component.Strings.shareWithParty
        end
        Journal.Root.updateCaptions()
    end,
    ["SubComponent"] = function (SubComponent)
        if SubComponent.ToggleEditButton ~= nil then
            Journal.Root.toggleEditButton_mc.visible = SubComponent.ToggleEditButton.Visible
            Journal.SubComponent.ToggleEditButton.Visible = SubComponent.ToggleEditButton.Visible
        end
    end,

    ['JournalData'] = function (data)
        UpdateJournal(Ext.JsonStringify(data))
    end,
}
