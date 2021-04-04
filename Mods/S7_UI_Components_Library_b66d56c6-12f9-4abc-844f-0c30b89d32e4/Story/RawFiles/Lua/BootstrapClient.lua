--  =======
--  IMPORTS
--  =======

Ext.Require('Auxiliary.lua')

--  UI COMPONENTS
--  -------------

SpecsHandler = {}
BuildSpecifications = {}
UILibrary = {
    ['containerInventory'] = {},
    ['contextMenu'] = {},
    ['enemyHealthBar'] = {},
    ['GMJournal'] = {},
    ['hotBar'] = {},
    ['msgBox'] = {},
    ['partyInventory'] = {},
    ['tooltip'] = {},
    ['inputEvents'] = {},
}

Ext.Require('Client/Components/containerInventory.lua')
Ext.Require('Client/Components/contextMenu.lua')
Ext.Require('Client/Components/enemyHealthBar.lua')
Ext.Require('Client/Components/GMJournal.lua')
Ext.Require('Client/Components/hotBar.lua')
Ext.Require('Client/Components/msgBox.lua')
Ext.Require('Client/Components/tooltip.lua')
Ext.Require('Client/Components/partyInventory.lua')

Ext.Require('Client/InputEvents.lua')

--  ================
--  BUILDER FUNCTION
--  ================

--- Delegates UI build task
---@param buildSpecs table Build specifications
function Render(buildSpecs)
    local builder = {
        ['msgBox'] = RenderMsgBox,
        ['GMJournal'] = RenderJournal,
    }

    local object
    if buildSpecs then
        UIName, Specs = next(buildSpecs)
        Debug:Print("Building " .. UIName .. " UI")
        object = builder[UIName](Specs)
    end
    return object
end

--  ===============
--  LIVE UI REPORTS
--  ===============

if Ext.IsDeveloperMode() then Ext.Require('Client/LiveUIReport.lua') end