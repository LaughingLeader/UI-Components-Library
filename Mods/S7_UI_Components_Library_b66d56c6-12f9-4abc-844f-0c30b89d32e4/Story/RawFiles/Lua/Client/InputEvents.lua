--  NOTES

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

---@class InputEvent @Input Event
---@field Name string
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
    ['Name'] = "",
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

---@type table<number, InputEvent>
UILibrary.inputEvents = {}

InputEvents = UILibrary.inputEvents

Ext.RegisterListener('InputEvent', function (...)
    local args = {...}
    Ext.PrintWarning(Ext.JsonStringify(args))
    InputEvents[args[1].EventId] = args[1]
end)