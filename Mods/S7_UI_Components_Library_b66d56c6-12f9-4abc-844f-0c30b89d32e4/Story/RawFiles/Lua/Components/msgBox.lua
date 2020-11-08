Ext.Require("S7_UCL_Auxiliary.lua")

msgBox = {}

local defaultMsgBox = {
    ["Type"] = 1,
    ["TitleText"] = "Title",
    ["Text"] = "Default Text",
    ["InputEnable"] = false,
    ["InputMinChar"] = 0,
    ["InputMaxChar"] = 46,
    ["CopyBtnVisible"] = false,
    ["PasteBtnVisible"] = false,
    ["InputText"] = "Enter your text..."
}

local function determineParams(type, subcomponent)
    return subcomponent[type] or defaultMsgBox[type]
end

function createMsgBox(buildPlan)
    msgBox = Ext.GetBuiltinUI(Dir.GameGUI .. "msgBox.swf")
    msgBox:Invoke("setPopupType", determineParams("Type", buildPlan.Component))

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
        msgBox:Invoke("setTitleText", determineParams("TitleText", subcomponentPlan))
    elseif subcomponentName == "Text" then
        msgBox:Invoke("setText", determineParams("Text", subcomponentPlan))
    elseif subcomponentName == "Popup" then
        msgBox:Invoke(
            "showPopup",
            determineParams("TitleText", subcomponentPlan),
            determineParams("Text", subcomponentPlan)
        )
    elseif subcomponentName == "InputText" then
        msgBox:Invoke(
            "setInputEnabled",
            determineParams("InputEnable", subcomponentPlan),
            determineParams("InputMinChar", subcomponentPlan),
            determineParams("InputMaxChar", subcomponentPlan)
        )
        msgBox:Invoke("setCopyBtnVisible", determineParams("CopyBtnVisible", subcomponentPlan))
        msgBox:Invoke("setPasteBtnVisible", determineParams("PasteBtnVisible", subcomponentPlan))
        msgBox:Invoke("setInputText", determineParams("InputText", subcomponentPlan))
    end
end
