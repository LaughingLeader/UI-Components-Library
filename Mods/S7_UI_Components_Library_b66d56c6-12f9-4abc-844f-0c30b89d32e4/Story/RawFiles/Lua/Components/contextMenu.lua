--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")

--  ============
--  CONTEXT MENU
--  ============

---@class ContextMenu @ContextMenu UI Component
---@field TypeID number UI TypeID
---@field Activator number Origin
---@field RegisterHooks boolean Should register hooks
---@field Component table Holds information about WindowElement
---@field SubComponents table Array of Constituting Entries
---@field Actions table Table of mapped functions
UILibrary.contextMenu = {
    ["TypeID"] = 11,
    ["Activator"] = 0,
    ['RegisterHooks'] = false,
    ["Component"] = {},
    ["SubComponents"] = {},
    ["Actions"] = {},
}

--- Initialize new ContextMenu Object
---@param object table|nil Object to instantiate
---@return ContextMenu object ContextMenu object
function UILibrary.contextMenu:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Register new entry for the ContextMenu
---@param e table
function UILibrary.contextMenu:Register(e)
    for key, value in pairs(e) do
        self.SubComponents[key] = value
        self.Actions[key] = {}
    end
end

--  =====================================
ContextMenu = UILibrary.contextMenu:New()
--  =====================================


--  ======================
--  INTERCEPT CONTEXT MENU
--  ======================

function RegisterContextMenuListeners()
    S7Debug:Print("Registering ContextMenu Listeners")

    --  SET PARTY INVENTORY ACTIVATOR
    --  =============================

    local partyInventoryUI = Ext.GetBuiltinUI(Dir.GameGUI .. "partyInventory.swf")
    Ext.RegisterUICall(partyInventoryUI, "openContextMenu", function(ui, call, id, itemDouble, x, y)
        local item = Ext.GetItem(Ext.DoubleToHandle(itemDouble))
        local targetMap = {
            ["RootTemplate"] = item.RootTemplate.Id,
            ["StatsId"] = item.StatsId,
        }
        for key, _ in pairs(ContextMenu.SubComponents) do
            local keyType, keyValue = DisintegrateString(key, "::")
            if targetMap[keyType] == keyValue then ContextMenu.Activator = key end
        end
        ContextMenu.Activator = ContextMenu.Activator or itemDouble
        ContextMenu.RegisterHooks = true
    end)

    --  REGISTER CONTEXT MENU HOOKS
    --  ===========================

    Ext.RegisterUITypeInvokeListener(ContextMenu.TypeID, "open", function(ui, call, ...)
        if not ContextMenu.RegisterHooks then return end

        local entries = ContextMenu.SubComponents[ContextMenu.Activator]
        if not entries then return end

        local contextMenu = ui:GetRoot()
        local actions = ContextMenu.Actions[ContextMenu.Activator]
        for _, entry in Spairs(entries) do
            local ID = entry.ID or contextMenu.windowsMenu_mc.list.length
            local actionID = entry.actionID or ID
            contextMenu.addButton(ID, actionID, entry.clickSound, "", entry.text, entry.isDisabled, entry.isLegal)
            actions[tonumber(actionID)] = entry.action
            contextMenu.addButtonsDone()
        end

        ContextMenu.RegisterHooks = false
    end, "Before")

    local UI = Ext.GetUIByType(ContextMenu.TypeID)
    Ext.RegisterUICall(UI, "buttonPressed", function(ui, call, id, actionID, handle)
        local actions = ContextMenu.Actions[ContextMenu.Activator] or {}
        if actions[tonumber(actionID)] then actions[tonumber(actionID)]() end
    end)

    Ext.RegisterUITypeInvokeListener(ContextMenu.TypeID, "close", function(ui, call, ...)
        ContextMenu.Activator = nil
    end)
end


--  ===============================================================
Ext.RegisterListener("SessionLoaded", RegisterContextMenuListeners)
--  ===============================================================