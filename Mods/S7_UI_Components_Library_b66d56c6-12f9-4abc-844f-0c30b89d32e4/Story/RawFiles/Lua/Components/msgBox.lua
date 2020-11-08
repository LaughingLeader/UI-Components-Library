Ext.Require("S7_UCL_Auxiliary.lua")

msgBox = {}

local defaultMsgBox = {
    ["Type"] = 1
}

function createMsgBox(buildPlan)
    msgBox = Ext.GetBuiltinUI(Dir.GameGUI .. "msgBox.swf")
    msgBox:Invoke("setPopupType", buildPlan.Component.Type or defaultMsgBox.Type)

    for index, subcomponent in ipairs(buildPlan.Layout) do
        createMsgBox_SubComponent(msgBox, subcomponent.Name, subcomponent)
    end

    if buildPlan.Component.ShowOnCreation then
        msgBox:Show()
    else
        msgBox:Hide()
    end

    return msgBox
end

function createMsgBox_SubComponent(msgBox, subcomponentName, subcomponentPlan)
    if subcomponentName == "Title" then
        msgBox:Invoke("setTitleText", subcomponentPlan.TitleText or "LuL")
    elseif subcomponentName == "Text" then
        msgBox:Invoke("setText", subcomponentPlan.Text or "LuL")
    elseif subcomponentName == "Popup" then
        msgBox:Invoke("showPopup", subcomponentPlan.PopupTitle, subcomponentPlan.PopupText)
    elseif subcomponentName == "InputText" then
        msgBox:Invoke(
            "setInputEnabled",
            subcomponentPlan.InputEnable,
            subcomponentPlan.MinChar,
            subcomponentPlan.MaxChar
        )
        msgBox:Invoke("setCopyBtnVisible", subcomponentPlan.CopyVisible)
        msgBox:Invoke("setPasteBtnVisible", subcomponentPlan.PasteVisible)
        msgBox:Invoke("setInputText", subcomponentPlan.InputText)
    end
end
