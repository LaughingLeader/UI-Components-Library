--  =======
--  IMPORTS
--  =======

Ext.Require("S7_UCL_Auxiliary.lua")

--  =======
--  PYRAMID
--  =======

Pyramid = UILibrary.Pyramid

--  Reinitialize Pyramid
--  ===================

function ReinitializePyramid()
    local defaultPyramid = {
        ["Exists"] = false,
        ["UI"] = {},
        ["Root"] = {},
        ["Component"] = {
        }
    }
    return defaultPyramid
end

Pyramid = Rematerialize(ReinitializePyramid())

--  ###################################################################################################################################################

--  ==============
--  CREATE PYRAMID
--  ==============

function CreatePyramid(Specs)
    if not Pyramid.Exists then   --  If Pyramid doesn't already exist
        ReinitializePyramid()    --  Reinitialize Pyramid
        Ext.CreateUI("S7_Pyramid", Dir.ModGUI .. "pyramid.swf", 7)   -- Get Pyramid UI
        Pyramid.UI = Ext.GetUI("S7_Pyramid")
        Pyramid.Root = Pyramid.UI:GetRoot()   --  Get UI Root

        Pyramid.Exists = true    --  Set Pyramid existance to true

        RenderPyramid(Specs)
    end
end

--  ==============
--  RENDER PYRAMID
--  ==============

function RenderPyramid(Specs)
    --  Create if Pyramid doesn't already exist
    if not Pyramid.Exists then CreatePyramid(Specs) end

    --  -------------
    --  SPECS HANDLER
    --  -------------

    if Specs ~= nil then
        for key, value in pairs(Specs) do
            if key == "Component" then
                if SpecsHandler["Pyramid"][key] ~= nil then
                    SpecsHandler["Pyramid"][key](value)
                end
            elseif key == "SubComponent" then
                for k, v in pairs(value) do
                    if SpecsHandler["Pyramid"][key][k] ~= nil then
                        SpecsHandler["Pyramid"][key][k](v)
                    end
                end
            end
        end
    end

    return Pyramid
end

SpecsHandler["Pyramid"] = {
    ["Component"] = function ()
        
    end
}

function RegisterTest()
    Ext.RegisterUICall(Ext.GetBuiltinUI("Public/Game/GUI/pyramid.swf"), "S7PyramidPressed", function(ui, call, id, iconName)
        Ext.Print(ui)
        Ext.Print(call)
        Ext.Print(id)
        Ext.Print(iconName)
    end)
end