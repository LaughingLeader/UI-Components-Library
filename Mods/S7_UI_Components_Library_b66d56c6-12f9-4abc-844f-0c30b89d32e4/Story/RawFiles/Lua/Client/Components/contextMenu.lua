--  ============
--  CONTEXT MENU
--  ============

---@class ContextEntry @ContextEntries for ContextMenu
---@field ID number AFAIK only affects positon in FlashArray. (Optional) Auto-generated based on length of array
---@field actionID number This number is thrown on button-press and subsequently broadcasted on S7UCL::ContextMenu net-channel
---@field clickSound boolean Probably controls whether mouseClick produces a sound
---@field isDisabled boolean If true, the button is greyed out and cannot be pressed
---@field isLegal boolean If false, button is red and indicates an act of crime
---@field text string ContextMenu label text

---@alias activator string `ActivatorType::ActivatorValue`. e.g. StatsId::LOOT_Paper_Sheet_A

---@class ContextMenu @ContextMenu UI Component
---@field TypeID number UI TypeID. 11 or 10. Most listeners work for 11
---@field Activator activator ActivatorType::ActivatorValue. Ties activation and ContextEntries together
---@field Item EclItem Item that was right-clicked
---@field Character EclCharacter Character that right-clicked
---@field Intercept boolean Should intercept ContextMenu
---@field Component table Holds information about WindowElement
---@field SubComponents table<activator, ContextEntry[]> Array of constituting ContextEntries
UILibrary.contextMenu = {
    TypeID = 11, -- or 10
    Activator = "",
    Intercept = false,
    Component = {},
    SubComponents = {},
    -- Item = {},
    -- Character = {},
}

--- Initialize new ContextMenu object
---@param object nil|ContextMenu Object to instantiate
---@return ContextMenu object ContextMenu object
function UILibrary.contextMenu:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

--- Get Existing ContextEntries for given activator
---@param activator activator
---@return table<activator, ContextEntry[]>|nil ContextEntries
function UILibrary.contextMenu:Get(activator)
    if self.SubComponents[activator] then
        return self.SubComponents[activator]
    end
end

---Register new activator entry for the ContextMenu
---@param e table<activator, ContextEntry[]> ContextEntries
function UILibrary.contextMenu:Register(e)
    for activator, ctxEntry in pairs(e) do
        self.SubComponents[activator] = ctxEntry
    end
end

--  =====================================
ContextMenu = UILibrary.contextMenu:New()
--  =====================================

--  ======================
--  INTERCEPT CONTEXT MENU
--  ======================

--  PREPARE INTERCEPT
--  =================

---Pre-Intercept Setup
---@param ui UIObject
---@param call string External Interface Call
---@param itemDouble number
---@param x number
---@param y number
local function PreInterceptSetup(ui, call, itemDouble, x, y)
    ContextMenu.Item = Ext.GetItem(Ext.DoubleToHandle(itemDouble))  --  Set Item
    if not ContextMenu.Item then return end

    local statsActivator = 'StatsId::' .. ContextMenu.Item.StatsId  ---@type activator
    local templateActivator = 'RootTemplate::' .. ContextMenu.Item.RootTemplate.Id  ---@type activator

    -- Check if statsActivator ContextEntries have been registered already
    if ContextMenu.SubComponents[statsActivator] then
        ContextMenu.Activator = statsActivator  --  Set Activator
    end

    -- Check if templateActivator ContextEntries have been registered already
    if ContextMenu.SubComponents[templateActivator] then
        -- If statsActivator was also registered then inherit ContextEntries. RootTemplate has higher specificity
        if ContextMenu.SubComponents[statsActivator] then
            for _, ctx in Spairs(ContextMenu.SubComponents[statsActivator]) do
                table.insert(ContextMenu.SubComponents[templateActivator], ctx)
            end
        end
        ContextMenu.Activator = templateActivator   --  Set Activator
    end

    ContextMenu.Character = Ext.GetCharacter(ui:GetPlayerHandle())  --  Set Character
    ContextMenu.Activator = ContextMenu.Activator                   --  Set Activator
    ContextMenu.Intercept = IsValid(ContextMenu.Activator)          --  Go for Intercept if Activator IsValid
end

--  REGISTER LISTENERS
--  ==================

---Registers ContextMenu Listeners
local function RegisterContextMenuListeners()
    Debug:Print("Registering ContextMenu Listeners")

    --  Setup Party Inventory UI
    local partyInventoryUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'partyInventory.swf')
    Ext.RegisterUICall(partyInventoryUI, 'openContextMenu', function(ui, call, id, itemDouble, x, y)
        PreInterceptSetup(ui, call, itemDouble, x, y)
    end)

    --  Setup Container Inventory UI
    local containerInventoryUI = Ext.GetUIByType(9) or Ext.GetBuiltinUI(Dir.GameGUI .. 'containerInventory.swf')
    Ext.RegisterUICall(containerInventoryUI, 'openContextMenu', PreInterceptSetup)

    --  Setup Character Sheet UI
    local characterSheetUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'characterSheet.swf')
    Ext.RegisterUICall(characterSheetUI, 'openContextMenu', PreInterceptSetup)

    --  Setup Crafting UI
    local uiCraftUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'uiCraft.swf')
    Ext.RegisterUICall(uiCraftUI, 'openContextMenu', PreInterceptSetup)

    --  REGISTER CONTEXT MENU HOOKS ON INTERCEPT
    --  ========================================

    Ext.RegisterUITypeInvokeListener(ContextMenu.TypeID, 'open', function(ui, call, ...)
        if not ContextMenu.Intercept then return end    --  If Intercept was denied then return

        local entries = ContextMenu.SubComponents[ContextMenu.Activator]    --  Get ContextEntries
        if not entries then return end

        Debug:Print("Intercepted ContextMenu. Registering Hooks")
        local contextMenu = ui:GetRoot()

        for _, entry in Spairs(entries) do
            local ID = entry.ID or contextMenu.windowsMenu_mc.list.length   --  Defaults to auto-generated ID if entry.ID is not provided
            local actionID = entry.actionID or math.floor(ID * 100) --  Assigns actionID

            contextMenu.addButton(ID, actionID, entry.clickSound, "", entry.text, entry.isDisabled, entry.isLegal)
            contextMenu.addButtonsDone()
        end

        ContextMenu.Intercept = false   --  Done intercepting
    end, "Before")

    --  BUTTON PRESS
    --  ============

    local UI = Ext.GetUIByType(ContextMenu.TypeID)
    Ext.RegisterUICall(UI, 'buttonPressed', function(ui, call, id, actionID, handle)
        Debug:Print("ContextMenu Action: " .. tostring(actionID))

        local actionID = tonumber(actionID)

        local payload = {
            ["CharacterGUID"] = ContextMenu.Character.MyGuid,
            ["Activator"] = ContextMenu.Activator,
            ["actionID"] = actionID,
            ["ItemNetID"] = ContextMenu.Item.NetID
        }
        Ext.PostMessageToServer('S7UCL::ContextMenu', Ext.JsonStringify(payload))   --  Post ContextAction Payload to Server. Bounces back to Client
    end)

    --  MENU CLOSE
    --  ==========

    Ext.RegisterUITypeCall(ContextMenu.TypeID, 'menuClosed', function()
        ContextMenu.Activator = nil
    end)

    Debug:Print("ContextMenu Listener Registration Completed")
end

--  ===============================================================
Ext.RegisterListener('SessionLoaded', RegisterContextMenuListeners)
--  ===============================================================

--  ===============
--  GAME ACTION IDs
--  ===============

--[[
    ["Use"] = 2,
    ["Equip"] = 2,
    ["Launch"] = 2,
    ["Cast Skill"] = 2,
    ["Consume"] = 2,
    ["Open"] = 3,
    ["Unequip"] = 17,
    ["Examine"] = 22,
    ["Drop Item"] = 20,
    ["Combine With"] = 28,
    ["Add To Wares"] = 50,
    ["Remove From Wares"] = 51,
    ["Add To Hotbar"] = 63,
]]

--  =====================
--  SNAPSHOT CONTEXT MENU
--  =====================

---Print a snapshot of ContextMenu's current state to the debug-console and (optionally) save it in Osiris Data/S7Debug
---@param fileName string|nil if specified, will save the results in a .yaml file in `Osiris Data/S7Debug/`
local function SnapshotContextMenu(fileName)
    local ctxInfo = {
        TypeID = ContextMenu.TypeID,
        Activator = ContextMenu.Activator,
        Intercept = ContextMenu.Intercept,
        CharacterGUID = ContextMenu.Character.MyGuid,
    }

    Write:SetHeader('ContextMenu:')
    Write:Tabulate(ctxInfo)
    ctxInfo['SubComponent'] = Yamlify(ContextMenu.SubComponents[ContextMenu.Activator])
    Write:NewLine('SubComponent:\n')
    Write:NewLine(ctxInfo['SubComponent'])
    Debug:Print(Write:Display())

    ctxInfo['SubComponents'] = ContextMenu.SubComponents

    if IsValid(fileName) then
        SaveFile('S7Debug/' .. fileName .. '.yaml', Yamlify(ctxInfo))
    end
end

if Ext.IsDeveloperMode() then
    ConsoleCommander:Register({

        --  ---------------------------------------------
        --  !S7_UI_Components_Library SnapshotContextMenu
        --  ---------------------------------------------

        Name = 'SnapshotContextMenu',
        Description = 'Prints the current state of the ContextMenu object',
        Context = 'Client',
        Params = {[1] = 'fileName: string|nil - Will save results in Osiris Data/S7Debug/[fileName].yaml if specified'},
        Action = SnapshotContextMenu
    })
end