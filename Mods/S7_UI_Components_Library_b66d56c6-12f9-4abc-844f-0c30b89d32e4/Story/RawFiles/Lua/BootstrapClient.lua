--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")

--  UI COMPONENTS
--  -------------

Ext.Require("Components/msgBox.lua")
Ext.Require("Components/Journal.lua")
Ext.Require("Components/Pyramid.lua")

--  ================
--  BUILDER FUNCTION
--  ================

function UCLBuild(buildSpecs)
    local builder = {
        ["msgBox"] = RenderMsgBox,
        ["GMJournal"] = RenderJournal,
        ["pyramid"] = RenderPyramid
    }

    local BuildSpecifications = Ext.JsonParse(buildSpecs)

    for UIName, Specs in pairs(BuildSpecifications) do
        UILibrary[UIName] = builder[UIName](Specs)
    end
end
