--  ===========
--  DIRECTORIES
--  ===========

Dir = {
    ["GameGUI"] = "Public/Game/GUI/",
    ["GameMasterGUI"] = "Public/Game/GUI/GM/",
    ["ModGUI"] = "Public/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/GUI/"
}

--  ===============================
--  REGISTER PATH-OVERRIDE LISTENER
--  ===============================

local files2Override = {
    ["GameGUI"] = {"msgBox.swf"},
    ["GameMasterGUI"] = {"GMJournal.swf"}
}

for target, fileList in pairs(files2Override) do
    for _, file in ipairs(fileList) do

        --  REGISTER LISTENER
        --  =================

        Ext.RegisterListener(
            "ModuleLoadStarted",
            function()
                Ext.AddPathOverride(Dir[target] .. file, Dir.ModGUI .. file)
            end
        )
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
