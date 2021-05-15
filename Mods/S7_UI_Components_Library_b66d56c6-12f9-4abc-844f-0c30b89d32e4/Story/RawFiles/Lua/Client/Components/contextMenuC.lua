--  =========================
--  CONTEXT MENU (CONTROLLER)
--  =========================

--- Inherit from base ContextMenu
ContextMenuC = ContextMenu:New({
    TypeID = 96,
    UIPath = Dir.GameGUI .. 'contextMenu_c.swf'
})

---Override preIntercept function for Controllers
function ContextMenuC:preIntercept()
    --  Setup Party Inventory UI
    local partyInventory_UI = Ext.GetBuiltinUI(Dir.GameGUI .. 'partyInventory_c.swf')
    Ext.RegisterUICall(partyInventory_UI, 'showActionMenuItem', function(ui, call, itemDouble, ownerDouble, itemIndex, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, x, y, partyInventory_UI)
    end)

    --  Setup Container Inventory UI
    local containerInventoryUI = Ext.GetUIByType(9) or Ext.GetBuiltinUI(Dir.GameGUI .. 'containerInventory.swf')
    Ext.RegisterUICall(containerInventoryUI, 'showActionMenuItem', function(ui, call, itemDouble, HLSlot, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, x, y, containerInventoryUI)
    end)

    --  Setup Character Sheet UI
    local characterSheetUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'characterSheet.swf')
    Ext.RegisterUICall(characterSheetUI, 'openContextMenu', function(ui, call, itemDouble, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, x, y, characterSheetUI)
    end)

    Ext.RegisterUITypeInvokeListener(5, 'updateOHs', function (ui, call, ...) self:prepareGameWorldIntercept() end, 'Before')
end

-- ===============================================================================================
Ext.RegisterListener('SessionLoaded', function () ContextMenuC:RegisterContextMenuListeners() end)
-- ===============================================================================================