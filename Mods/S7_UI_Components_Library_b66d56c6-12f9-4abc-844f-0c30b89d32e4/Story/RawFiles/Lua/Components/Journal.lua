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
            },
            
            --  Journal MetaData
            --  ================

            ["CategoryEntryMap"] = {
                -- [1] = 1000000,
                -- [2] = 2000000,
            },
            ["ChapterEntryMap"] = {
                -- [1000000] = { 1010000, 1020000 }
                -- [2000000] = { 2010000, 2020000 }
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

--  ##########################################################################################################

--  ==========================
--  REGISTER JOURNAL LISTENERS
--  ==========================

local function RegisterJournalListeners()

    --  ADD CATEGORY
    --  ============

    Ext.RegisterUICall(Journal.UI, 'addCategory', function (ui, call, ...)
        Journal.Root.entries[0] = 1 --  Journal Node Type 1: Category

        -- local Pos = #Journal.Component.CategoryEntryMap --  Get Position Index
        local Pos = Journal.Root.content_mc.categories.length - 1 --  Get Position Index
        Journal.Root.entries[1] = Pos   --  Set Position Index

        local entriesMapId = Ext.Random(1, 999) * 1000000  --  Generate EntriesMapID
        Journal.Component.CategoryEntryMap[Pos + 1] = entriesMapId
        Journal.Component.ChapterEntryMap[entriesMapId] = {} --  Initialize Chapter-Table for generated entry

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

        local Pos = #Journal.Component.ChapterEntryMap[id] or 0  --  Get Position Index
        Journal.Root.entries[1] = Pos   --  Set Position

        local chapterId = id + Ext.Random(1, 999) * 1000 --  Generate chapterID
        Journal.Component.ChapterEntryMap[id][Pos + 1] = chapterId
        Journal.Component.ParagraphEntryMap[chapterId] = {}    -- Initialize Paragraph-Table for generated entry

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

        local Pos = #Journal.Component.ParagraphEntryMap[id]    -- Get Position Index
        Journal.Root.entries[1] = Pos   --  Set Position Index

        local paraId = id + Ext.Random(1, 999)  --  Generate EntriesMapID
        Journal.Component.ParagraphEntryMap[id][Pos + 1] = paraId

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

            for pos, target in ipairs(Journal.Component.CategoryEntryMap) do
                if target == id then
                    if Journal.Component.CategoryEntryMap[pos+1] ~= nil then
                        local swap = Journal.Component.CategoryEntryMap[pos]
                        Journal.Component.CategoryEntryMap[pos] = Journal.Component.CategoryEntryMap[pos+1]
                        Journal.Component.CategoryEntryMap[pos+1] = swap
                    else
                        Journal.Component.CategoryEntryMap[pos] = nil
                    end
                end
            end
            Journal.Component.ChapterEntryMap[id] = nil
        
            --  CHAPTER
            --  -------

        elseif zeroes < 6 and zeroes >= 3 then  --  Journal Entry Type: Chapter
            local parentId = math.floor(id / 1000000) * 1000000
            Ext.Print(parentId)
            for pos, target in ipairs(Journal.Component.ChapterEntryMap[parentId]) do
                if target == id then
                    if Journal.Component.ChapterEntryMap[parentId][pos+1] ~= nil then
                        local swap = Journal.Component.ChapterEntryMap[parentId][pos]
                        Journal.Component.ChapterEntryMap[parentId][pos] = Journal.Component.ChapterEntryMap[parentId][pos+1]
                        Journal.Component.ChapterEntryMap[parentId][pos+1] = swap
                    else
                        Journal.Component.ChapterEntryMap[parentId][pos] = nil
                    end
                end
            end
            Journal.Component.ParagraphEntryMap[id] = nil
        
            --  PARAGRAPH
            --  ---------

        elseif zeroes < 3 then  --  Journal Entry Type: Paragraph
            local parentId = math.floor(id / 1000) * 1000
                    Ext.Print(parentId)
            for pos, target in ipairs(Journal.Component.ParagraphEntryMap[parentId]) do
                if target == id then
                    if Journal.Component.ParagraphEntryMap[parentId][pos+1] ~= nil then
                        Journal.Component.ParagraphEntryMap[parentId][pos] = Journal.Component.ParagraphEntryMap[parentId][pos+1]
                        Journal.Component.ParagraphEntryMap[parentId][pos+1] = target
                    else
                        Journal.Component.ParagraphEntryMap[parentId][pos] = nil
                    end
                end
            end
        end
    end)

    Ext.RegisterUICall(Journal.UI, "S7_UI_Journal_Hide", function(ui, call, ...)
        Journal.UI:Hide()
    end)

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

    --  -------------
    --  SPECS HANDLER
    --  -------------

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "Component" then
                if SpecsHandler["Journal"][key] ~= nil then
                    SpecsHandler["Journal"][key](value)
                end
            elseif key == "SubComponent" then
                for k, v in pairs(value) do
                    if SpecsHandler["Journal"][key][k] ~= nil then
                        SpecsHandler["Journal"][key][k](v)
                    end
                end
            elseif key == "JournalData" then
                if SpecsHandler["Journal"][key] ~= nil then
                    SpecsHandler["Journal"][key](value)
                end
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
    Journal.JournalData = Ext.JsonParse(JournalData)

    --  BUILD JOURNAL
    --  =============
    
    local function buildJournal(journalEntry)
        local object = nil
        if journalEntry ~= nil then
            for _, data in pairs(journalEntry) do
                if Journal.Root.entriesMap ~= nil and data ~= nil and data["entriesMapId"] ~= nil then
                    object = Journal.Root.entriesMap[data["entriesMapId"]] or nil -- Get MovieClip Object
                end
                
                if object == nil then   --  if MovieClip Object does not exist

                    local posTable = {
                        [1] = #Journal.Component.CategoryEntryMap,
                        [2] = #Journal.Component.ChapterEntryMap,
                        [3] = #Journal.Component.ParagraphEntryMap,
                    }
                    
                    --  Update Entries
                    --  ==============

                    Journal.Root.entries[0] = data["JournalNodeType"]
                    Journal.Root.entries[1] = posTable[data["JournalNodeType"]]
                    Journal.Root.entries[2] = data["entriesMapId"]
                    Journal.Root.entries[3] = data["parentMapId"]
                    Journal.Root.entries[4] = data["StringContent"]
                    Journal.Root.entries[5] = data["isShared"]
                    Journal.Root.updateEntries()

                    --  Update MetaData
                    --  ===============

                    if data.JournalNodeType == 1 then
                        Journal.Component.CategoryEntryMap[posTable[data.JournalNodeType] + 1] = data.entriesMapId
                        Journal.Component.ChapterEntryMap[Journal.Component.CategoryEntryMap[posTable[data.JournalNodeType] + 1]] = {}
                    elseif data.JournalNodeType == 2 then
                        Journal.Component.ChapterEntryMap[data.parentMapId][posTable[data.JournalNodeType] + 1] = data.entriesMapId
                        Journal.Component.ParagraphEntryMap[Journal.Component.ChapterEntryMap[data.parentMapId][posTable[data.JournalNodeType] + 1]] = {}
                    elseif data.JournalNodeType == 3 then
                        if Journal.Component.ParagraphEntryMap[data.parentMapId] == nil then
                            Journal.Component.ParagraphEntryMap[data.parentMapId] = {}
                        end
                        Journal.Component.ParagraphEntryMap[data.parentMapId][posTable[data.JournalNodeType] + 1] = data.entriesMapId
                    end
                else
                    object.editableElement_mc.updateText(data.StringContent)
                    object.editableElement_mc.setShared(data.isShared)
                end

                --  Recursions
                --  ==========

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

--  ===============
--  FUNCTION MAPPER
--  ===============

SpecsHandler["Journal"] = {
    --  ==============
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

        Journal.Component.CategoryEntryMap = Component.CategoryEntryMap or Journal.Component.CategoryEntryMap
        Journal.Component.ChapterEntryMap = Component.ChapterEntryMap or Journal.Component.ChapterEntryMap
        Journal.Component.ParagraphEntryMap = Component.ParagraphEntryMap or Journal.Component.ParagraphEntryMap
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponent"] = {},
    ['JournalData'] = function (data)
        UpdateJournal(Ext.JsonStringify(data))
    end
}
