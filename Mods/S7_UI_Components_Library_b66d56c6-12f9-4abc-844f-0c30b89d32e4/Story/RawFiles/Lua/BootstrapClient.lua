--  =======
--  IMPORTS
--  =======

Ext.Require("Shared/Auxiliary.lua")
Ext.Require("Client/Auxiliary.lua")

--  UI COMPONENTS
--  -------------

Ext.Require("Client/Components/contextMenu.lua")
Ext.Require("Client/Components/msgBox.lua")
Ext.Require("Client/Components/Journal.lua")
Ext.Require("Client/Components/Pyramid.lua")

--  DEVELOPER-MODE
--  --------------

if Ext.IsDeveloperMode() then
    Ext.Require("Shared/Development/DevMode.lua")
    Ext.Require("Client/Development/DevMode.lua")
end

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

    local object
    if buildSpecs then
        UIName, Specs = next(buildSpecs)
        S7Debug:Print("Building " .. UIName .. " UI")
        object = builder[UIName](Specs)
    end
    return object
end