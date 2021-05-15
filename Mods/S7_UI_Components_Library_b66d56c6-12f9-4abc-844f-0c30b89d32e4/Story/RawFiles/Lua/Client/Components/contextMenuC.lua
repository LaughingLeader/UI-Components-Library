--  =========================
--  CONTEXT MENU (CONTROLLER)
--  =========================

--- Inherit and extend base ContextMenu
ContextMenuC = ContextMenu:New({
    TypeID = 96 or UILibrary.TypeID.contextMenu_c,
    UIPath = Dir.GameGUI .. 'contextMenu_c.swf'
})

---Override prepareIntercepts function for Controllers
function ContextMenuC:prepareIntercepts()
    --  Prepare Party Inventory UI Intercept
    local partyInventory_UI = Ext.GetBuiltinUI(PartyInventoryC.UIPath)
    Ext.RegisterUICall(partyInventory_UI, 'showActionMenuItem', function(ui, call, itemDouble, ownerDouble, itemIndex, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, partyInventory_UI)
    end)

    --  Prepare Container Inventory UI Intercept
    local containerInventoryUI = Ext.GetUIByType(ContainerInventory.TypeID) or Ext.GetBuiltinUI(ContainerInventory.UIPath)
    Ext.RegisterUICall(containerInventoryUI, 'showActionMenuItem', function(ui, call, itemDouble, HLSlot, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, containerInventoryUI)
    end)

    --  Prepare GameWorld Intercept
    Ext.RegisterUITypeInvokeListener(UILibrary.TypeID.overhead, 'updateOHs', function (ui, call, ...) self:prepareGameWorldIntercept() end, 'Before')
end

-- ===========================================================================================================================
Ext.RegisterListener('SessionLoaded', function () if CONTROLLER_MODE then ContextMenuC:RegisterContextMenuListeners() end end)
-- ===========================================================================================================================