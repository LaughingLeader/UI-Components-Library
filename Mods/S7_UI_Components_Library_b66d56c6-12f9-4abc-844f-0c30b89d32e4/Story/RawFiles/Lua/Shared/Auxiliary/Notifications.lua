--  =====================
--  NOTIFICATIONS MANAGER
--  =====================

Notifications = {
    ['Queue'] = {},
    ['mt'] = {}
}
setmetatable(Notifications, Notifications.mt)

function Notifications:Show()
    if Ext.IsClient() or not Ext.OsirisIsCallable() then return end
    local character = UserInformation.CurrentCharacter or Osi.CharacterGetHostCharacter()
    for k, notification in pairs(self.Queue) do
        Osi.ShowNotification(character, notification)
        self.Queue[k] = nil
    end
end

function Notifications:Push(txt) table.insert(self.Queue, txt) end
function Notifications:Unshift(txt) table.insert(self.Queue, 1, txt) end
function Notifications:Log(txt) self:Push(txt); self:Show() end
function Notifications:Warn(txt) self:Push(Color:Gold(txt)); self:Show() end
function Notifications:Error(txt) self:Push(Color:Red(txt)); self:Show() end

Notifications.mt.__newindex = function (tbl, key, value)
    Notifications:Log(value)
end

if Ext.IsServer() then
    Ext.RegisterOsirisListener('GameStarted', 2, 'after', function (level, gameMode)
        if not Osi.IsGameLevel(level) then return end
        Notifications:Show()
    end)
end
