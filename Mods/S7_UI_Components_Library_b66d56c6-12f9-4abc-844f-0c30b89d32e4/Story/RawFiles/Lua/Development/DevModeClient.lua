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

--  ====
--  SCAN
--  ====

Scan = {["level"] = 0}
local function encapsulate(e) return tostring(e) .. "<" .. type(e):sub(0, 3) .. ">" end

--- Prints detailed information about element to the console
function Scan:Element(e)
    if type(e) == 'table' then
        for key, value in pairs(e) do
            Ext.Print(string.rep("-", self.level) .. encapsulate(key) .. " " .. encapsulate(value))
            if type(value) == 'table' then
                self.level = self.level + 1
                Scan:Element(value)
            end
        end
    else Ext.Print(string.rep("-", self.level) .. encapsulate(e)) end
    self.level = 0
end

--  =======================
--  REGISTER DEBUG LISTENER
--  =======================

---Rework this ugly mess lmao.
---@param UI UIObject
function RegisterDebugHooks(UI)
    Ext.RegisterUICall(UI, "S7_DebugHook", function(ui, call, ...)
        local args = {...}
        S7Debug:Print(tostring(args[1]) .. ":" .. tostring(args[2]))
        local i = 3
        while i <= #args do
            if args[i+1] ~= nil then
                S7Debug:Print(tostring(args[i]) .. ":" .. tostring(args[i+1]))
                i = i + 2
            else
                S7Debug:Print(tostring(args[i]))
                i = i + 1
            end
        end
    end)
end

--  ==================
--  CONTEXT MENU TESTS
--  ==================

ContextMenu:Register({
    ["RootTemplate::df7a8779-f908-43ac-b0ba-cb49d16308a9"] = {
        {
            -- ["ID"] = 1,
            ["actionID"] = 1,
            ['clickSound'] = true,
            ['text'] = "<font color='#3333CC'>Foo</font>",
            ['isDisabled'] = false,
            ['isLegal'] = true,
            ['action'] = function()
                Ext.Print("Foo")
                Ext.PostMessageToServer("TestChannel", "Foo")
            end
        },
        {
        -- ["ID"] = 2,
        ["actionID"] = 2,
        ['clickSound'] = true,
        ['text'] = "<font color='#CC3333'>Bar</font>",
        ['isDisabled'] = false,
        ['isLegal'] = true,
        ['action'] = function() Ext.Print("Bar") end
        }
    }
})
