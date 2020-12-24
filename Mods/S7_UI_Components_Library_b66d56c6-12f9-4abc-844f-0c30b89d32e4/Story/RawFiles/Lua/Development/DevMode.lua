--  ====================
--  DEBUG SPECIFICATIONS
--  ====================

--- Loads and applies UI specifications from DebugSpecs.json
---@param cmd string !S7_UI_Components_Library
---@param command string
Ext.RegisterConsoleCommand(IDENTIFIER, function(cmd, command, ...)
    local buildSpecs = LoadFile(Dir.Mod .. "Story/RawFiles/Lua/Development/DebugSpecs.json", "data") or {}
    if command == "BuildSampleUI" then UCLBuild(buildSpecs) end
end)