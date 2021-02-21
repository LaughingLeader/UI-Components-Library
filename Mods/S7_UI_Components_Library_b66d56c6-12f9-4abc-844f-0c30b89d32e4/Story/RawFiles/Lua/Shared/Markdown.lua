--  ===================
--  MARKDOWN TO JOURNAL
--  ===================

--- Converts Markdown file into JournalData
---@param str string Markdown
---@param rep table Table of string replacements
---@return table Specs BuildSpecifications for GMJournal
function Journalify(str, rep)
    if type(str) == 'table' then return {['GMJournal'] = Rematerialize(str)} end

    local title = ""
    local jData = {}
    local cat, chap, para = 0, 0, 0
    local catInc, chapInc, paraInc = 1000000, 1000, 1
    local rep = rep or {}

    local matchers = {
        ["title"] = "^%s-#%s+(.*)$",
        ["category"] = "^%s-##%s+(.*)$",
        ["chapter"] = "^%s-###%s+(.*)$",
        ["paragraph"] = "^%s-%-%s+(.*)$",
    }

    local replacers = {
        [1] = {["%*%*%*(.-)%*%*%*"] = Color:Red(" %1 ")},
        [2] = {["%*%*(.-)%*%*"] = Color:Orange(" %1 ")},
        [3] = {["[%*](.-)[%*]"] = Color:Air(" %1 ")},
        [4] = {["`(.-)`"] = Color:Green("%1")},
        [5] = {["==="] = string.rep("Ʃ", 10)}
    }
    for _, v in Spairs(rep) do table.insert(replacers, v) end

    for line in string.gmatch(str, "(.-)\r\n") do
        for _, repl in Spairs(replacers) do for key, value in pairs(repl) do line = line:gsub(key, value) end end

        if line:match(matchers.title) then title = line:match(matchers.title) end
        if line:match(matchers.category) then
            cat = cat + 1; chap, para = 0, 0
            if not jData[cat] then jData[cat] = {["Chapters"] = {}} end
            jData[cat]['ID'] = cat * catInc
            jData[cat]['strContent'] = line:match(matchers.category)
        end
        if line:match(matchers.chapter) then
            chap = chap + 1; para = 0
            if not jData[cat]["Chapters"][chap] then jData[cat]["Chapters"][chap] = {["Paragraphs"] = {}} end
            jData[cat]["Chapters"][chap]['ID'] = jData[cat]["ID"] + chap * chapInc
            jData[cat]["Chapters"][chap]['strContent'] = line:match(matchers.chapter)
        end
        if line:match(matchers.paragraph) then
            para = para + 1
            if not jData[cat]["Chapters"][chap]["Paragraphs"][para] then jData[cat]["Chapters"][chap]["Paragraphs"][para] = {} end
            jData[cat]["Chapters"][chap]["Paragraphs"][para]['ID'] = jData[cat]["Chapters"][chap]["ID"] + para * paraInc
            jData[cat]["Chapters"][chap]["Paragraphs"][para]['strContent'] = line:match(matchers.paragraph)
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
    return md
end