--  ======
--  MsgBox
--  ======

---@class MsgBox @UILibrary msgBox
---@field private Exists boolean
---@field private UI UIObject
---@field private Root FlashObject
---@field public Component table Holds information about the UI Component
---@field public SubComponents table Holds information about constituting elements
UILibrary.msgBox = {
    ["Exists"] = false,
    -- ["UI"] = {},
    -- ["Root"]= {},

    --  --------------
    --  Main Component
    --  --------------
    ["Component"] = {
        ["Name"] = "S7_UI_MsgBox", --  Name of UI element
        ["Layer"] = 10, --  Layer stack order of UI element
        ["PopupType"] = 1, --  Popup Variant
        ["flexOrder"] = "NoOrder",  --  flexOrder for positioning of subcomponents. "Order", "NoOrder", "Forced"
        ["flexMode"] = "Start", -- Determines vertical positioning of subcomponents. "Start", "Center", "End"
        ["flexStart"] = 50, --  Top Margin
        ["Padding"] = 10,   --  Padding between subcomponents
        ["AutoResize"] = true, -- AutoResizes the popup-background based if content overflows.
        ["Visible"] = false -- Visibility of popup_mc
    },
    --  --------------
    --  Sub Components
    --  --------------
    ["SubComponents"] = {
        --  TITLE
        --  -----
        ["Title"] = {
            ["Name"] = "Title", --  Sub-Component Name
            ["TitleText"] = "TITLE", --  Default Value
            ["Order"] = 1,  --  Default Order: At Top
            ["SpaceReserved"] = false, -- Space will be reserved even if sub-component is Invisible
            ["Visible"] = false --  Visibility of Title Component
        },
        --  TEXT
        --  ----
        ["Text"] = {
            ["Name"] = "Text", --  Sub-Component Name
            ["Text"] = "Lorem ipsum dolor sit amet", --  Default Value
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

--- Initialize new MsgBox Object
---@param object table|nil Object to instantiate
---@return MsgBox object MsgBox object
function UILibrary.msgBox:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--  ===========================
MsgBox = UILibrary.msgBox:New()
--  ===========================

--  ###################################################################################################################################################

--  ==================
--  CREATE MESSAGE-BOX
--  ==================

--- Create new MsgBox UI Component
--- @param Specs table MsgBox build specifications
function CreateMsgBox(Specs)
    Ext.Print(Ext.JsonStringify(Rematerialize(Specs)))
    MsgBox = UILibrary.msgBox:New(Specs)    --  Reinitialize MsgBox
    Ext.Print(Ext.JsonStringify(Rematerialize(MsgBox)))
    MsgBox.UI = Ext.GetUI(MsgBox.Component.Name) or Ext.CreateUI(MsgBox.Component.Name, Dir.ModGUI .. "msgBox.swf", MsgBox.Component.Layer)
    MsgBox.Root = MsgBox.UI:GetRoot()

    --  REGISTER CLOSE BUTTON LISTENER
    --  ------------------------------

    Ext.RegisterUICall(MsgBox.UI, "S7HideUI", function(ui, call, ...)
        MsgBox.UI:Invoke("hideWin")    --  Hide or Destroy ??
        CloseMsgBox()
    end)

    MsgBox.Exists = true    --  Set MsgBox existance to true
    RenderMsgBox(Specs) --  Rerender MsgBox
end

--  ==================
--  RENDER MESSAGE-BOX
--  ==================

--- Render MsgBox UI
--- @param Specs table MsgBox build specifications
--- @return MsgBox MsgBox
function RenderMsgBox(Specs)
    --  Create if MsgBox doesn't already exist
    if not MsgBox.Exists then CreateMsgBox(Specs) end

    --  -------------
    --  SPECS HANDLER
    --  -------------

    for key, handler in pairs(SpecsHandler["MsgBox"]) do handler(MsgBox[key]) end

    --  -------------------
    --  REPOSITION ELEMENTS
    --  -------------------

    --  Order Table
    --  -----------

    local order = {}    --  Holds the order of flex-components
    local push = 0  --  If two subcomponents have the same order, push tracks the positional shift of succeeding elements
    for subCompName, subComp in pairs(MsgBox.SubComponents) do
        if subComp.Order ~= nil and subComp.Visible or subComp.ReserveSpace then -- If Order Specified + SubComponent Visible or SpaceReserved
            if order[subComp.Order] ~= nil then --  If Order Index already mapped
                push = push + 1 --  Increase push by 1
            end
            order[tonumber(subComp.Order + push)] = subCompName   --  Add to Order Table
        elseif subComp.Order == nil and subComp.Visible or subComp.ReserveSpace then -- If Order not Specified + SubComponent Visible or SpaceReserved
            if MsgBox.Component.Order == "Forced" then -- flexOrder is enforced
                order[tonumber(#order + 1)] = subCompName -- Append SubComponent at the end of Order Table.
            end
        end
    end


    --  Recenter Popup Background
    --  -------------------------

    if MsgBox.Component.PopupType >= 4 then MsgBox.Root.setY(200)
    else MsgBox.Root.setY(330) end


    --  Heights Table
    --  -------------

    local textHeight = 0
    textHeight = MsgBox.Root.popup_mc.text_mc.text_txt.height >= MsgBox.Root.popup_mc.text_mc.text_txt.textHeight and MsgBox.Root.popup_mc.text_mc.text_txt.textHeight or MsgBox.Root.popup_mc.text_mc.text_txt.height

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

    if MsgBox.Component.AutoResize then
        if totalHeight > subComponentHeights["Popup"] and MsgBox.Component.PopupType < 4 then MsgBox.UI:Invoke("setPopupType", 4)
        elseif totalHeight < subComponentHeights["Popup"] and MsgBox.Component.PopupType > 4 then MsgBox.UI:Invoke("setPopupType", 1)
        end
    end

    --  flexPositioning
    --  ---------------

    local flexPos = 0
    local flexEnd = subComponentHeights["Popup"] - MsgBox.Component.flexStart
    if MsgBox.Component.flexMode == "Start" then flexPos = MsgBox.Component.flexStart
    elseif MsgBox.Component.flexMode == "Center" then flexPos = (subComponentHeights["Popup"] - totalHeight) / 2
    elseif MsgBox.Component.flexMode == "End" then flexPos = flexEnd - totalHeight
    end

    if MsgBox.Component.Order ~= "NoOrder" then
        for _, element in ipairs(order) do
            if MsgBox.SubComponents[element].Visible or MsgBox.SubComponents[element].SpaceReserved then
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
                    if MsgBox.SubComponents.Buttons.AlwaysAtBottom then
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

    MsgBox.UI:Invoke("showWin")
    return MsgBox
end

--  ===================
--  DESTROY MESSAGE-BOX
--  ===================

--- Destroy MsgBox UI
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
        MsgBox.UI:Invoke("setPopupType", Component.PopupType)
        MsgBox.Root.popup_mc.visible = Component.Visible or false
    end,
    --  =============
    --  SUBCOMPONENTS
    --  =============

    ["SubComponents"] = function (SubComponent)

        --  TITLE
        --  =====
        if SubComponent.Title then
            MsgBox.UI:Invoke("setTitleText", SubComponent.Title.TitleText)
            MsgBox.Root.popup_mc.title_txt.visible = SubComponent.Title.Visible or false
        end

        --  TEXT
        --  ====
        if SubComponent.Text then
            MsgBox.UI:Invoke("setText", SubComponent.Text.Text)
            MsgBox.Root.popup_mc.text_mc.gotoAndStop(SubComponent.Text.Type)
            MsgBox.Root.popup_mc.text_mc.visible = SubComponent.Text.Visible or false
        end

        --  INPUT TEXT
        --  ==========
        if SubComponent.InputText then
            MsgBox.UI:Invoke(
                    "setInputEnabled",
                    SubComponent.InputText.Visible or false,
                    SubComponent.InputText.MinChar or 0,
                    SubComponent.InputText.MaxChar or 46
                )
            MsgBox.Root.popup_mc.input_mc.gotoAndStop(SubComponent.Type)
            MsgBox.UI:Invoke("setInputText", SubComponent.InputText.InputText or "")
            MsgBox.UI:Invoke("setCopyBtnVisible", SubComponent.InputText.CopyBtnVisible or false)
            MsgBox.UI:Invoke("setPasteBtnVisible", SubComponent.InputText.PasteBtnVisible or false)
        end

        --  CLOSE BUTTON
        --  ============
        if MsgBox.Root.popup_mc.closeButton_mc then MsgBox.Root.popup_mc.closeButton_mc.visible = SubComponent.CloseButton.Visible end

        --  BUTTONS
        --  =======
        if SubComponent.Buttons then
            MsgBox.UI:Invoke("removeButtons")
            if SubComponent.Buttons.Btns ~= nil then
                for id, btn in ipairs(SubComponent.Buttons.Btns) do
                    if btn.Type == "Blue" then MsgBox.UI:Invoke("addBlueButton", id, btn.Label)
                    elseif btn.Type == "Yes" then MsgBox.UI:Invoke("addYesButton", id)
                    elseif btn.Type == "No" then MsgBox.UI:Invoke("addNoButton", id)
                    else MsgBox.UI:Invoke("addButton", id, btn.Label, "", "")
                    end
                end
            end
            MsgBox.Root.popup_mc.cButtons_mc.visible = SubComponent.Buttons.Visible or false
        end
    end
}

--  ###################################################################################################################################################
