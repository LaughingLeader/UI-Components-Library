--  ============
--  CONTEXT MENU
--  ============

---@class ContextEntry @ContextEntries for ContextMenu
---@field ID number|ResolverFunction AFAIK only affects positon in FlashArray. (Optional) Auto-generated based on length of array
---@field actionID number|ResolverFunction This number is thrown on button-press and subsequently broadcasted on S7UCL::ContextMenu net-channel
---@field clickSound boolean|ResolverFunction Probably controls whether mouseClick produces a sound
---@field isDisabled boolean|ResolverFunction If true, the button is greyed out and cannot be pressed
---@field isLegal boolean|ResolverFunction If false, button is red and indicates an act of crime
---@field text string|ResolverFunction ContextMenu label text
ContextEntry = {
    ID = function(r) return r.Root.windowsMenu_mc.list.length end,
    clickSound = true,
    isDisabled = false,
    isLegal = true,
    text = "null",
    --actionID = 0,
}

---Create new ContextEntry
---@param object ContextEntry
---@return ContextEntry
function ContextEntry:New(object)
    local object = object or {}
    object = Integrate(self, object)
    if not ValidInputTable(object, { 'actionID' }) then Debug:FError('Invalid ActionID') end
    object.New = nil -- Remove constructor from the object.
    return object
end

---@alias activator string `ActivatorType::ActivatorValue`. e.g. StatsId::LOOT_Paper_Sheet_A

---@class ContextMenu @ContextMenu UI Component
---@field TypeID number UI TypeID. 11 or 10. Most listeners work for 11
---@field Activator activator ActivatorType::ActivatorValue. Ties activation and ContextEntries together
---@field Item EclItem Item that was right-clicked (can also be a game-world character)
---@field Character EclCharacter Character that right-clicked (i.e. the player character)
---@field MouseTarget string DisplayName of the mouse-target
---@field Intercept boolean Should intercept ContextMenu
---@field Component table Holds information about WindowElement
---@field SubComponents table<activator, ContextEntry[]> Array of constituting ContextEntries
---@field UI UIObject UIObject
---@field Root table UIObject root
UILibrary.contextMenu = {
    TypeID = 11, -- or 10
    Activator = "",
    Intercept = false,
    Component = {},
    SubComponents = {},
    MouseTarget = "",
    UI = {},
    Root = {},
    Character = {},
    Item = {},
}

--- Initialize new ContextMenu object
---@param object nil|ContextMenu Object to instantiate
---@return ContextMenu object ContextMenu object
function UILibrary.contextMenu:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Get UI details
---@param ui UIObject UIObject from one of the listeners
function UILibrary.contextMenu:GetUI(ui)
    self.UI = ui or Ext.GetUIByType(self.TypeID) or Ext.GetBuiltinUI(Dir.GameGUI .. 'contextMenu.swf')
    self.Root = self.UI:GetRoot()
end

--- Get Existing ContextEntries for given activator
---@param activator activator
---@return table<activator, ContextEntry[]>|nil ContextEntries
function UILibrary.contextMenu:Get(activator)
    if self.SubComponents[activator] then
        return self.SubComponents[activator]
    end
end

---Adds CtxEntries to CtxMenu
---@param ctxMenu ContextEntry[]
---@param ctxEntries ContextEntry[]
function UILibrary.contextMenu:Add(ctxMenu, ctxEntries)
    if type(ctxEntries) ~= 'table' then return end
    ForEach(ctxEntries, function (_, entry)
        if IsValid(Pinpoint(entry.actionID, ctxMenu)) then return end
        table.insert(ctxMenu, ContextEntry:New(entry))
    end)
end

---Register new activator entry for the ContextMenu
---@param e table<activator, ContextEntry[]> ContextEntries
function UILibrary.contextMenu:Register(e)
    ForEach(e, function (activator, ctxEntries)
        if type(ctxEntries) ~= 'table' then return end
        if not self.SubComponents[activator] then self.SubComponents[activator] = {} end
        self:Add(self.SubComponents[activator], ctxEntries)
    end)
end

---Quick register options. Skips straight to registration
---@param e table<activator, ContextEntry[]> ContextEntries
function UILibrary.contextMenu:QuickRegister(e)
    ForEach(e, function (activator, ctxEntries)
        if type(ctxEntries) ~= 'table' then return end
        local ctxMenu = self:Get(activator) or {}
        self:Add(ctxMenu, ctxEntries)
        self:Register({[activator] = ctxMenu})
    end)
end

--  =====================================
ContextMenu = UILibrary.contextMenu:New()
--  =====================================

--  ======================
--  INTERCEPT CONTEXT MENU
--  ======================

--  DETERMINE ACTIVATOR
--  ===================

---Determine activator
---@param statsActivator activator
---@param templateActivator activator
local function determineActivator(statsActivator, templateActivator)
    -- Check if statsActivator ContextEntries have been registered already
    if ContextMenu.SubComponents[statsActivator] then
        ContextMenu.Activator = statsActivator  --  Set Activator
    end

    -- Check if templateActivator ContextEntries have been registered already
    if ContextMenu.SubComponents[templateActivator] then
        -- If statsActivator was also registered then inherit ContextEntries. RootTemplate has higher specificity
        if ContextMenu.SubComponents[statsActivator] then
            ContextMenu:Add(ContextMenu.SubComponents[templateActivator], ContextMenu.SubComponents[statsActivator])
        end
        ContextMenu.Activator = templateActivator   --  Set Activator
    end
end

--  PREPARE INTERCEPT
--  =================

---Pre-Intercept Setup
---@param ui UIObject
---@param call string External Interface Call
---@param itemDouble number
---@param x number
---@param y number
local function preInterceptSetup(ui, call, itemDouble, x, y)
    ContextMenu.Item = Ext.GetItem(Ext.DoubleToHandle(itemDouble))  --  Set Item
    if not ContextMenu.Item then return end

    local statsActivator = 'StatsId::' .. ContextMenu.Item.StatsId  ---@type activator
    local templateActivator = 'RootTemplate::' .. ContextMenu.Item.RootTemplate.Id  ---@type activator

    determineActivator(statsActivator, templateActivator)   --  Set Activator

    ContextMenu.Character = Ext.GetCharacter(ui:GetPlayerHandle())  --  Set Character
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
        preInterceptSetup(ui, call, itemDouble, x, y)
    end)

    --  Setup Container Inventory UI
    local containerInventoryUI = Ext.GetUIByType(9) or Ext.GetBuiltinUI(Dir.GameGUI .. 'containerInventory.swf')
    Ext.RegisterUICall(containerInventoryUI, 'openContextMenu', preInterceptSetup)

    --  Setup Character Sheet UI
    local characterSheetUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'characterSheet.swf')
    Ext.RegisterUICall(characterSheetUI, 'openContextMenu', preInterceptSetup)

    --  Setup Crafting UI
    local uiCraftUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'uiCraft.swf')
    Ext.RegisterUICall(uiCraftUI, 'openContextMenu', preInterceptSetup)

    --  Setup Game World
    --  ----------------

    ---Requests information about MouseTarget from the server
    ---@param text string DisplayName from enemyHealthBar.swf or tooltip.swf
    ---@param type string Character|Item
    local function requestInfoAboutMouseTarget(text, type)
        ContextMenu.MouseTarget = text
        if not IsValid(text) then return end

        local character = UserInformation.CurrentCharacter or Ext.GetBuiltinUI(Dir.GameGUI .. 'characterSheet.swf'):GetPlayerHandle()
        ContextMenu.Character = Ext.GetCharacter(character)
        if not ContextMenu.Character then return end

        local payload = {
            ['CharacterGUID'] = ContextMenu.Character.MyGuid,
            ['Target'] = ContextMenu.MouseTarget,
            ['TargetType'] = type,
            ['Position'] = ContextMenu.Character.WorldPos,
            ['SearchRadius'] = 20
        }
        Ext.PostMessageToServer(Channel.GameWorldTarget, Ext.JsonStringify(payload))
    end

    Ext.RegisterUITypeInvokeListener(EnemyHealthBar.TypeID, 'setText', function (ui, call, text, ...)
        requestInfoAboutMouseTarget(text, 'Character')
    end, 'Before')

    Ext.RegisterUITypeInvokeListener(Tooltip.TypeID, 'addTooltip', function(ui, call, text, ...)
        requestInfoAboutMouseTarget(text, 'Item')
    end, 'Before')

    Ext.RegisterNetListener(Channel.GameWorldTarget, function (channel, payload)
        local payload = Ext.JsonParse(payload) or {}
        if not IsValid(payload) then return end

        ContextMenu.Item = payload.Type == 'Character' and Ext.GetCharacter(payload.GUID) or Ext.GetItem(payload.GUID) --  Game-world target (item or character)

        local statsActivator = 'StatsId::' .. payload.StatsId  ---@type activator
        local templateActivator = 'RootTemplate::' .. payload.RootTemplate ---@type activator

        determineActivator(statsActivator, templateActivator)   --  Set Activator

        ContextMenu.Intercept = IsValid(ContextMenu.Activator)    -- Go for Intercept if Activator IsValid
    end)

    --  REGISTER CONTEXT MENU HOOKS ON INTERCEPT
    --  ========================================

    Ext.RegisterUITypeInvokeListener(ContextMenu.TypeID, 'open', function(ui, call, ...)
        if not ContextMenu.Intercept then return end    --  If Intercept was denied then return

        local ctxEntries = ContextMenu.SubComponents[ContextMenu.Activator]    --  Get ContextEntries
        if not ctxEntries then return end

        Debug:Print("Intercepted ContextMenu. Registering Hooks")
        ContextMenu:GetUI(ui)   --  Fetch UI details

        local resolverArguments = {
            ['Item'] = ContextMenu.Item,
            ['Character'] = ContextMenu.Character,
            ['Activator'] = ContextMenu.Activator,
            ['MouseTarget'] = ContextMenu.MouseTarget,
            ['UI'] = ContextMenu.UI,
            ['Root'] = ContextMenu.Root,
            ['TypeID'] = ContextMenu.TypeID,
            ['SubComponent'] = ctxEntries
        }

        ForEach(ctxEntries, function (_, entry)
            if type(entry) ~= 'table' then return end

            --  Resolved entry
            local resolved = Map(entry, function (key, value)
                if key == 'New' then return key, nil
                elseif type(value) == 'function' then return key, value(resolverArguments)
                else return key, value end
            end)

            --  Create buttons
            ContextMenu.Root.addButton(resolved.ID, resolved.actionID, resolved.clickSound, "", resolved.text, resolved.isDisabled, resolved.isLegal)
            ContextMenu.Root.addButtonsDone()
        end)

        ContextMenu.Intercept = false   --  Done intercepting
    end, "Before")

    --  BUTTON PRESS
    --  ============

    ContextMenu:GetUI()
    Ext.RegisterUICall(ContextMenu.UI, 'buttonPressed', function(ui, call, id, actionID, handle)
        Debug:Print("ContextMenu Action: " .. tostring(actionID))

        local actionID = tonumber(actionID)

        local payload = {
            ["CharacterGUID"] = ContextMenu.Character.MyGuid,
            ["Activator"] = ContextMenu.Activator,
            ["actionID"] = actionID,
            ["ItemNetID"] = ContextMenu.Item.NetID
        }
        Ext.PostMessageToServer(Channel.ContextMenu, Ext.JsonStringify(payload))   --  Post ContextAction Payload to Server. Bounces back to Client
    end)

    --  MENU CLOSE
    --  ==========

    Ext.RegisterUITypeCall(ContextMenu.TypeID, 'menuClosed', function()
        ContextMenu.Activator = nil
        ContextMenu.MouseTarget = nil
        ContextMenu.Item = nil
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
    ["Pickup And Add To Wares"] = 60,
    ["Add To Hotbar"] = 63,
]]

--  =====================
--  SNAPSHOT CONTEXT MENU
--  =====================

---Print a snapshot of ContextMenu's current state to the debug-console and (optionally) save it in Osiris Data/S7Debug
---@param fileName string|nil if specified, will save the results in a .yaml file in `Osiris Data/S7Debug/`
local function SnapshotContextMenu(fileName)
    local ctxInfo = Rematerialize(ContextMenu)
    ctxInfo['SubComponents'] = nil  --  Too long to be useful in the debug-console

    --  Pretty print snapshot
    Write:SetHeader('ContextMenu:')
    Write:Tabulate(ctxInfo)
    ctxInfo['SubComponent'] = Yamlify(ContextMenu.SubComponents[ContextMenu.Activator])
    Write:NewLine('SubComponent:\n')
    Write:NewLine(ctxInfo['SubComponent'])
    Debug:Print(Write:Display())

    ctxInfo['SubComponents'] = ContextMenu.SubComponents    --  Readd subcomponents for printing

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