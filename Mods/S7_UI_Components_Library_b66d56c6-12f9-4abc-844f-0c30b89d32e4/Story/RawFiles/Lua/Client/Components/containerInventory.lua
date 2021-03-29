--  ===================
--  CONTAINER INVENTORY
--  ===================

---@class ContainerInventory @Container Inventory UI
---@field TypeID number UI TypeID
---@field Container EclItem OpenedContainer
---@field MousedOverItem EclItem MousedOver Item
UILibrary.containerInventory = {
    TypeID = 9,
    -- Container = {},
    -- MousedOverItem = {},
}

---Instantiate new Container Inventory object
---@param object nil|ContainerInventory
---@return ContainerInventory object
function UILibrary.containerInventory:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--  ===================================================
ContainerInventory = UILibrary.containerInventory:New()
--  ===================================================

Ext.RegisterUITypeCall(ContainerInventory.TypeID, 'slotOver', function(ui, call, itemDouble)
    local item = Ext.GetItem(Ext.DoubleToHandle(itemDouble))
    ContainerInventory.MousedOverItem = item
end, 'After')