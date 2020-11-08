Ext.Require("S7_UCL_Auxiliary.lua")
Ext.Require("Components/msgBox.lua")

activeUI = {}

buildPlan = {
    ["Component"] = {["Name"] = "msgBox", ["Type"] = 4, ["ShowOnCreation"] = true},
    ["Layout"] = {
        [1] = {["Name"] = "Title", ["TitleText"] = "MyTitle"},
        [2] = {["Name"] = "Text"},
        [3] = {["Name"] = "InputText", ["InputEnable"] = true, ["InputText"] = "Enter Your Text..."}
    }
}

function S7_UCL_Build()
    if buildPlan.Component.Name == "msgBox" then
        activeUI = createMsgBox(buildPlan)
    end
    return activeUI
end
