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
        ["Exists"] = false, --  Journal element exists
        ["Element"] = {
            ["UI"] = {}, -- The actual element
            ["Root"] = {} --  Root Object
        },
        ["Component"] = {
            ["Strings"] = {
                ["caption"] = "Your Journal",
                ["editButtonCaption"] = "TOGGLE EDIT MODE",
                ["addChapter"] = "Add New Chapter",
                ["addCategory"] = "Add New Category",
                ["addParagraph"] = "Add New Entry...",
                ["shareWithParty"] = "Share with Party"
            },
            ["SortedPositionsMap"] = {
                -- [1] = 10000,
                -- [2] = 20000,
            },
            ["SortedChapterPositionsMap"] = {
                -- [10000] = { [1] = 10100, [2] = 10200 }
                -- [20000] = { [1] = 20100, [2] = 20200 }
            },
            ["SortedParagraphPositionsMap"] = {
                -- [10100] = { [1] = 10101, [2] = 10102 }
                -- [10200] = { [1] = 10201, [2] = 10202 }
                -- [20100] = { [1] = 20101, [2] = 20102 }
                -- [20200] = { [1] = 20201, [2] = 20202 }
            }
        },
        ["JournalData"] = {
            {
                ["entriesMapId"] = 10000,
                ["parentMapId"] = 10000,
                ["StringContent"] = "Category One",
                ["isShared"] = false,
                ["Chapters"] = {
                    {
                        ["entriesMapId"] = 10100,
                        ["parentMapId"] = 10000,
                        ["StringContent"] = "Chapter 1",
                        ["isShared"] = false,
                        ["Paragraphs"] = {
                            {
                                ["entriesMapId"] = 10101,
                                ["parentMapId"] = 10100,
                                ["StringContent"] = "Paragraph One",
                                ["isShared"] = false
                            },
                            {
                                ["entriesMapId"] = 10102,
                                ["parentMapId"] = 10100,
                                ["StringContent"] = "Paragraph Two",
                                ["isShared"] = false,
                            }
                        }
                    },
                    {
                        ["entriesMapId"] = 10200,
                        ["parentMapId"] = 10000,
                        ["StringContent"] = "Chapter 2",
                        ["isShared"] = false,
                        ["Paragraphs"] = {
                            [1] = {
                                ["entriesMapId"] = 10201,
                                ["parentMapId"] = 10200,
                                ["StringContent"] = "Paragraph Three",
                                ["isShared"] = false
                            }
                        }
                    }
                }
            },
            {
                ["entriesMapId"] = 20000,
                ["parentMapId"] = 20000,
                ["StringContent"] = "Category Two",
                ["isShared"] = false,
                ["Chapters"] = {
                    {
                        ["entriesMapId"] = 20100,
                        ["parentMapId"] = 20000,
                        ["StringContent"] = "Chapter 3",
                        ["isShared"] = false,
                        ["Paragraphs"] = {
                            {
                                ["entriesMapId"] = 20101,
                                ["parentMapId"] = 20100,
                                ["StringContent"] = "Paragraph Four",
                                ["isShared"] = false
                            }
                        }
                    }
                }
            }
        }
    }
    return defaultJournal
end

Journal = Rematerialize(ReinitializeJournal())

--  ##########################################################################################################

local function printMaps()
    Ext.Print(Ext.JsonStringify({
        Journal.Component.SortedPositionsMap,
        Journal.Component.SortedChapterPositionsMap,
        Journal.Component.SortedParagraphPositionsMap,
    }))
end

local function getTrailingZeroes(n)
    local count = 0
    local i = 10
    while n % i == 0 do
        count = count + 1
        i = i * 10
    end
    return count
end

--  ==========================
--  REGISTER JOURNAL LISTENERS
--  ==========================

local function RegisterJournalListeners()
    Ext.RegisterUICall(Journal.Element.UI, 'addCategory', function (ui, call, ...)
        Journal.Element.Root.entries[0] = 1 --  Journal Node Type 1

        local Pos = #Journal.Component.SortedPositionsMap

        Journal.Element.Root.entries[1] = Pos

        Journal.Component.SortedPositionsMap[Pos + 1] = Ext.Random(1, 999) * 1000000
        Journal.Component.SortedChapterPositionsMap[Journal.Component.SortedPositionsMap[Pos + 1]] = {}

        Journal.Element.Root.entries[2] = Journal.Component.SortedPositionsMap[Pos + 1]
        Journal.Element.Root.entries[3] = Journal.Component.SortedPositionsMap[Pos + 1]
        Journal.Element.Root.entries[4] = "New Category"
        Journal.Element.Root.entries[5] = false

        Journal.Element.Root.updateEntries()
        printMaps()
    end)

    Ext.RegisterUICall(Journal.Element.UI, 'addChapter', function (ui, call, id)
        Journal.Element.Root.entries[0] = 2

        local Pos = #Journal.Component.SortedChapterPositionsMap[id]

        Journal.Element.Root.entries[1] = Pos
        Journal.Component.SortedChapterPositionsMap[id][Pos + 1] = id + Ext.Random(1, 999) * 1000
        Journal.Component.SortedParagraphPositionsMap[Journal.Component.SortedChapterPositionsMap[id][Pos + 1]] = {}
        Journal.Element.Root.entries[2] = Journal.Component.SortedChapterPositionsMap[id][Pos + 1]
        Journal.Element.Root.entries[3] = id
        Journal.Element.Root.entries[4] = "New Chapter"
        Journal.Element.Root.entries[5] = false
        
        Journal.Element.Root.updateEntries()
        printMaps()
    end)

    Ext.RegisterUICall(Journal.Element.UI, 'addParagraph', function (ui, call, id)
        Journal.Element.Root.entries[0] = 3

        local Pos = #Journal.Component.SortedParagraphPositionsMap[id]

        Journal.Element.Root.entries[1] = Pos
        Journal.Component.SortedParagraphPositionsMap[id][Pos + 1] = id + Ext.Random(1, 999)

        Journal.Element.Root.entries[2] = Journal.Component.SortedParagraphPositionsMap[id][Pos + 1]
        Journal.Element.Root.entries[3] = id
        Journal.Element.Root.entries[4] = "New Paragraph"
        Journal.Element.Root.entries[5] = false

        Journal.Element.Root.updateEntries()
        printMaps()
    end)

    Ext.RegisterUICall(Journal.Element.UI, 'removeNode', function(ui, call, id)
        
        local zeroes = getTrailingZeroes(id)

        Ext.Print(zeroes)

        if zeroes >= 6 then
            for pos, target in ipairs(Journal.Component.SortedPositionsMap) do
                if target == id then
                    if Journal.Component.SortedPositionsMap[pos+1] ~= nil then
                        local swap = Journal.Component.SortedPositionsMap[pos]
                        Journal.Component.SortedPositionsMap[pos] = Journal.Component.SortedPositionsMap[pos+1]
                        Journal.Component.SortedPositionsMap[pos+1] = swap
                    else
                        Journal.Component.SortedPositionsMap[pos] = nil
                    end
                end
            end
            Journal.Component.SortedChapterPositionsMap[id] = nil
        
        elseif zeroes < 6 and zeroes >= 3 then
            local parentId = math.floor(id / 1000000) * 1000000
            Ext.Print(parentId)
            for pos, target in ipairs(Journal.Component.SortedChapterPositionsMap[parentId]) do
                if target == id then
                    if Journal.Component.SortedChapterPositionsMap[parentId][pos+1] ~= nil then
                        local swap = Journal.Component.SortedChapterPositionsMap[parentId][pos]
                        Journal.Component.SortedChapterPositionsMap[parentId][pos] = Journal.Component.SortedChapterPositionsMap[parentId][pos+1]
                        Journal.Component.SortedChapterPositionsMap[parentId][pos+1] = swap
                    else
                        Journal.Component.SortedChapterPositionsMap[parentId][pos] = nil
                    end
                end
            end
            Journal.Component.SortedParagraphPositionsMap[id] = nil
        
        elseif zeroes < 3 then
            local parentId = math.floor(id / 1000) * 1000
                    Ext.Print(parentId)
            for pos, target in ipairs(Journal.Component.SortedParagraphPositionsMap[parentId]) do
                if target == id then
                    if Journal.Component.SortedParagraphPositionsMap[parentId][pos+1] ~= nil then
                        Journal.Component.SortedParagraphPositionsMap[parentId][pos] = Journal.Component.SortedParagraphPositionsMap[parentId][pos+1]
                        Journal.Component.SortedParagraphPositionsMap[parentId][pos+1] = target
                    else
                        Journal.Component.SortedParagraphPositionsMap[parentId][pos] = nil
                    end
                end
            end
        end
        printMaps()
    end)
end

function RenderJournal(Specs)
    if Journal.Exists ~= true then
        --  --------------
        --  Create Journal
        --  --------------

        ReinitializeJournal()
        Ext.CreateUI("S7Journal", Dir.ModGUI .. "GMJournal.swf", 10)
        Journal.Element.UI = Ext.GetUI("S7Journal")
        Journal.Element.Root = Journal.Element.UI:GetRoot()
        RegisterJournalListeners()
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

--  ===============
--  FUNCTION MAPPER
--  ===============

FunctionMapper["Journal"] = {
    --  ==============
    --  MAIN COMPONENT
    --  ==============

    ["Component"] = function(Component)
        if Journal.Element.Root.strings ~= nil then
            Journal.Element.Root.strings.caption = Component.Strings.caption or Journal.Component.Strings.caption
            Journal.Element.Root.strings.editButtonCaption = Component.Strings.editButtonCaption or Journal.Component.Strings.editButtonCaption
            Journal.Element.Root.strings.addChapter = Component.Strings.addChapter or Journal.Component.Strings.addChapter
            Journal.Element.Root.strings.addCategory = Component.Strings.addCategory or Journal.Component.Strings.addCategory
            Journal.Element.Root.strings.addParagraph = Component.Strings.addParagraph or Journal.Component.Strings.addParagraph
            Journal.Element.Root.strings.shareWithParty = Component.Strings.shareWithParty or Journal.Component.Strings.shareWithParty
        end
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponent"] = {},
    }
