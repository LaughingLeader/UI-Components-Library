--  =============
--  PLAYER HOTBAR
--  =============

---@class HotBarRow @HotBar Row
---@field Contents table<number, string> HotBar row contents
---@field Next HotBarRow Reference to the next HotBar Row
---@field Prev HotBarRow Reference to the prev HotBar Row
HotBarRow = {
    Contents = {},
    -- Next = {},
    -- Prev = {}
}

---Create a new HotBar row and records it in the HotBar class
---@param row HotBarRow|table|nil
---@param rowNo number Position of HotBar row in cyclic queue
---@return HotBarRow object
function HotBarRow:New(row, rowNo)
    local object = {}
    object.Contents = Integrate(self, row)
    object.Prev = HotBar.Row[rowNo - 1]
    object.Next = HotBar.Row[rowNo]
    HotBar.Row[rowNo] = object
    return HotBar.Row[rowNo]
end

---@class HotBar @HotBar UI
---@field UI UIObject UI
---@field Root FlashObject UI Root
---@field TypeID number UI TypeID
---@field maxSlots number Maximum number of slots
---@field CurrentHotBarIndex number Index of the currently selected HotBar
---@field LastHotBarIndex number Index of the last HotBar
---@field Row table<number, HotBarRow> Cyclic Queue of HotBarRows
UILibrary.hotBar = {
    TypeID = 40,
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

function UILibrary.hotBar:Show(index)
    local index = tonumber(index)
    if not index then return end
    ForEach(self.Row, function(idx, row)
        Ext.PrintWarning(idx, index, row.Contents[1], row.Contents[2], row.Contents[3])
    end)
end

function UILibrary.hotBar:NextHotBar(index)
    Ext.Print('NextHotBar')
    if HotBar.CurrentHotBarIndex + 1 > HotBar.LastHotBarIndex then index = 1 end
    return index
end

function UILibrary.hotBar:PrevHotBar(index)
    Ext.Print('PrevHotBar')
    if HotBar.CurrentHotBarIndex - 1 < 1 then index = HotBar.LastHotBarIndex end
    return index
end

--  ===========================
HotBar = UILibrary.hotBar:New()
--  ===========================

Ext.RegisterUITypeInvokeListener(HotBar.TypeID, 'setCurrentHotbar', function(ui, call, index)
    local index = tonumber(index)
    if not index then return end
    if index == (HotBar.CurrentHotBarIndex % 5) + 1 or (index == 1 and HotBar.CurrentHotBarIndex == HotBar.LastHotBarIndex) then index = HotBar:NextHotBar(index)
    else  index = HotBar:PrevHotBar(index) end
    HotBar.CurrentHotBarIndex = index
end)

Ext.RegisterUITypeInvokeListener(HotBar.TypeID, 'updateSlots', function(ui, call)
    local character = UserInformation.CurrentCharacter
    if not character then return end
    Ext.PostMessageToServer('S7UCL::HotBarUpdate', 'UPDATE:' .. character)
end, 'After')

Ext.RegisterNetListener('S7UCL::HotBarUpdate', function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)
    if not IsValid(payload) then return end

    for i, row in pairs(payload) do
        HotBarRow:New(row, i + 1)
    end
end)

Ext.RegisterListener('SessionLoaded', function()
    HotBar.UI = Ext.GetUIByType(HotBar.TypeID)
    HotBar.Root = HotBar.UI:GetRoot()
end)