--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")

--  ======
--  MsgBox
--  ======

MsgBox = {}

--  Reinitialize MsgBox
--  ===================

function ReinitializeMsgBox()
    local defaultMsgBox = {
        ["Exists"] = false, --  MsgBox element exists
        ["Element"] = {
            ["UI"] = {}, -- The actual element
            ["Root"] = {} --  Root Object
        },
        --  --------------
        --  Main Component
        --  --------------
        ["Component"] = {
            ["Name"] = "MsgBox", --  Name of UI element
            ["PopupType"] = 1, --  Variant
            ["Size"] = {["Width"] = 760, ["Height"] = 430},
            ["Position"] = {["X"] = 580, ["Y"] = 330},
            ["BackgroundSize"] = {["Width"] = 760, ["Height"] = 427.95},
            ["BackgroundPosition"] = {["X"] = 0, ["Y"] = 0},
            ["Order"] = "NoOrder",
            ["flexStart"] = 70,
            ["padding"] = 20,
            ["Visible"] = false, -- Visibility
            ["renderImmediately"] = true --  Visible as soon as created
        },
        --  --------------
        --  Sub Components
        --  --------------
        ["SubComponent"] = {
            --  TITLE
            --  -----
            ["Title"] = {
                ["Name"] = "Title", --  Sub-Component Name
                ["TitleText"] = "", --  Default Value
                ["Size"] = {["Width"] = 500, ["Height"] = 45},
                ["Position"] = {["X"] = 130, ["Y"] = 70},
                ["Visible"] = false --  Visiblility
            },
            --  TEXT
            --  ----
            ["Text"] = {
                ["Name"] = "Text", --  Sub-Component Name
                ["Text"] = "", --  Default Value
                ["Size"] = {["Width"] = 480, ["Height"] = 148.2},
                ["Position"] = {["X"] = 130, ["Y"] = 120},
                ["Type"] = 1,
                ["Visible"] = false --  Visiblility
            },
            --  INPUT-TEXT
            --  ----------
            ["InputText"] = {
                ["Name"] = "InputText", --  Sub-Component Name
                ["InputText"] = "", --  Default Value
                ["Type"] = 1,
                ["MinChar"] = 0, --  Minimum number of input characters
                ["MaxChar"] = 46, --  Maximum number of input characters
                ["CopyBtnVisible"] = false, --  Copy from input-field Button Visibility
                ["PasteBtnVisible"] = false, -- Paste to input-field Button Visibility
                ["Size"] = {["Width"] = 475, ["Height"] = 50},
                ["Position"] = {["X"] = 145, ["Y"] = 120},
                ["Visible"] = false --  Visiblility
            }
        }
    }
    return defaultMsgBox
end

MsgBox = Rematerialize(ReinitializeMsgBox())

--  ###################################################################################################################################################

--  ==================
--  RENDER MESSAGE-BOX
--  ==================

function RenderMsgBox(Specs)
    if MsgBox.Exists ~= true then
        --  -------------
        --  Create MsgBox
        --  -------------

        ReinitializeMsgBox()
        MsgBox.Element.UI = Ext.GetBuiltinUI(Dir.GameGUI .. "MsgBox.swf")
        MsgBox.Element.Root = MsgBox.Element.UI:GetRoot()
    end

    MsgBox.Exists = true

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "Component" then
                if FunctionMapper["MsgBox"][key] ~= nil then
                    FunctionMapper["MsgBox"][key](value)
                end
            elseif key == "SubComponent" then
                for k, v in pairs(value) do
                    if FunctionMapper["MsgBox"][key][k] ~= nil then
                        FunctionMapper["MsgBox"][key][k](v)
                    end
                end
            end
        end
    end

    local order = {}
    for k, v in pairs(Specs.SubComponent) do
        if v.Order ~= nil then
            order[v.Order] = k
        end
    end

    if Specs.Component.Order ~= "WithSpecification" then
        for k, v in pairs(Specs.SubComponent) do
            if v.Order == nil then
                order[#order + 1] = k
            end
        end
    end

    local flexStart = MsgBox.Component.flexStart
    if Specs.Component.Order ~= "NoOrder" then
        for index, element in ipairs(order) do
            if element == "Title" then
                MsgBox.Element.Root.popup_mc.title_txt.y = flexStart
                flexStart = flexStart + MsgBox.Element.Root.popup_mc.title_txt.height + MsgBox.Component.padding
            elseif element == "Text" then
                MsgBox.Element.Root.popup_mc.text_mc.y = flexStart
                flexStart = flexStart + MsgBox.Element.Root.popup_mc.text_mc.height + MsgBox.Component.padding
            elseif element == "InputText" then
                MsgBox.Element.Root.popup_mc.input_mc.y = flexStart
                flexStart = flexStart + MsgBox.Element.Root.popup_mc.input_mc.height + MsgBox.Component.padding
            end
        end
    end
    --  ------------------
    --  Render Immediately
    --  ------------------

    if MsgBox.Component.renderImmediately == false then
        MsgBox.Element.UI:Hide()
    end

    MsgBox.Element.UI:Show()

    return MsgBox
end

--  ===============
--  FUNCTION MAPPER
--  ===============

FunctionMapper["MsgBox"] = {
    --  ==============
    --  MAIN COMPONENT
    --  ==============

    ["Component"] = function(Component)
        MsgBox.Element.UI:Invoke("setPopupType", Component.PopupType or MsgBox.Component.PopupType)
        MsgBox.Element.Root.popup_mc.visible = Component.Visible or MsgBox.Component.Visible
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponent"] = {
        --      TITLE
        --      -----

        ["Title"] = function(SubComponent)
            MsgBox.Element.UI:Invoke("setTitleText", SubComponent.TitleText or MsgBox.SubComponent.Title.TitleText)
            MsgBox.Element.Root.popup_mc.title_txt.visible = SubComponent.Visible or MsgBox.SubComponent.Title.Visible
        end,
        --      TEXT
        --      ----

        ["Text"] = function(SubComponent)
            MsgBox.Element.UI:Invoke("setText", SubComponent.Text or MsgBox.SubComponent.Text.Text)
            MsgBox.Element.Root.popup_mc.text_mc.gotoAndStop(SubComponent.Type or MsgBox.SubComponent.Text.Type)
            MsgBox.Element.Root.popup_mc.text_mc.visible = SubComponent.Visible or MsgBox.SubComponent.Title.Visible
        end,
        --      INPUT-TEXT
        --      ----------

        ["InputText"] = function(SubComponent)
            MsgBox.Element.UI:Invoke(
                "setInputEnabled",
                SubComponent.Visible or MsgBox.SubComponent.InputText.Visible,
                SubComponent.MinChar or MsgBox.SubComponent.InputText.MinChar,
                SubComponent.MaxChar or MsgBox.SubComponent.InputText.MaxChar
            )
            MsgBox.Element.UI:Invoke("setInputText", SubComponent.InputText or MsgBox.SubComponent.InputText.InputText)
            MsgBox.Element.UI:Invoke(
                "setCopyBtnVisible",
                SubComponent.CopyBtnVisible or MsgBox.SubComponent.InputText.CopyBtnVisible
            )
            MsgBox.Element.Root.popup_mc.input_mc.gotoAndStop(SubComponent.Type or MsgBox.SubComponent.InputText.Type)
            MsgBox.Element.UI:Invoke(
                "setPasteBtnVisible",
                SubComponent.PasteBtnVisible or MsgBox.SubComponent.InputText.PasteBtnVisible
            )
        end
    }
}

--  ###################################################################################################################################################

function S7_OpenMessageBox(TitleText, Text)
    BuildSpecifications.MsgBox.SubComponent.Title.TitleText = TitleText
    if type(Text) == "string" then
        BuildSpecifications.MsgBox.SubComponent.Text.Text = Text
    elseif type(Text) == "table" then
        local concat = ""
        for _, txt in ipairs(Text) do
            local translatedString = Ext.GetTranslatedStringFromKey(txt)
            if translatedString ~= "" then
                concat = concat .. translatedString
            else
                concat = concat .. txt
            end
        end
        BuildSpecifications.MsgBox.SubComponent.Text.Text = concat
    end

    S7_UCL_Build()
end

Ext.RegisterConsoleCommand("YOLO", S7_OpenMessageBox)
