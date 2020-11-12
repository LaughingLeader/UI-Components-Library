--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")

--  ======
--  msgBox
--  ======

msgBox = {}

--  Reinitialize msgBox
--  ===================

function ReinitializeMsgBox()
    defaultMsgBox = {
        ["Exists"] = false, --  msgBox element exists
        ["Element"] = {
            ["UI"] = {}, -- The actual element
            ["Root"] = {} --  Root Object
        },
        --  --------------
        --  Main Component
        --  --------------
        ["Component"] = {
            ["Name"] = "msgBox", --  Name of UI element
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

msgBox = Rematerialize(ReinitializeMsgBox())

--  ###################################################################################################################################################

--  ==================
--  RENDER MESSAGE-BOX
--  ==================

function renderMsgBox(Specs)
    if msgBox.Exists ~= true then
        --  -------------
        --  Create msgBox
        --  -------------

        ReinitializeMsgBox()
        msgBox.Element.UI = Ext.GetBuiltinUI(Dir.GameGUI .. "msgBox.swf")
        msgBox.Element.Root = msgBox.Element.UI:GetRoot()
    end

    msgBox.Exists = true

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "Component" then
                if functionMapper["msgBox"][key] ~= nil then
                    functionMapper["msgBox"][key](value)
                end
            elseif key == "SubComponent" then
                for k, v in pairs(value) do
                    if functionMapper["msgBox"][key][k] ~= nil then
                        functionMapper["msgBox"][key][k](v)
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

    local flexStart = msgBox.Component.flexStart
    if Specs.Component.Order ~= "NoOrder" then
        for index, element in ipairs(order) do
            if element == "Title" then
                msgBox.Element.Root.popup_mc.title_txt.y = flexStart
                flexStart = flexStart + msgBox.Element.Root.popup_mc.title_txt.height + msgBox.Component.padding
            elseif element == "Text" then
                msgBox.Element.Root.popup_mc.text_mc.y = flexStart
                flexStart = flexStart + msgBox.Element.Root.popup_mc.text_mc.height + msgBox.Component.padding
            elseif element == "InputText" then
                msgBox.Element.Root.popup_mc.input_mc.y = flexStart
                flexStart = flexStart + msgBox.Element.Root.popup_mc.input_mc.height + msgBox.Component.padding
            end
        end
    end
    --  ------------------
    --  Render Immediately
    --  ------------------

    if msgBox.Component.renderImmediately == false then
        msgBox.Element.UI:Hide()
    end

    msgBox.Element.UI:Show()

    return msgBox
end

--  ===============
--  FUNCTION MAPPER
--  ===============

functionMapper["msgBox"] = {
    --  ==============
    --  MAIN COMPONENT
    --  ==============

    ["Component"] = function(Component)
        msgBox.Element.UI:Invoke("setPopupType", Component.PopupType or msgBox.Component.PopupType)
        msgBox.Element.Root.popup_mc.visible = Component.Visible or msgBox.Component.Visible
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponent"] = {
        --      TITLE
        --      -----

        ["Title"] = function(SubComponent)
            msgBox.Element.UI:Invoke("setTitleText", SubComponent.TitleText or msgBox.SubComponent.Title.TitleText)
            msgBox.Element.Root.popup_mc.title_txt.visible = SubComponent.Visible or msgBox.SubComponent.Title.Visible
        end,
        --      TEXT
        --      ----

        ["Text"] = function(SubComponent)
            msgBox.Element.UI:Invoke("setText", SubComponent.Text or msgBox.SubComponent.Text.Text)
            msgBox.Element.Root.popup_mc.text_mc.gotoAndStop(SubComponent.Type or msgBox.SubComponent.Text.Type)
            msgBox.Element.Root.popup_mc.text_mc.visible = SubComponent.Visible or msgBox.SubComponent.Title.Visible
        end,
        --      INPUT-TEXT
        --      ----------

        ["InputText"] = function(SubComponent)
            msgBox.Element.UI:Invoke(
                "setInputEnabled",
                SubComponent.Visible or msgBox.SubComponent.InputText.Visible,
                SubComponent.MinChar or msgBox.SubComponent.InputText.MinChar,
                SubComponent.MaxChar or msgBox.SubComponent.InputText.MaxChar
            )
            msgBox.Element.UI:Invoke("setInputText", SubComponent.InputText or msgBox.SubComponent.InputText.InputText)
            msgBox.Element.UI:Invoke(
                "setCopyBtnVisible",
                SubComponent.CopyBtnVisible or msgBox.SubComponent.InputText.CopyBtnVisible
            )
            msgBox.Element.Root.popup_mc.input_mc.gotoAndStop(SubComponent.Type or msgBox.SubComponent.InputText.Type)
            msgBox.Element.UI:Invoke(
                "setPasteBtnVisible",
                SubComponent.PasteBtnVisible or msgBox.SubComponent.InputText.PasteBtnVisible
            )
        end
    }
}

--  ###################################################################################################################################################

function S7_OpenMessageBox(TitleText, Text)
    buildSpecifications.msgBox.SubComponent.Title.TitleText = TitleText
    if type(Text) == "string" then
        buildSpecifications.msgBox.SubComponent.Text.Text = Text
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
        buildSpecifications.msgBox.SubComponent.Text.Text = concat
    end

    S7_UCL_Build()
end

Ext.RegisterConsoleCommand("YOLO", S7_OpenMessageBox)
