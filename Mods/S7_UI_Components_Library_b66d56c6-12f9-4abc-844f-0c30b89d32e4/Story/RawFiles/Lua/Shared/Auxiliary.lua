--  ------------------------------------------------------------
ModInfo = Ext.GetModInfo("b66d56c6-12f9-4abc-844f-0c30b89d32e4")
IDENTIFIER = "S7_UI_Components_Library"
--  ------------------------------------------------------------

--  ===========
--  DIRECTORIES
--  ===========

Dir = {
    ["GameGUI"] = "Public/Game/GUI/", --  GameUI Directory
    ["GameMasterGUI"] = "Public/Game/GUI/GM/", -- GameMasterUI Directory
    ["ModGUI"] = "Public/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/GUI/", -- UI-Components-Library UI Directory
    ["Mod"] = "Mods/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/" -- UI-Components-Library Mod Directory
}

--  ==================
--  IMPORT AUXILIARIES
--  ==================

Ext.Require("Shared/Auxiliary/Colors.lua")
Ext.Require("Shared/Auxiliary/General.lua")
Ext.Require("Shared/Auxiliary/Networker.lua")

--  ===============
--  MOD INFORMATION
--  ===============

local modInfoTable = {
    ["Author"] = ModInfo.Author,
    ["Name"] = ModInfo.Name,
    ["UUID"] = ModInfo.UUID,
    ["Version"] = ModInfo.Version,
    ["PublishedVersion"] = ModInfo.PublishVersion,
    ["ModVersion"] = "0.0.0.0",
}

CENTRAL = {}    --  Holds Global Settings and Information
CENTRAL = LoadFile("S7Central.json") or {}
if CENTRAL[IDENTIFIER] == nil then CENTRAL[IDENTIFIER] = Rematerialize(modInfoTable) end

--  =============  MOD VERSIONING  ==============
Ext.Require("Shared/Auxiliary/ModVersioning.lua")
--  =============================================

--- Initialize CENTRAL
---@param ref table Reference table
---@param tar table Target table
local function initCENTRAL(ref, tar)
    for field, value in pairs(ref) do
        if ModInfo[field] then tar[field] = Rematerialize(ModInfo[field])
        else if not tar[field] then tar[field] = Rematerialize(value) end end
        if type(value) == 'table' then initCENTRAL(value, tar[field]) end
    end
end

initCENTRAL(modInfoTable, CENTRAL[IDENTIFIER])
CENTRAL[IDENTIFIER]["ModVersion"] = ParseVersion(ModInfo.Version, "string")
SaveFile("S7Central.json", CENTRAL)

--  =======================
--  TRAILING ZEROES COUNTER
--  =======================

---@param n number
---@return number count Number of trailing zeroes
function GetTrailingZeroes(n)
    local i, count = 10, 0
    while n % i == 0 do
        count = count + 1
        i = i * 10
    end
    return count
end

-- ============= MARKDOWN ==================
Ext.Require("Shared/Auxiliary/Markdown.lua")
-- =========================================