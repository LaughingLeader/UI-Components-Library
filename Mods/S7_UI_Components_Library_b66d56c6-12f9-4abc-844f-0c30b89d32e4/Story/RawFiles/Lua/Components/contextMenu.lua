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
---@field Component table Holds information about WindowElement
---@field SubComponents table Array of Constituting Entries
UILibrary.contextMenu = {
    ["TypeID"] = 11,
    ["Activator"] = 0,
    ['Building'] = false,
    ["Component"] = {},
    ["SubComponents"] = {},
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
    Ext.RegisterUICall(partyInventoryUI, "openContextMenu", function (ui, call, id, itemDouble, x, y)
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
        ContextMenu.Building = true
        S7Debug:Print("Activator reset")
    end)

    --  REGISTER CONTEXT MENU HOOKS
    --  ===========================

    Ext.RegisterUITypeInvokeListener(ContextMenu.TypeID, "open", function (ui, call, ...)
        if not ContextMenu.Building then return end
        local entries = ContextMenu.SubComponents[ContextMenu.Activator]
        if not entries then return end

        local contextMenu = ui:GetRoot()
        for _, entry in Spairs(entries) do
            local ID = entry.ID or contextMenu.windowsMenu_mc.list.length
            local actionID = entry.actionID or ID
            contextMenu.addButton(ID, actionID, entry.clickSound, "", entry.text, entry.isDisabled, entry.isLegal)
            contextMenu.addButtonsDone()
        end

        ContextMenu.Building = false
    end, "Before")

    Ext.RegisterUITypeCall(ContextMenu.TypeID, "buttonPressed", function (ui, call, id, actionID, handle)
        Ext.Print(ui, call, id, actionID, handle)
    end)

    Ext.RegisterUITypeInvokeListener(ContextMenu.TypeID, "close", function(ui, call, ...)
        ContextMenu.Activator = nil
    end)
end


--  ===============================================================
Ext.RegisterListener("SessionLoaded", RegisterContextMenuListeners)
--  ===============================================================