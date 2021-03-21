--  ================
--  ENEMY HEALTH BAR
--  ================

---@class EnemyHealthBar @Enemy Health Bar UI
---@field TypeID number UI TypeID
UILibrary.enemyHealthBar = {
    TypeID = 42
}

---Instantiate new Enemy Health Bar object
---@param object nil|EnemyHealthBar
---@return EnemyHealthBar object
function UILibrary.enemyHealthBar:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--  ===========================================
EnemyHealthBar = UILibrary.enemyHealthBar:New()
--  ===========================================