--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")
Ext.Require("Components/msgBox.lua")
Ext.Require("Components/Journal.lua")

--  ==============================
--  TEMPORARY BUILD SPECIFICATIONS
--  ==============================

BuildSpecifications = Ext.JsonParse(Ext.LoadFile("S7UCL.json"))

--  ================
--  ACTIVE UI OBJECT
--  ================
ActiveUI = {
    ["msgBox"] = {},
    ["GMJournal"] = {}
}

--  ================
--  BUILDER FUNCTION
--  ================

function S7_UCL_Build()
    local builder = {
        ["msgBox"] = RenderMsgBox,
        ["GMJournal"] = RenderJournal
    }
    
    for UIName, Specs in pairs(BuildSpecifications) do
        ActiveUI[UIName] = builder[UIName](Specs)
    end
    return ActiveUI
end