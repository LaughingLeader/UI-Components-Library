--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")

--  ====================
--  DEBUG SPECIFICATIONS
--  ====================

Ext.RegisterConsoleCommand(IDENTIFIER, function(cmd, command, ...)
    local buildSpecs = Ext.LoadFile("Mods/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/Story/RawFiles/Lua/DebugSpecs.json", "data") or "{}"
    if command == "BuildSampleUI" then UCLBuild(buildSpecs) end
end)