--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")

--  =======
--  Journal
--  =======

Journal = {}

function ReinitializeJournal()
    local defaultJournal = {
        ["Exists"] = false, --  Whether journal element exists
        ["Created"] = false,
        ["RegisteredListeners"] = false,
        ["Element"] = {
            ["UI"] = {}, -- The actual element
            ["Root"] = {} --  Root Object
        },
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

    Ext.RegisterUICall(Journal.Element.UI, 'addCategory', function (ui, call, ...)
        Journal.Element.Root.entries[0] = 1 --  Journal Node Type 1: Category

        local Pos = #Journal.Component.CategoryEntryMap --  Get Position Index
        Journal.Element.Root.entries[1] = Pos   --  Set Position Index

        Journal.Component.CategoryEntryMap[Pos + 1] = Ext.Random(1, 999) * 1000000  --  Generate EntriesMapID
        Journal.Component.ChapterEntryMap[Journal.Component.CategoryEntryMap[Pos + 1]] = {} --  Initialize Chapter-Table for generated entry

        Journal.Element.Root.entries[2] = Journal.Component.CategoryEntryMap[Pos + 1]   --  Set EntriesMapID
        Journal.Element.Root.entries[3] = Journal.Component.CategoryEntryMap[Pos + 1]   --  Set ParentMapID
        Journal.Element.Root.entries[4] = "New Category"    --  Set Entry String Content
        Journal.Element.Root.entries[5] = false --  Set Entry isShared Boolean

        Journal.Element.Root.updateEntries()    --   Update Entries: MainTimeline Event.
    end)

    --  ADD CHAPTER
    --  ===========

    Ext.RegisterUICall(Journal.Element.UI, 'addChapter', function (ui, call, id)
        Journal.Element.Root.entries[0] = 2 --  Journal Node Type 2: Chapter

        local Pos = #Journal.Component.ChapterEntryMap[id]  --  Get Position Index
        Journal.Element.Root.entries[1] = Pos   --  Set Position

        Journal.Component.ChapterEntryMap[id][Pos + 1] = id + Ext.Random(1, 999) * 1000 --  Generate EntriesMapID
        Journal.Component.ParagraphEntryMap[Journal.Component.ChapterEntryMap[id][Pos + 1]] = {}    -- Initialize Paragraph-Table for generated entry

        Journal.Element.Root.entries[2] = Journal.Component.ChapterEntryMap[id][Pos + 1]    --  Set EntriesMapID
        Journal.Element.Root.entries[3] = id    --  Set ParentMapID
        Journal.Element.Root.entries[4] = "New Chapter" --  Set Entry String Content
        Journal.Element.Root.entries[5] = false -- Set Entry isShared Boolean
        
        Journal.Element.Root.updateEntries()    --  Update Entries: MainTimeline Event.
    end)

    --  ADD PARAGRAPH
    --  =============

    Ext.RegisterUICall(Journal.Element.UI, 'addParagraph', function (ui, call, id)
        Journal.Element.Root.entries[0] = 3 --  Journal Node Type 3: Paragraph

        local Pos = #Journal.Component.ParagraphEntryMap[id]    -- Get Position Index
        Journal.Element.Root.entries[1] = Pos   --  Set Position Index

        Journal.Component.ParagraphEntryMap[id][Pos + 1] = id + Ext.Random(1, 999)  --  Generate EntriesMapID

        Journal.Element.Root.entries[2] = Journal.Component.ParagraphEntryMap[id][Pos + 1]  --  Set EntriesMapID
        Journal.Element.Root.entries[3] = id    --  Set ParentMapID
        Journal.Element.Root.entries[4] = "New Paragraph"   -- Set Entry String Content
        Journal.Element.Root.entries[5] = false -- Set Entry isShared Boolean

        Journal.Element.Root.updateEntries()    -- Update Entries: MainTimeline Event.
    end)

    --  REMOVE NODES
    --  ============

    Ext.RegisterUICall(Journal.Element.UI, 'removeNode', function(ui, call, id)
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

    Ext.RegisterUICall(Journal.Element.UI, "S7HideUI", function(ui, call, ...)
        Journal.Exists = false
        Journal.Element.UI:Hide()
    end)

    Journal.RegisteredListeners = true
end

--  ########################################################################################################################################

--  ==============
--  RENDER JOURNAL
--  ==============

function RenderJournal(Specs)
    if Journal.Exists ~= true then
        --  --------------
        --  Create Journal
        --  --------------

        ReinitializeJournal()
        
        if Journal.Created == false then 
            Ext.CreateUI("S7Journal", Dir.ModGUI .. "GMJournal.swf", 10)
            Journal.Element.UI = Ext.GetUI("S7Journal")
            Journal.Element.Root = Journal.Element.UI:GetRoot()
            Journal.Created = true
        end
        
        FunctionMapper["Journal"]["Component"](Specs["Component"])
        
        if Journal.RegisteredListeners == false then RegisterJournalListeners() end
    end

    Journal.Exists = true

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "Component" then
                if FunctionMapper["Journal"][key] ~= nil then
                    FunctionMapper["Journal"][key](value)
                end
            elseif key == "SubComponent" then
                for k, v in pairs(value) do
                    if FunctionMapper["Journal"][key][k] ~= nil then
                        FunctionMapper["Journal"][key][k](v)
                    end
                end
            elseif key == "JournalData" then
                Journal.JournalData = Rematerialize(value)
            end
        end
    end

    --  ------------------
    --  Render Immediately
    --  ------------------

    if Journal.Component.renderImmediately == false then
        Journal.Element.UI:Hide()
    end

    Journal.Element.UI:Show()

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
        for i = 1, #journalEntry do
            local object = Journal.Element.Root.entriesMap[journalEntry[i].entriesMapId] -- Get MovieClip Object

            if object == nil then   --  if MovieClip Object does not exist

                local posTable = {
                    [1] = #Journal.Component.CategoryEntryMap,
                    [2] = #Journal.Component.ChapterEntryMap,
                    [3] = #Journal.Component.ParagraphEntryMap,
                }

                --  Update Entries
                --  ==============

                Journal.Element.Root.entries[0] = journalEntry[i].JournalNodeType
                Journal.Element.Root.entries[1] = posTable[journalEntry[i].JournalNodeType]
                Journal.Element.Root.entries[2] = journalEntry[i].entriesMapId
                Journal.Element.Root.entries[3] = journalEntry[i].parentMapId
                Journal.Element.Root.entries[4] = journalEntry[i].StringContent
                Journal.Element.Root.entries[5] = journalEntry[i].isShared
                Journal.Element.Root.updateEntries()

                --  Update MetaData
                --  ===============

                if journalEntry[i].JournalNodeType == 1 then
                    Journal.Component.CategoryEntryMap[posTable[journalEntry[i].JournalNodeType] + 1] = journalEntry[i].entriesMapId
                    Journal.Component.ChapterEntryMap[Journal.Component.CategoryEntryMap[posTable[journalEntry[i].JournalNodeType] + 1]] = {}
                elseif journalEntry[i].JournalNodeType == 2 then
                    Journal.Component.ChapterEntryMap[journalEntry[i].parentMapId][posTable[journalEntry[i].JournalNodeType] + 1] = journalEntry[i].entriesMapId
                    Journal.Component.ParagraphEntryMap[Journal.Component.ChapterEntryMap[journalEntry[i].parentMapId][posTable[journalEntry[i].JournalNodeType] + 1]] = {}
                elseif journalEntry[i].JournalNodeType == 3 then
                    Journal.Component.ParagraphEntryMap[journalEntry[i].parentMapId][posTable[journalEntry[i].JournalNodeType] + 1] = journalEntry[i].entriesMapId
                end
            else
                object.editableElement_mc.updateText(journalEntry[i].StringContent);
                object.editableElement_mc.setShared(journalEntry[i].isShared);
            end

            --  Recursions
            --  ==========

            if journalEntry[i].Chapters ~= nil or journalEntry[i].Paragraphs ~= nil then
                buildJournal(Rematerialize(journalEntry[i].Chapters or journalEntry[i].Paragraphs))
            end
        end
    end

    --  Function Call
    buildJournal(Journal.JournalData)
end

--  ===============
--  FUNCTION MAPPER
--  ===============

FunctionMapper["Journal"] = {
    --  ==============
    --  MAIN COMPONENT
    --  ==============

    ["Component"] = function(Component)
        
        local function determineString(Component, str)
            local val = ""
            if Component[str] == "" or Component[str] == nil then
                val = Journal.Component.Strings[str]
            else
                val = Component.Strings[str]
            end
            return val
        end
        
        if Journal.Element.Root.strings ~= nil then
            Journal.Element.Root.strings.caption = determineString(Component, "caption")
            Journal.Element.Root.strings.editButtonCaption = determineString(Component, "editButtonCaption")
            Journal.Element.Root.strings.addChapter = determineString(Component, "addChapter")
            Journal.Element.Root.strings.addCategory = determineString(Component, "addCategory")
            Journal.Element.Root.strings.addParagraph = determineString(Component, "addParagraph")
            Journal.Element.Root.strings.shareWithParty = determineString(Component, "shareWithParty")
        end

        Journal.Element.Root.updateCaptions()
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponent"] = {},
    }
