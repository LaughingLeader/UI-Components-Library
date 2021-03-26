--  ===============
--  LIVE UI REPORTS
--  ===============

local spammers = {
    ['updateStatuses'] = true,
    ['update'] = true,
    ['removeLabel'] = true
}

--  -------------------
LIVE_UI_REPORTS = false
--  -------------------

Ext.RegisterListener("UIObjectCreated", function (...)
    if not LIVE_UI_REPORTS then return end
    Ext.Print("UIObjectCreated:", ...)
end)

Ext.RegisterListener("UIInvoke", function (ui, call, ...)
    if not LIVE_UI_REPORTS then return end
    if spammers[call] then return end   --  Prevent spam
    Ext.Print("UIInvoke:", ui:GetTypeId(), call, ...)
end)

Ext.RegisterListener("UICall", function (ui, call, ...)
    if not LIVE_UI_REPORTS then return end
    if spammers[call] then return end   --  Prevent spam
    Ext.Print("UICall:", ui:GetTypeId(), call, ...)
end)

Ext.RegisterListener("InputEvent", function (...)
    if not LIVE_UI_REPORTS then return end
    local args = {...}
    Ext.Print("InputEvent:", Ext.JsonStringify(Rematerialize(args[1])))
end)

--  TOGGLE UI REPORT CONSOLE COMMAND
--  --------------------------------

ConsoleCommander:Register({

    --  ---------------------------------------------
    --  !S7_UI_Components_Library ToggleLiveUIReports
    --  ---------------------------------------------

    Name = "ToggleLiveUIReports",
    Description = "Displays a live feed of UI changes in the debug-console. (spam alert)",
    Context = "Client",
    Action = function() LIVE_UI_REPORTS = not LIVE_UI_REPORTS end
})