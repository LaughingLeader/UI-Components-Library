--  =======
--  PYRAMID
--  =======

---@class Pyramid @UILibrary Pyramid
---@field private Exists boolean
---@field private UI UIObject
---@field private Root FlashObject
---@field public Component table
UILibrary.pyramid = {
    ["Exists"] = false,
    -- ["UI"] = {},
    -- ["Root"] = {},
    ["Component"] = {
        ["Name"] = "S7_UI_Pyramid",
        ["Layer"] = 5,
    }
}

--- Instantiate new Pyramid
---@param object table|nil Object to instantiate
---@return Pyramid object Pyramid Object
function UILibrary.pyramid:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--  =============================
Pyramid = UILibrary.pyramid:New()
--  =============================

--  ==============
--  CREATE PYRAMID
--  ==============

--- Create new Pyramid UI Component
---@param Specs table Pyramid build specifications
function CreatePyramid(Specs)
    if not Pyramid.Exists then   --  If Pyramid doesn't already exist
        Pyramid = UILibrary.pyramid:New(Specs)    --  Reinitialize Pyramid
        Ext.CreateUI(Pyramid.Component.Name, Dir.ModGUI .. "pyramid.swf", Pyramid.Component.Layer)
        Pyramid.UI = Ext.GetUI(Pyramid.Component.Name)
        Pyramid.Root = Pyramid.UI:GetRoot()

        Pyramid.Exists = true    --  Set Pyramid existance to true
        RenderPyramid(Specs)
    end
end

--  ==============
--  RENDER PYRAMID
--  ==============

--- Render Pyramid UI
--- @param Specs table Pyramid build specifications
--- @return Pyramid Pyramid
function RenderPyramid(Specs)
    --  Create if Pyramid doesn't already exist
    if not Pyramid.Exists then CreatePyramid(Specs) end

    --  -------------
    --  SPECS HANDLER
    --  -------------

    for key, handler in pairs(SpecsHandler["Pyramid"]) do handler(Pyramid[key]) end

    return Pyramid
end

SpecsHandler["Pyramid"] = {
    ["Component"] = function (Component)
    end,
}
