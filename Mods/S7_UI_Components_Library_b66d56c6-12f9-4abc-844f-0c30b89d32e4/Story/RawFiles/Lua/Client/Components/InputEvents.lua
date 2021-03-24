--  NOTES

-- InputDeviceID 0 Mouse
-- InputDeviceID 1 Keyboard

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
    ["AcceleratedRepeat"] = false,
    ["EventId"] = -1,
    ["Hold"] = false,
    ["InputDeviceId"] = 0,
    ["InputPlayerIndex"] = 0,
    ["Press"] = false,
    ["Release"] = false,
    ["Repeat"] = false,
    ["ValueChange"] = false
}

---Create a new InputEvent
---@param object InputEvent|table|nil
---@return InputEvent object
function InputEvent:Create(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---@class InputEventHandler
---@field InputDeviceID number 0 for mouse, 1 for keyboard
UILibrary.inputEvents = {
    InputDeviceID = 0,
    EventStack = {},
    Maps = {}
}

function UILibrary.inputEvents:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--  =====================================
InputEvents = UILibrary.inputEvents:New()
--  =====================================

-- Listen for InputEvents
-- Record current EventStack
-- If EventStack matches something in Map
-- Broadcast Event to Server and Client