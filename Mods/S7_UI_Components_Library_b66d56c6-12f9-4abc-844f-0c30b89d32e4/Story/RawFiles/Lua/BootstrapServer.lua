--  =======
--  IMPORTS
--  =======

Ext.Require("Shared/Auxiliary.lua")

--  ===============================
--  BOUNCE BACK CONTEXT MENU SIGNAL
--  ===============================

Ext.RegisterNetListener("S7UCL::ContextMenu", function (channel, payload)
    local bounce = Ext.JsonParse(payload) or {}
    if bounce then Ext.PostMessageToClient(bounce.CharacterGUID, "S7UCL::ContextMenu", payload) end
end)