--  ------------------------------------------------------------
ModInfo = Ext.GetModInfo("b66d56c6-12f9-4abc-844f-0c30b89d32e4")
IDENTIFIER = "S7_UI_Components_Library"
--  ------------------------------------------------------------

--  ===========
--  DIRECTORIES
--  ===========

Dir = {
    ["GameGUI"] = "Public/Game/GUI/",   --  GameUI Directory
    ["GameMasterGUI"] = "Public/Game/GUI/GM/",  --  GameMasterUI Directory
    ["ModGUI"] = "Public/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/GUI/"    -- UCLibrary Directory
}

--  =============
--  REMATERIALIZE
--  =============

function Rematerialize(element, clones)
    clones = clones or {}
    local clone
    if type(element) == "table" then
        if clones[element] then clone = clones[element]
        else
            clone = {}
            clones[element] = clone
            for key, value in pairs(element) do clone[Rematerialize(key, clones)] = Rematerialize(value, clones) end
            setmetatable(clone, Rematerialize(getmetatable(element), clones))
        end
    else clone = element end

    return clone
end

--  ===========
--  DEBUG PRINT
--  ===========

function S7DebugPrint(...)
    local args = {...}
    local logMsg = args[1] or ""    -- The message to display
    local logSource = args[2] or "" -- The Source/Origin of the message
    local logType = args[3] or "Log"    -- The type of message (Log, Warning, Error)
    local ignoreDevMode = args[4] or false  -- Print message regardless of DeveloperMode
    local highlight = args[5] or false  -- Highlights the display message
    local highlightChar = args[6] or "="    -- Highlighting character

    if Ext.IsDeveloperMode() or ignoreDevMode then
        local context = ""
        if Ext.IsClient() then context = "C"
        elseif Ext.IsServer() then context = "S" end

        local logFunctions = {["Log"] = Ext.Print, ["Warning"] = Ext.PrintWarning, ["Error"] = Ext.PrintError}
        local printFunction = logFunctions[logType]

        local displayString = "[" .. IDENTIFIER .. ":Lua(" .. context .. "):" .. logSource .. "] --- " .. logMsg

        if highlight then printFunction(string.rep(highlightChar, string.len(displayString))) end
        printFunction(displayString)
        if highlight then printFunction(string.rep(highlightChar, string.len(displayString))) end
    end
end

--  =========================
--  VALIDATE NON-EMPTY STRING
--  =========================

function ValidString(str) --  Checks if a string is not nil and is not empty.
    if type(str) == "string" and str ~= nil and str ~= "" and str ~= "{}" and str ~= "[]" then return true
    else return false end
end

--  ===============
--  MOD INFORMATION
--  ===============

CENTRAL = {}    --  Holds Global Settings and Information
local file = Ext.LoadFile("S7Central.json") or "{}"
if ValidString(file) then CENTRAL = Ext.JsonParse(file) end
if CENTRAL[IDENTIFIER] == nil then CENTRAL[IDENTIFIER] = {} end

--  =====  MOD VERSIONING  =====
Ext.Require("ModVersioning.lua")
--  ============================

for k, v in pairs(ModInfo) do CENTRAL[IDENTIFIER][k] = v end
CENTRAL[IDENTIFIER]["ModVersion"] = ParseVersion(ModInfo.Version, "string")
Ext.SaveFile("S7Central.json", Ext.JsonStringify(CENTRAL))

--  =======================
--  REGISTER DEBUG LISTENER
--  =======================

function RegisterDebugHooks(UI)
    if Ext.IsDeveloperMode() then
        Ext.RegisterUICall(UI, "S7_DebugHook", function(ui, call, ...)
            local args = {...}
            Ext.Print("===================================================================================================")
            S7DebugPrint(tostring(args[1]) .. ":" .. tostring(args[2]))
            Ext.Print("---------------------------------------------------------------------------------------------------")
            local i = 3
            while i <= #args do
                if args[i+1] ~= nil then
                    Ext.Print(tostring(args[i]) .. ":" .. tostring(args[i+1]))
                    i = i + 2
                else
                    Ext.Print(tostring(args[i]))
                    i = i + 1
                end
            end
            Ext.Print("===================================================================================================")
        end)
    end
end

--  =======================
--  TRAILING ZEROES COUNTER
--  =======================

function GetTrailingZeroes(n)
    local i, count = 10, 0
    while n % i == 0 do
        count = count + 1
        i = i * 10
    end
    return count
end

--  ============================
--  DECLARATION OF GLOBAL TABLES
--  ============================

SpecsHandler = {}
BuildSpecifications = {}
UILibrary = {
    ["msgBox"] = {},
    ["GMJournal"] = {},
    ["Pyramid"] = {}
}