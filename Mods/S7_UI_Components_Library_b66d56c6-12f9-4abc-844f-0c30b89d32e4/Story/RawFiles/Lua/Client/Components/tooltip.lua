--  =======
--  TOOLTIP
--  =======

---@class Tooltip @Tooltip UI
---@field TypeID number UI TypeID
---@field UIPath string UI Directory
UILibrary.tooltip = {
    TypeID = 44 or UILibrary.TypeID.tooltip,
    UIPath = Dir.GameGUI .. 'tooltip.swf'
}

---Instantiate new Tooltip object
---@param object nil|Tooltip
---@return Tooltip object
function UILibrary.tooltip:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--  =============================
Tooltip = UILibrary.tooltip:New()
--  =============================