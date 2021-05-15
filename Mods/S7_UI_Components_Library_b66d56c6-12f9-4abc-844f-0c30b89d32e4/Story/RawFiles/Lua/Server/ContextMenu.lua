--  ===============================
--  BOUNCE BACK CONTEXT MENU SIGNAL
--  ===============================

Ext.RegisterNetListener(Channel.ContextMenu, function (channel, payload)
    local bounce = Ext.JsonParse(payload) or {}
    if IsValid(bounce) then Ext.PostMessageToClient(bounce.CharacterGUID, Channel.ContextMenu, payload) end
end)