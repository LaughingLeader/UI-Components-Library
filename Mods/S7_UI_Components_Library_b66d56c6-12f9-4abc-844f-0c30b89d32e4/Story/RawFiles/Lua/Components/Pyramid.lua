--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")

--  =======
--  PYRAMID
--  =======

UILibrary.Pyramid = {
    ["Exists"] = false,
    ["UI"] = {},
    ["Root"] = {},
    ["Component"] = {
    }
}

Pyramid = UILibrary.Pyramid

UILibrary.Pyramid.mt = {}
setmetatable(UILibrary.Pyramid, UILibrary.Pyramid.mt)
UILibrary.Pyramid.mt.__index = UILibrary.Pyramid

function UILibrary.Pyramid:New(object)
    local object = object or {}
    setmetatable(object, self.mt)
    self.mt.__index = self
    return object
end

--  =============================
Pyramid = UILibrary.Pyramid:New()
--  =============================

--  ###################################################################################################################################################

--  ==============
--  CREATE PYRAMID
--  ==============

function CreatePyramid(Specs)
    if not Pyramid.Exists then   --  If Pyramid doesn't already exist
        Pyramid = UILibrary.Pyramid:New()    --  Reinitialize Pyramid
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
            if key == "Component" then if SpecsHandler["Pyramid"][key] ~= nil then SpecsHandler["Pyramid"][key](value) end
            elseif key == "SubComponent" then for k, v in pairs(value) do if SpecsHandler["Pyramid"][key][k] ~= nil then SpecsHandler["Pyramid"][key][k](v) end end
            end
        end
    end

    return Pyramid
end

SpecsHandler["Pyramid"] = {
    ["Component"] = function ()
    end
}
