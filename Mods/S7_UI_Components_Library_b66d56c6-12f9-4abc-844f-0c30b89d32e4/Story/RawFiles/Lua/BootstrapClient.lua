--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")
Ext.Require("Components/msgBox.lua")
Ext.Require("Components/Journal.lua")

--  ================
--  BUILDER FUNCTION
--  ================

function S7_UCL_Build()
    -- function S7_UCL_Build(buildSpecs)
    local builder = {
        ["msgBox"] = RenderMsgBox,
        ["GMJournal"] = RenderJournal
    }
    
    BuildSpecifications = Ext.JsonParse(Ext.LoadFile("S7UCL.json"))
    -- local BuildSpecifications = Ext.JsonParse(buildSpecs)

    for UIName, Specs in pairs(BuildSpecifications) do
        UILibrary[UIName] = builder[UIName](Specs)
    end
end