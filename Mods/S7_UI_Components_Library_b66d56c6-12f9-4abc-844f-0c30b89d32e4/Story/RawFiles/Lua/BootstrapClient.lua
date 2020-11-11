--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")
Ext.Require("Components/msgBox.lua")

--  ==============================
--  TEMPORARY BUILD SPECIFICATIONS
--  ==============================

buildSpecifications = {
    ["msgBox"] = {
        ["Component"] = {
            ["PopupType"] = 4,
            ["renderImmediately"] = true
        },
        ["SubComponent"] = {
            ["Title"] = {
                ["Name"] = "Title",
                ["Order"] = 3,
                ["TitleText"] = "MyAwesomeTitle",
                ["Visible"] = true
            },
            ["Text"] = {
                ["Name"] = "Text",
                ["Text"] = "Lorem Ipsum Dolor amit de sulorLorem Ipsum Dolor amit de sulorLorem Ipsum Dolor amit de sulorLorem Ipsum Dolor amit de sulorLorem Ipsum Dolor amit de sulorLorem Ipsum Dolor amit de sulorLorem Ipsum Dolor amit de sulorLorem Ipsum Dolor amit de sulor",
                ["Order"] = 2,
                ["Visible"] = true
            },
            ["InputText"] = {
                ["Name"] = "InputText",
                ["InputEnable"] = true,
                ["Order"] = 1,
                ["InputText"] = "Enter your text here ...",
                ["Visible"] = true
            }
        }
    }
}

--  ===========
--  BUILDER MAP
--  ===========

local builder = {
    ["msgBox"] = renderMsgBox
}

--  ================
--  BUILDER FUNCTION
--  ================

function S7_UCL_Build()
    for UIName, Specs in pairs(buildSpecifications) do
        activeUI = builder[UIName](Specs)
        Ext.Print("Building " .. UIName)
    end
    return activeUI
end
