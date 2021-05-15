--  =============
--  PLAYER HOTBAR
--  =============

---@type table<number, string>
HotBarRow = {}

---@class HotBar @HotBar UI
---@field UI UIObject UI
---@field Root UIRoot_hotBar UI Root
---@field TypeID number UI TypeID
---@field UIPath string UI Directory
---@field maxSlots number Maximum number of slots
---@field CurrentHotBarIndex number Index of the currently selected HotBar
---@field LastHotBarIndex number Index of the last HotBar
---@field Row table<number, table> Cyclic Queue of HotBarRows
UILibrary.hotBar = {
    TypeID = 40 or UILibrary.TypeID.hotBar,
    UIPath = Dir.GameGUI .. 'hotBar.swf',
    maxSlots = 29, -- According to hotBar.swf
    CurrentHotBarIndex = 1,
    LastHotBarIndex = 10,
    Row = {}
}

---Instantiate new HotBar object
---@param object nil|HotBar
---@return HotBar object
function UILibrary.hotBar:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Tracks moving to the next HotBar
---@param self HotBar
function UILibrary.hotBar:NextHotBar()
    if HotBar.CurrentHotBarIndex + 1 > HotBar.LastHotBarIndex then HotBar.CurrentHotBarIndex = 1
    else HotBar.CurrentHotBarIndex = HotBar.CurrentHotBarIndex + 1 end
end

---Tracks moving to the previous HotBar
---@param self HotBar
function UILibrary.hotBar:PrevHotBar()
    if HotBar.CurrentHotBarIndex - 1 < 1 then HotBar.CurrentHotBarIndex = HotBar.LastHotBarIndex
    else HotBar.CurrentHotBarIndex = HotBar.CurrentHotBarIndex - 1 end
end

--  ===========================
HotBar = UILibrary.hotBar:New()
--  ===========================

-- --  ====
-- --  INIT
-- --  ====

-- Ext.RegisterListener('SessionLoaded', function()
--     HotBar.UI = Ext.GetUIByType(HotBar.TypeID)
--     HotBar.Root = HotBar.UI:GetRoot()
-- end)

-- --  ==================
-- --  SET CURRENT HOTBAR
-- --  ==================

-- Ext.RegisterUITypeInvokeListener(HotBar.TypeID, 'setCurrentHotbar', function(ui, call, index)
--     local index = tonumber(index)
--     if not index or index == HotBar.CurrentHotBarIndex then return end

--     local movedForward = index == (HotBar.CurrentHotBarIndex % 5) + 1 or (index == 1 and HotBar.CurrentHotBarIndex == HotBar.LastHotBarIndex)
--     if movedForward then HotBar:NextHotBar() else HotBar:PrevHotBar() end
--     if HotBar.CurrentHotBarIndex <= 5 then return end

--     Timer:Delay(20, function()
--         HotBar.Root.setCurrentHotbar(HotBar.CurrentHotBarIndex)
--         Ext.PostMessageToServer('S7UCL::UpdateHotBar', Ext.JsonStringify(HotBar.CurrentHotBarIndex))
--     end)
-- end)

-- --  ============
-- --  SLOTS UPDATE
-- --  ============

-- Ext.RegisterUITypeInvokeListener(HotBar.TypeID, 'updateSlots', function(ui, call)
--     local character = UserInformation.CurrentCharacter
--     if not character then return end

--     local offset = HotBar.CurrentHotBarIndex > 5 and HotBar.CurrentHotBarIndex - 5 or 0
--     local payload = {
--         characterGUID = character,
--         offset = offset
--     }
--     Ext.PostMessageToServer('S7UCL::HotBarUpdate', Ext.JsonStringify(payload))
-- end, 'After')

-- Ext.RegisterNetListener('S7UCL::HotBarUpdate', function(channel, payload)
--     local payload = Ext.JsonParse(payload) or {}
--     Destringify(payload)
--     if not IsValid(payload) then return end

--     local offset = HotBar.CurrentHotBarIndex > 5 and HotBar.CurrentHotBarIndex - 5 or 0
--     for i, row in pairs(payload) do HotBar.Row[offset + i] = row end
-- end)