--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")
Ext.Require("Components/msgBox.lua")
Ext.Require("Components/Journal.lua")

--  ==============================
--  TEMPORARY BUILD SPECIFICATIONS
--  ==============================

buildSpecifications = Ext.JsonParse(Ext.LoadFile("S7UCL.json"))

--  ===========
--  BUILDER MAP
--  ===========

local builder = {
    ["msgBox"] = renderMsgBox,
    ["GMJournal"] = renderJournal
}

--  ================
--  BUILDER FUNCTION
--  ================

function S7_UCL_Build()
    for UIName, Specs in pairs(buildSpecifications) do
        activeUI = builder[UIName](Specs)
    end
end
