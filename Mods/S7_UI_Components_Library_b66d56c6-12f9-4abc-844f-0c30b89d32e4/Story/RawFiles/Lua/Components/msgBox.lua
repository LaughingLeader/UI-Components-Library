--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")

--  ======
--  MsgBox
--  ======

UILibrary.msgBox = {
    ["Exists"] = false, --  MsgBox exists
    ["UI"] = {}, -- The UI Object
    ["Root"] = {}, --  The Root Object

    --  --------------
    --  Main Component
    --  --------------
    ["Component"] = {
        ["Name"] = "msgBox", --  Name of UI element
        ["PopupType"] = 1, --  Popup Variant
        ["flexOrder"] = "NoOrder",  --  flexOrder for positioning of subcomponents. "Order", "NoOrder", "Forced"
        ["flexMode"] = "Start", -- Start, Center, End. Determines vertical positioning of subcomponents
        ["flexStart"] = 50, --  Top Margin.
        ["Padding"] = 10,   --  Padding between subcomponents
        ["AutoResize"] = true, -- AutoResizes the popup-background based if content overflows.
        ["Visible"] = false -- Visibility of popup_mc
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
            ["Order"] = 1,  --  Default Order: At Top
            ["SpaceReserved"] = false, -- Space will be reserved even if sub-component is Invisible
            ["Visible"] = false --  Visibility of Title Component
        },
        --  TEXT
        --  ----
        ["Text"] = {
            ["Name"] = "Text", --  Sub-Component Name
            ["Text"] = "", --  Default Value
            ["Type"] = 1, -- Type of Sub-Component
            ["Order"] = 2, -- Default Order: Below Title
            ["SpaceReserved"] = false, -- Space will be reserved even if sub-component is Invisible
            ["Visible"] = false --  Visibility of Text Component
        },
        --  INPUT-TEXT
        --  ----------
        ["InputText"] = {
            ["Name"] = "InputText", --  Sub-Component Name
            ["InputText"] = "", --  Default Value
            ["Type"] = 1,   --   Type of Input-Text Box
            ["Order"] = 3, -- Default Order: Below Text.
            ["MinChar"] = 0, --  Minimum number of input characters
            ["MaxChar"] = 46, --  Maximum number of input characters
            ["CopyBtnVisible"] = false, --  Copy from input-field Button Visibility
            ["PasteBtnVisible"] = false, -- Paste to input-field Button Visibility
            ["SpaceReserved"] = false, -- Space will be reserved even if sub-component is Invisible
            ["Visible"] = false --  Visibility of Input-Text Box
        },

        --  CLOSE BUTTON
        --  ------------

        ["CloseButton"] = {
            ["Name"] = "CloseButton",
            ["Visible"] = true
        },

        --  BUTTONS
        --  -------

        ["Buttons"] = {
            ["Name"] = "Buttons",   -- Sub-Component Name
            ["Order"] = "4", -- Default Order: Last
            ["AlwaysAtBottom"] = true, -- Decouples BtnList from normal flexFlow and positions it at the bottom.
            ["SpaceReserved"] = false, -- Space will be reserved even if sub-component is Invisible
            ["Visible"] = false, -- Visibility of Sub-Component

            --  BUTTON LIST
            --  -----------

            ["Btns"] = {
                --[[
                [BtnID] = {
                    ["Label"] = "Button Label/Text",
                    ["Type"] = "Regular", :: Determines the type of button. Options: "Blue", "Yes", "No", "Regular"
                },
                --]]
            }
        }
    }
}

UILibrary.msgBox.mt = {}
setmetatable(UILibrary.msgBox, UILibrary.msgBox.mt)
UILibrary.msgBox.mt.__index = UILibrary.msgBox

function UILibrary.msgBox:New(object)
    local object = object or {}
    setmetatable(object, self.mt)
    self.mt.__index = self
    return object
end

--  ===========================
MsgBox = UILibrary.msgBox:New()
--  ===========================

--  ###################################################################################################################################################

--  ==================
--  CREATE MESSAGE-BOX
--  ==================

function CreateMsgBox(Specs)
    MsgBox = UILibrary.msgBox:New()    --  Reinitialize MsgBox
    Ext.CreateUI("S7_msgBox", Dir.ModGUI .. "msgBox.swf", 5)   -- Get MsgBox UI
    MsgBox.UI = Ext.GetUI("S7_msgBox")
    MsgBox.Root = MsgBox.UI:GetRoot()   --  Get UI Root

    --  REGISTER CLOSE BUTTON LISTENER
    --  ------------------------------

    Ext.RegisterUICall(MsgBox.UI, "S7_UI_msgBox_Hide", function(ui, call, ...)
        MsgBox.Root.hideWin()    --  Hide or Destroy ??
        MsgBox = UILibrary.msgBox:New()
    end)

    MsgBox.Exists = true    --  Set MsgBox existance to true
    RenderMsgBox(Specs)
end

-- --  ==================
-- --  UPDATE MESSAGE-BOX
-- --  ==================

-- function UpdateMsgBox(SpecsTable)
--     if SpecsTable ~= nil then
--         for key, value in pairs(MsgBox) do
--             if type(value) ~= "table" then
--                 MsgBox[key] = SpecsTable[key] or value
--             else
--                 for k, v in pairs(value) do
--                     MsgBox[key][k] = SpecsTable[key][k] or v
--                 end
--             end
--         end
--     end
-- end

--  ==================
--  RENDER MESSAGE-BOX
--  ==================

function RenderMsgBox(Specs)
    --  Create if MsgBox doesn't already exist
    if not MsgBox.Exists then CreateMsgBox(Specs) end

    --  -------------
    --  SPECS HANDLER
    --  -------------

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "Component" then if SpecsHandler["MsgBox"][key] ~= nil then SpecsHandler["MsgBox"][key](value) end
            elseif key == "SubComponent" then for k, v in pairs(value) do if SpecsHandler["MsgBox"][key][k] ~= nil then SpecsHandler["MsgBox"][key][k](v) end end
            end
        end
    end


    --  -------------------
    --  REPOSITION ELEMENTS
    --  -------------------

    --  Order Table
    --  -----------

    local order = {}    --  Holds the order of flex-components
    local push = 0  --  If two subcomponents have the same order, push tracks the positional shift of succeeding elements.
    for subCompName, subComp in pairs(Specs.SubComponent) do
        if subComp.Order ~= nil and subComp.Visible or subComp.ReserveSpace then -- If Order Specified + SubComponent Visible or SpaceReserved
            if order[subComp.Order] ~= nil then --  If Order Index already mapped
                push = push + 1 --  Increase push by 1
            end
            order[subComp.Order + push] = subCompName   --  Add to Order Table
        elseif subComp.Order == nil and subComp.Visible or subComp.ReserveSpace then -- If Order not Specified + SubComponent Visible or SpaceReserved
            if Specs.Component.Order == "Forced" then -- flexOrder is enforced
                order[#order + 1] = subCompName -- Append SubComponent at the end of Order Table.
            end
        end
    end


    --  Recenter Popup Background
    --  -------------------------

    if Specs.Component.PopupType >= 4 then MsgBox.Root.setY(200)
    else MsgBox.Root.setY(330) end


    --  Heights Table
    --  -------------

    local textHeight = 0
    local function determineTextHeight()
        if MsgBox.Root.popup_mc.text_mc.text_txt.height >= MsgBox.Root.popup_mc.text_mc.text_txt.textHeight then return MsgBox.Root.popup_mc.text_mc.text_txt.textHeight
        else return MsgBox.Root.popup_mc.text_mc.text_txt.height
        end
    end
    textHeight = determineTextHeight()

    local subComponentHeights = {
        ["Popup"] = MsgBox.Root.popup_mc.height,
        ["Title"] = MsgBox.Root.popup_mc.title_txt.height,
        ["Text"] = textHeight,
        ["InputText"] = MsgBox.Root.popup_mc.input_mc.height,
        ["Buttons"] = MsgBox.Root.popup_mc.cButtons_mc.height or 0
    }

    --  Total Height of Ordered Components
    --  ----------------------------------

    local totalHeight = 0
    for _, comp in ipairs(order) do
        if subComponentHeights[comp] ~= nil  and comp ~= "Popup" then totalHeight = totalHeight + subComponentHeights[comp] end
    end

    if Specs.Component.AutoResize ~= false then
        if totalHeight > subComponentHeights["Popup"] and Specs.Component.PopupType < 4 then MsgBox.UI:Invoke("setPopupType", 4)
        elseif totalHeight < subComponentHeights["Popup"] and Specs.Component.PopupType > 4 then MsgBox.UI:Invoke("setPopupType", 1)
        end
    end

    --  flexPositioning
    --  ---------------

    local flexPos = 0
    local flexEnd = subComponentHeights["Popup"] - MsgBox.Component.flexStart
    if Specs.Component.flexMode == "Start" then flexPos = MsgBox.Component.flexStart
    elseif Specs.Component.flexMode == "Center" then flexPos = (subComponentHeights["Popup"] - totalHeight) / 2
    elseif Specs.Component.flexMode == "End" then flexPos = flexEnd - totalHeight
    end

    if Specs.Component.Order ~= "NoOrder" then
        for index, element in ipairs(order) do
            if Specs.SubComponent[element].Visible or Specs.SubComponent[element].SpaceReserved then
                if element == "Title" then
                    MsgBox.Root.popup_mc.title_txt.y = flexPos
                    flexPos = flexPos + subComponentHeights["Title"] + MsgBox.Component.Padding
                elseif element == "Text" then
                    MsgBox.Root.popup_mc.text_mc.y = flexPos
                    flexPos = flexPos + subComponentHeights["Text"] + MsgBox.Component.Padding
                elseif element == "InputText" then
                    MsgBox.Root.popup_mc.input_mc.y = flexPos
                    flexPos = flexPos + subComponentHeights["InputText"] + MsgBox.Component.Padding
                elseif element == "Buttons" then
                    if Specs.SubComponent.Buttons.AlwaysAtBottom then
                        MsgBox.Root.popup_mc.setBtnPos(flexEnd - MsgBox.Root.popup_mc.btnList.height)
                    else
                        MsgBox.Root.popup_mc.setBtnPos(flexPos)
                        flexPos = flexPos + subComponentHeights["Buttons"] + MsgBox.Component.Padding
                    end
                end
            end
        end
    end

    --  ----------------
    --  SHOW MESSAGE BOX
    --  ----------------

    MsgBox.Root.showWin()
    return MsgBox
end

--  ===================
--  DESTROY MESSAGE-BOX
--  ===================

function CloseMsgBox()
    MsgBox.UI:Destroy()
    MsgBox = UILibrary.msgBox:New()
end

--  ===============
--  FUNCTION MAPPER
--  ===============

SpecsHandler["MsgBox"] = {

    --  ==============
    --  MAIN COMPONENT
    --  ==============

    ["Component"] = function(Component)
        MsgBox.UI:Invoke("setPopupType", Component.PopupType or MsgBox.Component.PopupType)
        MsgBox.Root.popup_mc.visible = Component.Visible or MsgBox.Component.Visible or false
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponent"] = {

        --      TITLE
        --      -----

        ["Title"] = function(SubComponent)
            MsgBox.UI:Invoke("setTitleText", SubComponent.TitleText or MsgBox.SubComponent.Title.TitleText)
            MsgBox.Root.popup_mc.title_txt.visible = SubComponent.Visible or MsgBox.SubComponent.Title.Visible or false
        end,

        --      TEXT
        --      ----

        ["Text"] = function(SubComponent)
            MsgBox.UI:Invoke("setText", SubComponent.Text or MsgBox.SubComponent.Text.Text)
            MsgBox.Root.popup_mc.text_mc.gotoAndStop(SubComponent.Type or MsgBox.SubComponent.Text.Type)
            MsgBox.Root.popup_mc.text_mc.visible = SubComponent.Visible or MsgBox.SubComponent.Title.Visible or false
        end,

        --      INPUT-TEXT
        --      ----------

        ["InputText"] = function(SubComponent)
            MsgBox.UI:Invoke(
                "setInputEnabled",
                SubComponent.Visible or MsgBox.SubComponent.InputText.Visible or false,
                SubComponent.MinChar or MsgBox.SubComponent.InputText.MinChar or 0,
                SubComponent.MaxChar or MsgBox.SubComponent.InputText.MaxChar or 46
            )
            MsgBox.Root.popup_mc.input_mc.gotoAndStop(SubComponent.Type or MsgBox.SubComponent.InputText.Type)
            MsgBox.UI:Invoke("setInputText", SubComponent.InputText or MsgBox.SubComponent.InputText.InputText or "")
            MsgBox.UI:Invoke("setCopyBtnVisible", SubComponent.CopyBtnVisible or MsgBox.SubComponent.InputText.CopyBtnVisible or false)
            MsgBox.UI:Invoke("setPasteBtnVisible", SubComponent.PasteBtnVisible or MsgBox.SubComponent.InputText.PasteBtnVisible or false)
        end,

        ["CloseButton"] = function (SubComponent)
            MsgBox.Root.closeButton_mc.visible = SubComponent.Visible
        end,

        --      BUTTONS
        --      -------

        ["Buttons"] = function(SubComponent)
            MsgBox.UI:Invoke("removeButtons")
            if SubComponent.Btns ~= nil then
                for id, btn in ipairs(SubComponent.Btns) do
                    if btn.Type == "Blue" then MsgBox.UI:Invoke("addBlueButton", id, btn.Label)
                    elseif btn.Type == "Yes" then MsgBox.UI:Invoke("addYesButton", id)
                    elseif btn.Type == "No" then MsgBox.UI:Invoke("addNoButton", id)
                    else MsgBox.UI:Invoke("addButton", id, btn.Label, "", "")
                    end
                end
            end
            MsgBox.Root.popup_mc.cButtons_mc.visible = SubComponent.Visible or MsgBox.SubComponent.Buttons.Visible or false
        end
    }
}

--  ###################################################################################################################################################
