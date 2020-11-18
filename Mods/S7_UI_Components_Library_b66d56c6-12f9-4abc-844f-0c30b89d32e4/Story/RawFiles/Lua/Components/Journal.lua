--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")

--  =======
--  Journal
--  =======

Journal = {}

function ReinitializeJournal()
    defaultJournal = {
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
            ["SortedPositionsMap"] = {},
            ["SortedChapterPositionsMap"] = {},
            ["SortedParagraphPositionsMap"] = {}
        }
    }
    return defaultJournal
end

Journal = Rematerialize(ReinitializeJournal())

--  ##########################################################################################################

function renderJournal(Specs)
    if Journal.Exists ~= true then
        --  --------------
        --  Create Journal
        --  --------------

        ReinitializeJournal()
        Ext.CreateUI("S7Journal", Dir.ModGUI .. "GMJournal.swf", 10)
        Journal.Element.UI = Ext.GetUI("S7Journal")
        Journal.Element.Root = Journal.Element.UI:GetRoot()
    end

    Journal.Exists = true

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "Component" then
                if functionMapper["Journal"][key] ~= nil then
                    functionMapper["Journal"][key](value)
                end
            elseif key == "SubComponent" then
                for k, v in pairs(value) do
                    if functionMapper["Journal"][key][k] ~= nil then
                        functionMapper["Journal"][key][k](v)
                    end
                end
            end
        end
    end

    Ext.RegisterUICall(Journal.Element.UI, 'addCategory', function (ui, call, ...)
        Journal.Element.Root.entries[0] = 1 --  Journal Node Type 1

        local newCatPos = #Journal.Component.SortedPositionsMap 

        Journal.Element.Root.entries[1] = newCatPos
        
        Journal.Component.SortedPositionsMap[newCatPos + 1] = math.floor(newCatPos + 1) * 10000
        Journal.Component.SortedChapterPositionsMap[Journal.Component.SortedPositionsMap[newCatPos + 1]] = {}
        
        Journal.Element.Root.entries[2] = Journal.Component.SortedPositionsMap[newCatPos + 1]
        Journal.Element.Root.entries[3] = Journal.Component.SortedPositionsMap[newCatPos + 1]
        Journal.Element.Root.entries[4] = "New Category"
        Journal.Element.Root.entries[5] = false

        Journal.Element.Root.updateEntries()
    end)
    Ext.RegisterUICall(Journal.Element.UI, 'removeNode', function(ui, call, id)
        local targetPos = 1000000
        for pos, target in ipairs(Journal.Component.SortedPositionsMap) do
            if target == id then
                Journal.Component.SortedPositionsMap[pos] = nil
                targetPos = pos
            end
            if pos > targetPos then
                Journal.Component.SortedPositionsMap[pos - 1] = target
            end
            Journal.Component.SortedPositionsMap[#Journal.Component.SortedPositionsMap] = nil
            Journal.Component.SortedChapterPositionsMap[id] = nil
        end
    end)
    Ext.RegisterUICall(Journal.Element.UI, 'addChapter', function (ui, call, objid)
        local id = objid

        Journal.Element.Root.entries[0] = 2

        local newCatPos = #Journal.Component.SortedChapterPositionsMap[id] or 0 

        Journal.Element.Root.entries[1] = newCatPos
        Journal.Component.SortedChapterPositionsMap[id][newCatPos + 1] = id + newCatPos * 100
        Journal.Component.SortedParagraphPositionsMap[Journal.Component.SortedChapterPositionsMap[id][newCatPos + 1]] = {}
        Journal.Element.Root.entries[2] = Journal.Component.SortedChapterPositionsMap[id][newCatPos + 1]
        Journal.Element.Root.entries[3] = id
        Journal.Element.Root.entries[4] = "New Chapter"
        Journal.Element.Root.entries[5] = false
        Journal.Element.Root.updateEntries()
    end)
    Ext.RegisterUIInvokeListener(Journal.Element.UI, "onChapterDestroy", function(ui, call, obj) 
        local id = obj.id
        local targetPos = 1000000
        for pos, target in ipairs(Journal.Component.SortedChapterPositionsMap[id]) do
            if target == id then
                Journal.Component.SortedChapterPositionsMap[id][pos] = nil
                targetPos = pos
            end
            if pos > targetPos then
                Journal.Component.SortedChapterPositionsMap[id][pos - 1] = target
            end
            Journal.Component.SortedChapterPositionsMap[id][#Journal.Component.SortedChapterPositionsMap[id]] = nil
            Journal.Component.SortedParagraphPositionsMap[id] = nil
        end
    end)
    Ext.RegisterUICall(Journal.Element.UI, 'addParagraph', function (ui, call, ...)
        local args = {...}
        local id = args[1]

        Ext.Print(id)

        Journal.Element.Root.entries[0] = 3

        local newCatPos = #Journal.Component.SortedParagraphPositionsMap[id] or 0

        Journal.Element.Root.entries[1] = newCatPos
        Journal.Component.SortedParagraphPositionsMap[id][newCatPos + 1] = id + newCatPos

        Journal.Element.Root.entries[2] = Journal.Component.SortedParagraphPositionsMap[id][newCatPos + 1]
        Journal.Element.Root.entries[3] = id
        Journal.Element.Root.entries[4] = "New Paragraph"
        Journal.Element.Root.entries[5] = false
    Ext.Print(Ext.JsonStringify({
        Journal.Element.Root.entries[0],
        Journal.Element.Root.entries[1],
        Journal.Element.Root.entries[2],
        Journal.Element.Root.entries[3],
        Journal.Element.Root.entries[4],
        Journal.Element.Root.entries[5],
        Journal.Element.Root.entries[6],
    }))
        Journal.Element.Root.updateEntries()
    end)
    Ext.RegisterUIInvokeListener(Journal.Element.UI, "onParagraphDestroy", function(ui, call, obj) 
        local id = obj.id
        local targetPos = 1000000
        for pos, target in ipairs(Journal.Component.SortedParagraphPositionsMap[id]) do
            if target == id then
                Journal.Component.SortedParagraphPositionsMap[id][pos] = nil
                targetPos = pos
            end
            if pos > targetPos then
                Journal.Component.SortedParagraphPositionsMap[id][pos - 1] = target
            end
            Journal.Component.SortedParagraphPositionsMap[id][#Journal.Component.SortedParagraphPositionsMap[id]] = nil
        end
    end)

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

functionMapper["Journal"] = {
    --  ==============
    --  MAIN COMPONENT
    --  ==============

    ["Component"] = function(Component)
        Journal.Element.Root.strings.caption = Component.Strings.caption or Journal.Component.Strings.caption
        Journal.Element.Root.strings.editButtonCaption =
            Component.Strings.editButtonCaption or Journal.Component.Strings.editButtonCaption
        Journal.Element.Root.strings.addChapter = Component.Strings.addChapter or Journal.Component.Strings.addChapter
        Journal.Element.Root.strings.addCategory =
            Component.Strings.addCategory or Journal.Component.Strings.addCategory
        Journal.Element.Root.strings.addParagraph =
            Component.Strings.addParagraph or Journal.Component.Strings.addParagraph
        Journal.Element.Root.strings.shareWithParty =
            Component.Strings.shareWithParty or Journal.Component.Strings.shareWithParty
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponent"] = {}
}