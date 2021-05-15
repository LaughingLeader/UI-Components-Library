--  ===============
--  PARTY INVENTORY
--  ===============

---@class PartyInventory @Party Inventory UI
---@field TypeID number UI TypeID
---@field UIPath string UI Directory
---@field MousedOverItem EclItem MousedOver Item
---@field DoubleClickedItem EclItem DoubleClicked Item
UILibrary.partyInventory = {
    TypeID = UILibrary.TypeID.partyInventory,
    UIPath = Dir.GameGUI .. 'partyInventory.swf'
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

--  -------------------------------------------
PartyInventory = UILibrary.partyInventory:New()
--  -------------------------------------------

Ext.RegisterUITypeCall(PartyInventory.TypeID, 'slotOver', function(ui, call, itemDouble)
    local item = Ext.GetItem(Ext.DoubleToHandle(itemDouble))
    if not item then return end
    PartyInventory.MousedOverItem = item
end, 'After')

Ext.RegisterUITypeCall(PartyInventory.TypeID, 'slotOut', function(ui, call, itemDouble)
    PartyInventory.MousedOverItem = nil
end, 'After')

Ext.RegisterUITypeCall(PartyInventory.TypeID, 'doubleClickItem', function(ui, call, itemDouble)
    local item = Ext.GetItem(Ext.DoubleToHandle(itemDouble))
    if not item then return end
    PartyInventory.DoubleClickedItem = item
    ContainerInventory.Container = item
end, 'Before')

--  #####################################################################################################################################

--  ============================
--  PARTY INVENTORY (CONTROLLER)
--  ============================

--  ----------------------------------------------
PartyInventoryC = UILibrary.partyInventory:New({
    TypeID = UILibrary.TypeID.partyInventory_c,
    UIPath = Dir.GameGUI .. 'partyInventory_c.swf'
})
--  ----------------------------------------------