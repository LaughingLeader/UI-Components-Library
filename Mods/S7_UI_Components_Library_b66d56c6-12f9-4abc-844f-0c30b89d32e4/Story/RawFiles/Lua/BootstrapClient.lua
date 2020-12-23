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

--- Delegates UI build task
---@param buildSpecs table Build specifications
function UCLBuild(buildSpecs)
    local builder = {
        ["msgBox"] = RenderMsgBox,
        ["GMJournal"] = RenderJournal,
        ["pyramid"] = RenderPyramid
    }

    if buildSpecs then
        for UIName, Specs in pairs(buildSpecs) do
            UILibrary[UIName] = builder[UIName](Specs)
        end
    end
end

--  ==========
--  DEBUG MODE
--  ==========

if Ext.IsDeveloperMode() then Ext.Require("Development/DevMode.lua") end