--  ===================
--  CONTAINER INVENTORY
--  ===================

---@class ContainerInventory @Container Inventory UI
---@field TypeID number UI TypeID
---@field Container EclItem OpenedContainer
UILibrary.containerInventory = {
    TypeID = 9,
    -- Container = {}
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
