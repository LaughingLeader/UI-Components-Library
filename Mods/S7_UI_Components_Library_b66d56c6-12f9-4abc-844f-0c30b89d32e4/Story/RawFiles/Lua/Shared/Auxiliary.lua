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

--  ==============  GENERAL ===============
Ext.Require("Shared/Auxiliary/General.lua")
--  =======================================

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

--  ===================
--  MARKDOWN TO JOURNAL
--  ===================

--- Converts Markdown file into JournalData
---@param str string Markdown
---@param rep table Table of string replacements
---@return table Specs BuildSpecifications for GMJournal
function Journalify(str, rep)
    local title = ""
    local jData = {}
    local cat, chap, para = 0, 0, 0
    local catInc, chapInc, paraInc = 1000000, 1000, 1
    local rep = rep or {}

    local matchers = {
        ["title"] = "^%s-#%s+",
        ["category"] = "^%s-##%s+",
        ["chapter"] = "^%s-###%s+",
        ["paragraph"] = "^%s-%-%s+",
    }

    local replacers = {
        [1] = {["%*%*%*(.-)%*%*%*"] = "<b><i>%1</i></b>"},
        [2] = {["[^%*]%*%*(.-)%*%*[^%*]"] = "<b>%1</b>"},
        [3] = {["[_%*`](.-)[_%*`]"] = "<i>%1</i>"},
        [4] = {["||(.-)||#(%w%w%w%w%w%w)"] = "<font color=\'#%2\'>%1</font>"},
        [5] = {["(%g-)|#(%w%w%w%w%w%w)"] = "<font color=\'#%2\'>%1</font>"}
    }
    for _, v in Spairs(rep) do table.insert(replacers, v) end

    for line in string.gmatch(str, "(.-)\r\n") do
        for _, repl in Spairs(replacers) do for key, value in pairs(repl) do line = line:gsub(key, value) end end


        if line:match(matchers.title) then
            local beg, fin = line:find(matchers.title)
            title = line:sub(fin + 1, -1)
        end
        if line:match(matchers.category) then
            local beg, fin = line:find(matchers.category)
            cat = cat + 1; chap, para = 0, 0
            if not jData[cat] then jData[cat] = {["Chapters"] = {}} end
            jData[cat]['ID'] = cat * catInc
            jData[cat]['strContent'] = line:sub(fin + 1, -1)
        end
        if line:match(matchers.chapter) then
            local beg, fin = line:find(matchers.chapter)
            chap = chap + 1; para = 0
            if not jData[cat]["Chapters"][chap] then jData[cat]["Chapters"][chap] = {["Paragraphs"] = {}} end
            jData[cat]["Chapters"][chap]['ID'] = jData[cat]["ID"] + chap * chapInc
            jData[cat]["Chapters"][chap]['strContent'] = line:sub(fin + 1, -1)
        end
        if line:match(matchers.paragraph) then
            local beg, fin = line:find(matchers.paragraph)
            para = para + 1
            if not jData[cat]["Chapters"][chap]["Paragraphs"][para] then jData[cat]["Chapters"][chap]["Paragraphs"][para] = {} end
            jData[cat]["Chapters"][chap]["Paragraphs"][para]['ID'] = jData[cat]["Chapters"][chap]["ID"] + para * paraInc
            jData[cat]["Chapters"][chap]["Paragraphs"][para]['strContent'] = line:sub(fin + 1, -1)
        end
    end

    local Specs = {
        ["GMJournal"] = {
            ["Component"] = {["Strings"] = {["caption"] = title}},
            ["JournalData"] = Rematerialize(jData)
        }
    }
    return Specs
end

--  ===================
--  JOURNAL TO MARKDOWN
--  ===================

--- Converts JournalData into Markdown
---@param jData table JournalData
---@return string md Markdown
function Markdownify(jData)
    local jData = Rematerialize(jData)
    local md = ""
    local title = jData.Component.Strings.caption
    md = "# " .. tostring(title) .. "\r\n"
    md = md .. string.rep("=", string.len(md)) .. "\r\n"

    for _, Category in pairs(jData.JournalData) do
        if not Category.strContent then break end
        local catTitle = "\n## " .. tostring(Category.strContent)
        md = md .. catTitle  .. "\r\n"
        md = md .. string.rep("-", string.len(catTitle)) .. "\r\n"

        if not Category.Chapters then break end
        for _, Chapter in pairs(Category.Chapters) do
            if not Chapter.strContent then break end
            local chapTitle = "\n### " .. tostring(Chapter.strContent)
            md = md .. chapTitle .. "\r\n"

            if not Chapter.Paragraphs then break end
            for _, Paragraph in pairs(Chapter.Paragraphs) do
                if not Paragraph.strContent then break end
                md = md .. "- " .. tostring(Paragraph.strContent) .. "\r\n"
            end
        end
    end

    local replacers = {
        [1] = {["%*%*%*%1%*%*%*"] = "<b><i>(.-)</i></b>"},
        [2] = {["%*%*%1%*%*"] = "<b>(.-)</b>"},
        [3] = {["_%1_"] = "<i>(.-)</i>"},
    }
    for _, repl in Spairs(replacers) do for key, value in pairs(repl) do md = md:gsub(value, key) end end
    return md
end