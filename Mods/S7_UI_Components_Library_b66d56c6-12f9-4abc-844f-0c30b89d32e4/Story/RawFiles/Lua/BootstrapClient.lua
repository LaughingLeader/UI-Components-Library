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
-- function S7_UCL_Build(buildSpecs)
    local builder = {
        ["msgBox"] = RenderMsgBox,
        ["GMJournal"] = RenderJournal
    }
    
    -- local BuildSpecifications = Ext.JsonParse(buildSpecs)

    for UIName, Specs in pairs(BuildSpecifications) do
        ActiveUI[UIName] = builder[UIName](Specs)
    end
    return ActiveUI
end