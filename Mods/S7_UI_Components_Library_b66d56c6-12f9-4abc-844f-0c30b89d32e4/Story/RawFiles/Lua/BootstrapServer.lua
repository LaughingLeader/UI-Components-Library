--  =======
--  IMPORTS
--  =======

Ext.Require("Shared/Auxiliary.lua")
Ext.Require("Server/Development/DevMode.lua")

--  ===============================
--  BOUNCE BACK CONTEXT MENU SIGNAL
--  ===============================

Ext.RegisterNetListener("S7UCL_ContextMenu", function (channel, payload)
    local bounce = Ext.JsonParse(payload) or {}
    if bounce then Ext.PostMessageToClient(bounce.CharacterGUID, "S7UCL_ContextMenu", payload) end
end)