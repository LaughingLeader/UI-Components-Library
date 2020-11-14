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
            }
        }
    }
    return defaultJournal
end

Journal = Rematerialize(ReinitializeJournal())

--  ##########################################################################################################

function RenderJournal(Specs)
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
