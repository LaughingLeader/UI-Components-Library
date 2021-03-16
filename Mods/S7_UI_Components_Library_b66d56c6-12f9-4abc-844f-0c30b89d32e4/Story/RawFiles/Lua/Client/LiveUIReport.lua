--  ===============
--  LIVE UI REPORTS
--  ===============

local spammers = {
    ['updateStatuses'] = true,
    ['addTooltip'] = true,
    ['update'] = true,
    ['removeLabel'] = true
}

--  ------------------
LIVE_UI_REPORTS = true
--  ------------------

Ext.RegisterListener("UIObjectCreated", function (...)
    if not LIVE_UI_REPORTS then return end
    Ext.Print("UIObjectCreated:", ...)
end)

Ext.RegisterListener("UIInvoke", function (ui, call, ...)
    if not LIVE_UI_REPORTS then return end
    if spammers[call] then return end   --  Prevent Spam
    Ext.Print("UIInvoke:", ui:GetTypeId(), call, ...)
end)

Ext.RegisterListener("UICall", function (ui, call, ...)
    if not LIVE_UI_REPORTS then return end
    if spammers[call] then return end   --  Prevent Spam
    Ext.Print("UICall:", ui:GetTypeId(), call, ...)
end)

Ext.RegisterListener("InputEvent", function (...)
    if not LIVE_UI_REPORTS then return end
    local args = {...}
    Ext.Print("InputEvent:", Ext.JsonStringify(args[1]))
end)

--  TOGGLE UI REPORT CONSOLE COMMAND
--  --------------------------------

ConsoleCommander:Register({
    Name = "ToggleLiveUIReports",
    Description = "Toggles UI Reports",
    Context = "Client",
    Action = function() LIVE_UI_REPORTS = not LIVE_UI_REPORTS end
})