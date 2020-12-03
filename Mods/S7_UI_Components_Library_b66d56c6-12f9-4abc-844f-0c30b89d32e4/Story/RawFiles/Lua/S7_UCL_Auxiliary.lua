--  ===========
--  DIRECTORIES
--  ===========

Dir = {
    ["GameGUI"] = "Public/Game/GUI/",
    ["GameMasterGUI"] = "Public/Game/GUI/GM/",
    ["ModGUI"] = "Public/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/GUI/"
}

--  ========================
--  REGISTER DEBUG LISTENERS
--  ========================

function RegisterDebugHooks(UI)
    if Ext.IsDeveloperMode() then
        Ext.RegisterUICall(UI, "S7_DebugHook", function(ui, call, ...)
            local args = {...}
            Ext.Print("========================================================")
            Ext.Print("[S7_UCL:Lua:Auxiliary] --- " .. args[1] .. ":" .. args[2])
            Ext.Print("--------------------------------------------------------")
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
            Ext.Print("========================================================")
        end)
    end
end

--  ===============================
--  REGISTER PATH-OVERRIDE LISTENER
--  ===============================

local files2Override = {
    -- ["GameGUI"] = {
    --     "msgBox.swf",
    --     "pyramid.swf"
    -- },
    -- ["GameMasterGUI"] = {"GMJournal.swf"}
}

for target, fileList in pairs(files2Override) do
    for _, file in ipairs(fileList) do
        Ext.RegisterListener("ModuleLoadStarted", function() Ext.AddPathOverride(Dir[target] .. file, Dir.ModGUI .. file) end)
    end
end

--  =======
--  HELPERS
--  =======

--  REMATERIALIZE
--  -------------

function Rematerialize(element)
    return Ext.JsonParse(Ext.JsonStringify(element))
end

--  TRAILING ZEROES COUNTER
--  -----------------------

function GetTrailingZeroes(n)
    local count = 0
    local i = 10
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