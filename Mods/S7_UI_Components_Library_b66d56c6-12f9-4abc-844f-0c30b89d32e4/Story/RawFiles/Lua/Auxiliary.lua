
----------------------------------------------------------------
--==============================================================

IDENTIFIER = 'S7_UI_Components_Library'

---@class MODINFO: ModInfo
---@field ModVersion string
---@field ModSettings table
---@field DefaultSettings table
---@field SubdirPrefix string
MODINFO = Ext.GetModInfo('b66d56c6-12f9-4abc-844f-0c30b89d32e4')

--  ========  AUX FUNCTIONS  ========
Ext.Require('AuxFunctions/Index.lua')
--  =================================

--==============================================================
----------------------------------------------------------------

--  ===========
--  DIRECTORIES
--  ===========

Dir = {
    ["GameGUI"] = "Public/Game/GUI/", --  GameUI Directory
    ["GameMasterGUI"] = "Public/Game/GUI/GM/", -- GameMasterUI Directory
    ["ModGUI"] = "Public/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/GUI/", -- UI-Components-Library UI Directory
    ["Mod"] = "Mods/S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4/" -- UI-Components-Library Mod Directory
}

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

-- ========= MARKDOWN ============
Ext.Require("Shared/Markdown.lua")
-- ===============================