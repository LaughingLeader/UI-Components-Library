--  ========================    NOTES   ===========================
-- InputDeviceID 0 Keyboard
-- InputDeviceID 1 Mouse

-- MOUSE
-- =====

-- (LCLICK) => 1 press, 4 release
-- (MCLICK) => 3 press, 3 release
-- (RCLICK) => 2 press, 223 press, 2 release, 223 release, 276 release

-- KEYBOARD
-- ========

-- (LSHIFT) => 232 press, 285 press, 232 release, 285 release
-- (SPACE) => 260 release
-- (ENTER) => 230 press
-- (ESC) => 223 press, 241 press
--  ===============================================================

---@class InputEvent @Input Event
---@field AcceleratedRepeat boolean
---@field EventId number
---@field Hold number
---@field InputDeviceId number
---@field InputPlayerIndex number
---@field Press boolean
---@field Release boolean
---@field Repeat boolean
---@field ValueChange boolean
InputEvent = {
    ['AcceleratedRepeat'] = false,
    ['EventId'] = -1,
    ['Hold'] = false,
    ['InputDeviceId'] = 0,
    ['InputPlayerIndex'] = 0,
    ['Press'] = false,
    ['Release'] = false,
    ['Repeat'] = false,
    ['ValueChange'] = false
}

---Create new InputEvent
---@param event InputEvent|table|nil
---@return InputEvent event
function InputEvent:New(event)
    local event = event or {}
    event = Integrate(self, event)
    return event
end

---@class InputEvents
---@field List table<number, InputEvent>
---@field Alias table<string, number>
UILibrary.inputEvents = {
    List = {},
    Alias = {
        ['LSHIFT'] = 232
    },
}

---Inistantiate new inputEvent object
---@param object InputEvents|table|nil
---@return InputEvents object
function UILibrary.inputEvents:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Check if a key is currently pressed
---@param key string|number Key Alias or EventId
---@return boolean
function UILibrary.inputEvents:isPressed(key)
    local idx = type(key) == 'string' and self.Alias[key] or key
    if not self.List[idx] then return false end
    return self.List[idx].Press
end

--  =====================================
InputEvents = UILibrary.inputEvents:New()
--  =====================================

Ext.RegisterListener('InputEvent', function(...)
    local args = {...}
    local event = args[1]

    if not InputEvents.List[event.EventId] then InputEvents.List[event.EventId] = InputEvent:New(event) -- Start tracking new InputEvent
    else InputEvents.List[event.EventId] = Integrate(InputEvents.List[event.EventId], event) end    -- Update InputEvent
end)