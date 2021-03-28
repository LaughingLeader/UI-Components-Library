--  ===============
--  PARTY INVENTORY
--  ===============

---@class PartyInventory @Party Inventory UI
---@field TypeID number UI TypeID
---@field MousedOverItem EclItem MousedOver Item
---@field DoubleClickedItem EclItem DoubleClicked Item
UILibrary.partyInventory = {
    TypeID = 116,
    -- MousedOverItem = {},
    -- DoubleClickedItem = {},
}

---Instantiate new Party Inventory object
---@param object nil|PartyInventory
---@return PartyInventory object
function UILibrary.partyInventory:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--  ===========================================
PartyInventory = UILibrary.partyInventory:New()
--  ===========================================

Ext.RegisterUITypeCall(116, 'slotOver', function(ui, call, itemDouble)
    PartyInventory.MousedOverItem = Ext.GetItem(Ext.DoubleToHandle(itemDouble))
end, 'After')

Ext.RegisterUITypeCall(116, 'slotOut', function(ui, call, itemDouble)
    PartyInventory.MousedOverItem = nil
end, 'After')

Ext.RegisterUITypeCall(116, 'doubleClickItem', function(ui, call, itemHandle)
    PartyInventory.DoubleClickedItem = Ext.GetItem(Ext.DoubleToHandle(itemHandle))
end, 'Before')
