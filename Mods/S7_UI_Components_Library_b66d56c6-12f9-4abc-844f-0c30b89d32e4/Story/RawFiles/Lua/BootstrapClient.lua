--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")
Ext.Require("Components/msgBox.lua")
Ext.Require("Components/Journal.lua")

--  ================
--  BUILDER FUNCTION
--  ================

    function S7_UCL_Build(buildSpecs)
    local builder = {
        ["msgBox"] = RenderMsgBox,
        ["GMJournal"] = RenderJournal
    }

    local BuildSpecifications = Ext.JsonParse(buildSpecs)

    for UIName, Specs in pairs(BuildSpecifications) do
        UILibrary[UIName] = builder[UIName](Specs)
    end
end

function S7_Build()
    local file = Ext.LoadFile("S7UCL.json")
    S7_UCL_Build(file)
end