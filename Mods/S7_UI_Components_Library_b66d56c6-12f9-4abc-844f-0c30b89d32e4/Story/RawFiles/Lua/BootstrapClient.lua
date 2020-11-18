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

--  ===========
--  BUILDER MAP
--  ===========

local builder = {
    ["msgBox"] = RenderMsgBox,
    ["GMJournal"] = RenderJournal
}

--  ================
--  BUILDER FUNCTION
--  ================

function S7_UCL_Build()
    for UIName, Specs in pairs(BuildSpecifications) do
        builder[UIName](Specs)
    end
end