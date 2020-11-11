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
                ["Visible"] = false --  Visiblility
            },
            --  TEXT
            --  ----
            ["Text"] = {
                ["Name"] = "Text", --  Sub-Component Name
                ["Text"] = "", --  Default Value
                ["Visible"] = false --  Visiblility
            },
            --  INPUT-TEXT
            --  ----------
            ["InputText"] = {
                ["Name"] = "InputText", --  Sub-Component Name
                ["InputText"] = "", --  Default Value
                ["MinChar"] = 0, --  Minimum number of input characters
                ["MaxChar"] = 46, --  Maximum number of input characters
                ["CopyBtnVisible"] = false, --  Copy from input-field Button Visibility
                ["PasteBtnVisible"] = false, -- Paste to input-field Button Visibility
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

    --  ------------------
    --  Render Immediately
    --  ------------------

    if msgBox.Component.renderImmediately then
        msgBox.Element.UI:Show()
    else
        msgBox.Element.UI:Hide()
    end

    return msgBox
end

--  ===============
--  FUNCTION MAPPER
--  ===============

functionMapper = {}

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
            Ext.Print(Ext.JsonStringify(SubComponent))
            msgBox.Element.UI:Invoke("setTitleText", SubComponent.TitleText or msgBox.SubComponent.Title.TitleText)
            msgBox.Element.Root.popup_mc.title_txt.visible = SubComponent.Visible or msgBox.SubComponent.Title.Visible
        end,
        --      TEXT
        --      ----

        ["Text"] = function(SubComponent)
            msgBox.Element.UI:Invoke("setText", SubComponent.Text or msgBox.SubComponent.Text.Text)
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
            msgBox.Element.UI:Invoke(
                "setPasteBtnVisible",
                SubComponent.PasteBtnVisible or msgBox.SubComponent.InputText.PasteBtnVisible
            )
        end
    }
}
