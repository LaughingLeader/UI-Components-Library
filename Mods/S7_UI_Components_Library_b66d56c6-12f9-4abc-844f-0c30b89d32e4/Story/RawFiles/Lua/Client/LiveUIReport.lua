--  ===============
--  LIVE UI REPORTS
--  ===============

---@class LIVE_UI_REPORTS
---@field Enable boolean
---@field Track table<string, boolean>
---@field Spammers table<string, boolean>
LIVE_UI_REPORTS = {
    --=============
    ENABLE = false,
    --=============
    Track = {
        ['UIObjectCreated'] = true,
        ['UIInvoke'] = true,
        ['UICall'] = true,
        ['InputEvent'] = false
    },
    Spammers = {
        ['updateStatuses'] = true,
        ['updateBtnInfos'] = true,
        ['update'] = true,
        ['removeLabel'] = true
    }
}

function LIVE_UI_REPORTS:Toggle() self.ENABLE = not self.ENABLE end
function LIVE_UI_REPORTS:ToggleTrack(event) if self.Track[event] then self.Track[event] = false else self.Track[event] = true end end
function LIVE_UI_REPORTS:ToggleSpammer(spam) if self.Spammers[spam] then self.Spammers[spam] = false else self.Spammers[spam] = true end end

--  =========
--  LISTENERS
--  =========

Ext.RegisterListener('UIObjectCreated', function (ui)
    if not LIVE_UI_REPORTS then return end
    if not LIVE_UI_REPORTS.Track['UIObjectCreated'] then return end
    Ext.Print('UIObjectCreated:', ui:GetTypeId())
end)

Ext.RegisterListener('UIInvoke', function (ui, call, ...)
    if not LIVE_UI_REPORTS then return end
    if not LIVE_UI_REPORTS.Track['UIInvoke'] then return end
    if LIVE_UI_REPORTS.Spammers[call] then return end   --  Prevent spam
    Ext.Print('UIInvoke:', ui:GetTypeId(), call, ...)
end)

Ext.RegisterListener('UICall', function (ui, call, ...)
    if not LIVE_UI_REPORTS then return end
    if not LIVE_UI_REPORTS.Track['UICall'] then return end
    if LIVE_UI_REPORTS.Spammers[call] then return end   --  Prevent spam
    Ext.Print('UICall:', ui:GetTypeId(), call, ...)
end)

Ext.RegisterListener('InputEvent', function (...)
    if not LIVE_UI_REPORTS then return end
    if not LIVE_UI_REPORTS.Track['InputEvent'] then return end
    local args = {...}
    Ext.Print('InputEvent:', Ext.JsonStringify(Rematerialize(args[1])))
end)

--  ================
--  CONSOLE COMMANDS
--  ================

--  TOGGLE UI REPORT
--  ----------------

ConsoleCommander:Register({

    --  ---------------------------------------------
    --  !S7_UI_Components_Library ToggleLiveUIReports
    --  ---------------------------------------------

    Name = "ToggleLiveUIReports",
    Description = "Displays a live feed of UI changes in the debug-console. (spam alert)",
    Context = "Client",
    Action = function() LIVE_UI_REPORTS:Toggle() end
})

--  TRACK/UNTRACK EVENT
--  -------------------

ConsoleCommander:Register({

    --  ------------------------------------------------------------
    --  !S7_UI_Components_Library ToggleTrackLiveUIEvent <EventName>
    --  ------------------------------------------------------------

    Name = "ToggleTrackLiveUIEvent",
    Description = "Toggles tracking of an UI Event",
    Context = "Client",
    Params = {[1] = 'EventName'},
    Action = function(eventName) LIVE_UI_REPORTS:ToggleTrack(eventName) end
})

--  TRACK/UNTRACK SPAMMER
--  ---------------------

ConsoleCommander:Register({

    --  -----------------------------------------------------------
    --  !S7_UI_Components_Library ToggleLiveUISpammer <SpammerName>
    --  -----------------------------------------------------------

    Name = "ToggleLiveUISpammer",
    Description = "Toggles tracking of an spammer",
    Context = "Client",
    Params = {[1] = 'SpammerName'},
    Action = function(spammerName) LIVE_UI_REPORTS:ToggleSpammer(spammerName) end
})