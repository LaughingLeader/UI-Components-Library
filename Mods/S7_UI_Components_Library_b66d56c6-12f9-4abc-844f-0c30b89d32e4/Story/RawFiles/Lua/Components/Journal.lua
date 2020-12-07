--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")

--  =======
--  JOURNAL
--  =======

Journal = UILibrary.GMJournal

function ReinitializeJournal()
    local defaultJournal = {
        ["Exists"] = false, --  Whether journal element exists
        ["UI"] = {}, -- The actual element
        ["Root"] = {}, --  Root Object
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
        ["JournalMetaData"] = {
            ["CategoryEntryMap"] = {},
            ["ChapterEntryMap"] = {},
            ["ParagraphEntryMap"] = {}
        },
        ["JournalData"] = {}
    }
    return defaultJournal
end

Journal = Rematerialize(ReinitializeJournal())  --  Reinitialize Journal

--  ================
--  HELPER FUNCTIONS
--  ================

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
    local Pos, catPos, chapPos, paraPos = 1, 1, 1, 1

    if Journal.JournalMetaData.CategoryEntryMap ~= nil then
        catPos = #Journal.JournalMetaData.CategoryEntryMap + 1
        for k, v in pairs(Journal.JournalMetaData.CategoryEntryMap) do
            if v == catMapID then catPos = k end
        end
    end
    if Journal.JournalMetaData.ChapterEntryMap[catMapID] ~= nil then
        chapPos = #Journal.JournalMetaData.ChapterEntryMap[catMapID] + 1
        for k, v in pairs(Journal.JournalMetaData.ChapterEntryMap[catMapID]) do
            if v == chapMapID then chapPos = k end
        end
    end
    if Journal.JournalMetaData.ParagraphEntryMap[chapMapID] ~= nil then
        paraPos = #Journal.JournalMetaData.ParagraphEntryMap[chapMapID] + 1
        for k, v in pairs(Journal.JournalMetaData.ParagraphEntryMap[chapMapID]) do
            if v == paraMapID then paraPos = k end
        end
    end

    if journalNodeType == 1 then Pos = catPos
    elseif journalNodeType == 2 then Pos = chapPos
    elseif journalNodeType == 3 then Pos = paraPos end

    return Pos, catPos, chapPos, paraPos
end

--  --------------------------------
--  DETERMINE ENTRY-ID and PARENT-ID
--  --------------------------------

local function determineEntryID(ID)
    local entryID, parentID = 0, 0
    local catMapID, chapMapID, paraMapID, journalNodeType = parseID(ID, true)

    if journalNodeType == 1 then
        entryID = catMapID
        parentID = catMapID
    elseif journalNodeType == 2 then
        parentID = catMapID
        entryID = chapMapID
    elseif journalNodeType == 3 then
        parentID = chapMapID
        entryID = paraMapID
    end
    return entryID, parentID
end

--  ########################################################################################################################################

--  =============
--  ENTRY HANDLER
--  =============

local function handleEntry(data)
    if data.ID == nil or type(data.ID) ~= "number" then return end
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

    if journalNodeType == 1 then
        if Journal.JournalData[catPos] == nil then Journal.JournalData[catPos] = {} end
        Journal.JournalData[catPos]["ID"] = data.ID
        Journal.JournalData[catPos]["strContent"] = data.strContent
        Journal.JournalData[catPos]["isShared"] = data.isShared or false
        if Journal.JournalData[catPos]["chapters"] == nil then Journal.JournalData[catPos]["chapters"] = {} end

        Journal.JournalMetaData.CategoryEntryMap[catPos] = entryID
        if Journal.JournalMetaData.ChapterEntryMap[entryID] == nil then Journal.JournalMetaData.ChapterEntryMap[entryID] = {} end

    elseif journalNodeType == 2 then
        if Journal.JournalData[catPos]["chapters"][chapPos] == nil then Journal.JournalData[catPos]["chapters"][chapPos] = {} end
        Journal.JournalData[catPos]["chapters"][chapPos]["ID"] = data.ID
        Journal.JournalData[catPos]["chapters"][chapPos]["strContent"] = data.strContent
        Journal.JournalData[catPos]["chapters"][chapPos]["isShared"] = data.isShared or false
        if Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"] == nil then Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"] = {} end

        Journal.JournalMetaData.ChapterEntryMap[parentID][chapPos] = entryID
        if Journal.JournalMetaData.ParagraphEntryMap[entryID] == nil then Journal.JournalMetaData.ParagraphEntryMap[entryID] = {} end

    elseif journalNodeType == 3 then
        if Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"][paraPos] == nil then Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"][paraPos] = {} end
        Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"][paraPos]["ID"] = data.ID
        Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"][paraPos]["strContent"] = data.strContent
        Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"][paraPos]["isShared"] = data.isShared or false

        Journal.JournalMetaData.ParagraphEntryMap[parentID][paraPos] = entryID
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
            ["ID"] = (#Journal.JournalMetaData.CategoryEntryMap + 1) * 1000000,
            ["strContent"] = "New Category",
            ["isShared"] = false
        })
    end)

    --  ADD CHAPTER
    --  ===========

    Ext.RegisterUICall(Journal.UI, 'addChapter', function (ui, call, id)
        handleEntry({
            ["ID"] = id + (#Journal.JournalMetaData.ChapterEntryMap[id] + 1) * 1000,
            ["strContent"] = "New Chapter",
            ["isShared"] = false
        })
    end)

    --  ADD PARAGRAPH
    --  =============

    Ext.RegisterUICall(Journal.UI, 'addParagraph', function (ui, call, id)
        handleEntry({
            ["ID"] = id + (#Journal.JournalMetaData.ParagraphEntryMap[id] + 1),
            ["strContent"] = "New Paragraph",
            ["isShared"] = false
        })
    end)

    --  REMOVE NODES
    --  ============

    Ext.RegisterUICall(Journal.UI, 'removeNode', function(ui, call, id)
        local catMapID, chapMapID, paraMapID, journalNodeType = parseID(id, true)
        local Pos, catPos, chapPos, paraPos = getPos(id)

        if journalNodeType == 3 then
            table.remove(Journal.JournalData[catPos]["chapters"][chapPos]["paragraphs"], paraPos)
            table.remove(Journal.JournalMetaData.ParagraphEntryMap[chapMapID], paraPos)
        elseif journalNodeType == 2 then
            table.remove(Journal.JournalData[catPos]["chapters"], chapPos)
            table.remove(Journal.JournalMetaData.ChapterEntryMap[catMapID], chapPos)
            Journal.JournalMetaData.ParagraphEntryMap[chapMapID] = nil
        elseif journalNodeType == 1 then
            table.remove(Journal.JournalData, catPos)
            table.remove(Journal.JournalMetaData.CategoryEntryMap, catPos)
            for _, chaps in pairs(Journal.JournalMetaData.ChapterEntryMap[catMapID]) do
                Journal.JournalMetaData.ParagraphEntryMap[chaps] = nil
            end
            Journal.JournalMetaData.ChapterEntryMap[catMapID] = nil
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
    if not Journal.Exists then
        ReinitializeJournal()
        Ext.CreateUI("S7Journal", Dir.ModGUI .. "GMJournal.swf", 10)
        Journal.UI = Ext.GetUI("S7Journal")
        Journal.Root = Journal.UI:GetRoot()
        RegisterJournalListeners()
        Journal.Exists = true
    end
end

--  ==============
--  RENDER JOURNAL
--  ==============

function RenderJournal(Specs)
    if not Journal.Exists then CreateJournal(Specs) end

    if Specs ~= nil then
        for specType, specifications in pairs(Specs) do
            SpecsHandler["Journal"][specType](specifications)
        end
    end

    Journal.UI:Show()
    return Journal
end

--  ==============
--  UPDATE JOURNAL
--  ==============

function UpdateJournal(JournalData)
    Journal.JournalData = Ext.JsonParse(JournalData) -- Parse Stringified Input

    --  BUILD JOURNAL
    --  =============
    local function buildJournal(journalEntry)
        if journalEntry ~= nil then

            --  UPDATE ENTRIES
            --  --------------
            for _, data in pairs(journalEntry) do
                handleEntry(data)

                --  Recursions
                --  ----------
                if data.chapters ~= nil then
                    buildJournal(data.chapters)
                end
                if data.paragraphs ~= nil then
                    buildJournal(data.paragraphs)
                end
            end
        end
    end
--  ---------------------------------
    buildJournal(Journal.JournalData)
--  ---------------------------------
end

--  =============
--  SPECS HANDLER
--  =============

SpecsHandler["Journal"] = {

    --  MAIN COMPONENT
    --  --------------
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

    --  SUBCOMPONENTS
    --  -------------
    ["SubComponent"] = function (SubComponent)
        if SubComponent.ToggleEditButton ~= nil then
            Journal.Root.toggleEditButton_mc.visible = SubComponent.ToggleEditButton.Visible
            Journal.SubComponent.ToggleEditButton.Visible = SubComponent.ToggleEditButton.Visible
        end
    end,

    --  JOURNAL DATA
    --  ------------
    ['JournalData'] = function (data)
        UpdateJournal(Ext.JsonStringify(data))
    end,

    --  JOURNAL META-DATA
    --  -----------------
    ["JournalMetaData"] = function (data)
        Journal.JournalMetaData = Rematerialize(data)
    end
}
