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
            --  Captions
            --  ========

            ["Strings"] = {
                ["caption"] = "Your Journal",
                ["editButtonCaption"] = "TOGGLE EDIT MODE",
                ["addChapter"] = "Add New Chapter",
                ["addCategory"] = "Add New Category",
                ["addParagraph"] = "Add New Entry...",
                ["shareWithParty"] = "Share with Party"
            }
        },
        ["JournalMetaData"] = {
            --  Journal MetaData
            --  ================

            ["CategoryEntryMap"] = {
                -- [1] = 1000000,
                -- [2] = 2000000,
            },
            ["ChapterEntryMap"] = {
                -- [1000000] = { 1001000, 1002000 }
                -- [2000000] = { 2001000, 2002000 }
            },
            ["ParagraphEntryMap"] = {
                -- [1001000] = { 1001001, 1001002 }
                -- [1002000] = { 1002001, 1002002 }
                -- [2001000] = { 2001001, 2001002 }
                -- [2002000] = { 2002001, 2002002 }
            }
        },
        ["JournalData"] = {}
    }
    return defaultJournal
end

Journal = Rematerialize(ReinitializeJournal())  --  Reinitialize Journal

--  ########################################################################################################################################

--  ==========================
--  REGISTER JOURNAL LISTENERS
--  ==========================

local function RegisterJournalListeners()

    --  ADD CATEGORY
    --  ============

    Ext.RegisterUICall(Journal.UI, 'addCategory', function (ui, call, ...)
        Journal.Root.entries[0] = 1 --  Journal Node Type 1: Category

        local Pos = #Journal.JournalMetaData.CategoryEntryMap --  Get Position Index
        Journal.Root.entries[1] = Pos   --  Set Position Index

        local entriesMapId = Ext.Random(1, 999) * 1000000  --  Generate EntriesMapID
        Journal.JournalMetaData.CategoryEntryMap[Pos + 1] = entriesMapId
        Journal.JournalMetaData.ChapterEntryMap[entriesMapId] = {} --  Initialize Chapter-Table for generated entry

        Journal.Root.entries[2] = entriesMapId   --  Set EntriesMapID
        Journal.Root.entries[3] = entriesMapId   --  Set ParentMapID
        Journal.Root.entries[4] = "New Category"    --  Set Entry String Content
        Journal.Root.entries[5] = false --  Set Entry isShared Boolean

        Journal.Root.updateEntries()    --   Update Entries: MainTimeline Event.
    end)

    --  ADD CHAPTER
    --  ===========

    Ext.RegisterUICall(Journal.UI, 'addChapter', function (ui, call, id)
        Journal.Root.entries[0] = 2 --  Journal Node Type 2: Chapter

        local Pos = #Journal.JournalMetaData.ChapterEntryMap[id]  --  Get Position Index
        Journal.Root.entries[1] = Pos   --  Set Position

        local chapterId = id + Ext.Random(1, 999) * 1000 --  Generate chapterID
        Journal.JournalMetaData.ChapterEntryMap[id][Pos + 1] = chapterId
        Journal.JournalMetaData.ParagraphEntryMap[chapterId] = {}    -- Initialize Paragraph-Table for generated entry

        Journal.Root.entries[2] = chapterId    --  Set EntriesMapID
        Journal.Root.entries[3] = id    --  Set ParentMapID
        Journal.Root.entries[4] = "New Chapter" --  Set Entry String Content
        Journal.Root.entries[5] = false -- Set Entry isShared Boolean
        
        Journal.Root.updateEntries()    --  Update Entries: MainTimeline Event.
    end)

    --  ADD PARAGRAPH
    --  =============

    Ext.RegisterUICall(Journal.UI, 'addParagraph', function (ui, call, id)
        Journal.Root.entries[0] = 3 --  Journal Node Type 3: Paragraph

        local Pos = #Journal.JournalMetaData.ParagraphEntryMap[id]    -- Get Position Index
        Journal.Root.entries[1] = Pos   --  Set Position Index

        local paraId = id + Ext.Random(1, 999)  --  Generate EntriesMapID
        Journal.JournalMetaData.ParagraphEntryMap[id][Pos + 1] = paraId

        Journal.Root.entries[2] = paraId  --  Set EntriesMapID
        Journal.Root.entries[3] = id    --  Set ParentMapID
        Journal.Root.entries[4] = "New Paragraph"   -- Set Entry String Content
        Journal.Root.entries[5] = false -- Set Entry isShared Boolean

        Journal.Root.updateEntries()    -- Update Entries: MainTimeline Event.
    end)

    --  REMOVE NODES
    --  ============

    Ext.RegisterUICall(Journal.UI, 'removeNode', function(ui, call, id)
        local zeroes = GetTrailingZeroes(id)    --  Calculates the number of trailing zeroes. Used to determine JournalNodeType.

        if zeroes >= 6 then --  Journal Entry Type: Category
            
            --  CATEGORY
            --  --------

            for pos, target in ipairs(Journal.JournalMetaData.CategoryEntryMap) do
                if target == id then
                    if Journal.JournalMetaData.CategoryEntryMap[pos+1] ~= nil then
                        local swap = Journal.JournalMetaData.CategoryEntryMap[pos]
                        Journal.JournalMetaData.CategoryEntryMap[pos] = Journal.JournalMetaData.CategoryEntryMap[pos+1]
                        Journal.JournalMetaData.CategoryEntryMap[pos+1] = swap
                    else
                        Journal.JournalMetaData.CategoryEntryMap[pos] = nil
                    end
                end
            end
            Journal.JournalMetaData.ChapterEntryMap[id] = nil
        
            --  CHAPTER
            --  -------

        elseif zeroes < 6 and zeroes >= 3 then  --  Journal Entry Type: Chapter
            local parentId = math.floor(id / 1000000) * 1000000
            for pos, target in ipairs(Journal.JournalMetaData.ChapterEntryMap[parentId]) do
                if target == id then
                    if Journal.JournalMetaData.ChapterEntryMap[parentId][pos+1] ~= nil then
                        local swap = Journal.JournalMetaData.ChapterEntryMap[parentId][pos]
                        Journal.JournalMetaData.ChapterEntryMap[parentId][pos] = Journal.JournalMetaData.ChapterEntryMap[parentId][pos+1]
                        Journal.JournalMetaData.ChapterEntryMap[parentId][pos+1] = swap
                    else
                        Journal.JournalMetaData.ChapterEntryMap[parentId][pos] = nil
                    end
                end
            end
            Journal.JournalMetaData.ParagraphEntryMap[id] = nil
        
            --  PARAGRAPH
            --  ---------

        elseif zeroes < 3 then  --  Journal Entry Type: Paragraph
            local parentId = math.floor(id / 1000) * 1000
            for pos, target in ipairs(Journal.JournalMetaData.ParagraphEntryMap[parentId]) do
                if target == id then
                    if Journal.JournalMetaData.ParagraphEntryMap[parentId][pos+1] ~= nil then
                        Journal.JournalMetaData.ParagraphEntryMap[parentId][pos] = Journal.JournalMetaData.ParagraphEntryMap[parentId][pos+1]
                        Journal.JournalMetaData.ParagraphEntryMap[parentId][pos+1] = target
                    else
                        Journal.JournalMetaData.ParagraphEntryMap[parentId][pos] = nil
                    end
                end
            end
        end
    end)

    Ext.RegisterUICall(Journal.UI, "S7_UI_Journal_Hide", function(ui, call, ...) Journal.UI:Hide() end)
    -- RegisterDebugHooks(Journal.UI)
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

    --  -------------
    --  SPECS HANDLER
    --  -------------

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "SubComponent" then
                --  Doesn't have SubComponents
            elseif SpecsHandler["Journal"][key] ~= nil then
                SpecsHandler["Journal"][key](value)
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
    Journal.JournalData = Ext.JsonParse(JournalData) -- Parse Stringified Input

    --  BUILD JOURNAL
    --  =============

    local function buildJournal(journalEntry)
        if journalEntry ~= nil then

            --  GET POSITION
            --  ------------

            local function getPos(journalNodeType, pos, entriesMapId, parentId)
                if journalNodeType == 1 then
                    if Journal.JournalMetaData.CategoryEntryMap ~= nil then
                        for k, v in pairs(Journal.JournalMetaData.CategoryEntryMap) do
                            if v == entriesMapId then return k end
                        end
                    end
                    return pos

                elseif journalNodeType == 2 then
                    if Journal.JournalMetaData.ChapterEntryMap[parentId] ~= nil then
                        for k, v in pairs(Journal.JournalMetaData.ChapterEntryMap[parentId]) do
                            if v == entriesMapId then return k end
                        end
                    end
                    return pos

                elseif journalNodeType == 3 then
                    if Journal.JournalMetaData.ParagraphEntryMap[parentId] ~= nil then
                        for k, v in pairs(Journal.JournalMetaData.ParagraphEntryMap[parentId]) do
                            if v == entriesMapId then return k end
                        end
                    end
                    return pos
                end
            end

            --  UPDATE ENTRIES
            --  --------------

            for i, data in pairs(journalEntry) do

                local Pos = getPos(data["JournalNodeType"], i, data["entriesMapId"], data["parentMapId"])
                Journal.Root.entries[0] = data["JournalNodeType"]
                Journal.Root.entries[1] = Pos
                Journal.Root.entries[2] = data["entriesMapId"]
                Journal.Root.entries[3] = data["parentMapId"]
                Journal.Root.entries[4] = data["StringContent"]
                Journal.Root.entries[5] = data["isShared"]
                Journal.Root.updateEntries()

                --  Update MetaData
                --  ===============

                if data.JournalNodeType == 1 then
                    Journal.JournalMetaData.CategoryEntryMap[Pos] = data.entriesMapId
                    if Journal.JournalMetaData.ChapterEntryMap[data.entriesMapId] == nil then
                        Journal.JournalMetaData.ChapterEntryMap[data.entriesMapId] = {}
                    end
                elseif data.JournalNodeType == 2 then
                    Journal.JournalMetaData.ChapterEntryMap[data.parentMapId][Pos] = data.entriesMapId
                    if Journal.JournalMetaData.ParagraphEntryMap[data.entriesMapId] == nil then
                        Journal.JournalMetaData.ParagraphEntryMap[data.entriesMapId] = {}
                    end
                elseif data.JournalNodeType == 3 then
                    if Journal.JournalMetaData.ParagraphEntryMap[data.parentMapId] == nil then
                        Journal.JournalMetaData.ParagraphEntryMap[data.parentMapId] = {}
                    end
                    Journal.JournalMetaData.ParagraphEntryMap[data.parentMapId][Pos] = data.entriesMapId
                end

                --  Recursions
                --  ----------

                if data.Chapters ~= nil then
                    buildJournal(data.Chapters)
                end
                if data.Paragraphs ~= nil then
                    buildJournal(data.Paragraphs)
                end
            end
        end
    end

    --  Function Call
    buildJournal(Journal.JournalData)
end

--  =============
--  SPECS HANDLER
--  =============

SpecsHandler["Journal"] = {
    
    --  MAIN COMPONENT
    --  ==============

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
    --  =============

    ["SubComponent"] = {},
    
    --  JOURNAL DATA
    --  ============

    ['JournalData'] = function (data)
        UpdateJournal(Ext.JsonStringify(data))
    end,

    --  JOURNAL META-DATA
    --  =================

    ["JournalMetaData"] = function (data)
        Journal.JournalMetaData = Rematerialize(data)
    end
}
