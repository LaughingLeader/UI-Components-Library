--  =======
--  IMPORTS
--  =======

Ext.Require('Auxiliary.lua')

--  UI COMPONENTS
--  -------------

SpecsHandler = {}
BuildSpecifications = {}
UILibrary = {
    ["contextMenu"] = {},
    ["msgBox"] = {},
    ["GMJournal"] = {},
    ["pyramid"] = {}
}

Ext.Require("Client/Components/contextMenu.lua")
Ext.Require("Client/Components/msgBox.lua")
Ext.Require("Client/Components/Journal.lua")
Ext.Require("Client/Components/Pyramid.lua")

--  ================
--  BUILDER FUNCTION
--  ================

--- Delegates UI build task
---@param buildSpecs table Build specifications
function Render(buildSpecs)
    local builder = {
        ["msgBox"] = RenderMsgBox,
        ["GMJournal"] = RenderJournal,
        ["pyramid"] = RenderPyramid
    }

    local object
    if buildSpecs then
        UIName, Specs = next(buildSpecs)
        Debug:Print("Building " .. UIName .. " UI")
        object = builder[UIName](Specs)
    end
    return object
end