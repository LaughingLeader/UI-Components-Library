--  ============
--  CONTEXT MENU
--  ============

---@class ContextEntry @ContextEntries for ContextMenu
---@field ID number|ResolverFunction AFAIK only affects positon in FlashArray. (Optional) Auto-generated based on length of array
---@field actionID number|ResolverFunction This number is thrown on button-press and subsequently broadcasted on S7UCL::ContextMenu net-channel
---@field clickSound boolean|ResolverFunction Probably controls whether mouseClick produces a sound
---@field isDisabled boolean|ResolverFunction If true, the button is greyed out and cannot be pressed
---@field isUnavailable boolean|ResolverFunction If true, the button will not show up at all. Useful for exceptions
---@field isLegal boolean|ResolverFunction If false, button is red and indicates an act of crime
---@field text string|ResolverFunction ContextMenu label text
---@field range number|ResolverFunction ContextMenu range within which the option is available
---@field restrictUI nil|table|ResolverFunction If not nil, then ctxEntries will not show up for UI TypeIDs in this array. (-1 for game-world)
ContextEntry = {
    --actionID = 0,
    ID = function(r) return r.Root.windowsMenu_mc.list.length end,
    clickSound = true,
    isDisabled = false,
    isUnavailable = false,
    isLegal = true,
    text = "null",
    range = 0,
    --restrictUI = {},
}

---Create new ContextEntry
---@param object ContextEntry
---@return ContextEntry
function ContextEntry:New(object)
    local object = object or {}
    if not ValidInputTable(object, {'actionID'}) then Debug:FError("Invalid ActionID") end
    object = Integrate(self, object)
    object.New = nil -- Remove constructor from the object.
    return object
end

---@alias activator string `ActivatorType::ActivatorValue`. e.g. StatsId::LOOT_Paper_Sheet_A

---@class ContextMenu @ContextMenu UI Component
---@field TypeID number UI TypeID. Generally 11, sometimes 10.
---@field Activator activator ActivatorType::ActivatorValue. Ties activation and ContextEntries together
---@field Target EclItem|EclCharacter Item that was right-clicked (can also be a game-world character)
---@field Character EclCharacter Character that right-clicked (i.e. the player character)
---@field Origin number Origin of the CtxMenu. UI TypeID.
---@field TargetDistance number Distance between player and mouse-target
---@field TargetType string Character or Item
---@field Intercept boolean Should intercept ContextMenu
---@field Component table Holds information about WindowElement
---@field ContextEntries table<activator, ContextEntry[]> Array of constituting ContextEntries
---@field UIPath string SWF Directory
---@field UI UIObject UIObject
---@field Root UIRoot_contextMenu UIObject root
UILibrary.contextMenu = {
    TypeID = 11, -- or 10
    Activator = "",
    Intercept = false,
    Component = {},
    ContextEntries = {},
    Origin = -1,
    TargetDistance = 0,
    TargetType = 'Item',
    UIPath = Dir.GameGUI .. 'contextMenu.swf',
    -- UI = {},
    -- Root = {},
    -- Character = {},
    -- Target = {},
    -- ContextEntries = {},
    -- Component = {}
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
    self.UI = ui or Ext.GetUIByType(self.TypeID) or Ext.GetBuiltinUI(self.UIPath)
    self.Root = self.UI:GetRoot()   ---@type UIRoot_contextMenu
end

--- Get Existing ContextEntries for given activator
---@param activator activator
---@return table<activator, ContextEntry[]>|nil ContextEntries
function UILibrary.contextMenu:Get(activator)
    if self.ContextEntries[activator] then
        return self.ContextEntries[activator]
    end
end

---Adds CtxEntries to CtxMenu
---@param ctxMenu ContextEntry[]
---@param ctxEntries ContextEntry[]
function UILibrary.contextMenu:Add(ctxMenu, ctxEntries)
    if type(ctxEntries) ~= 'table' then return end
    ForEach(ctxEntries, function (_, entry)
        if type(entry) ~= 'table' then return end
        if IsValid(Pinpoint(entry.actionID, ctxMenu)) then return end
        table.insert(ctxMenu, ContextEntry:New(entry))
    end)
end

---Register new activator entry for the ContextMenu
---@param e table<activator, ContextEntry[]> ContextEntries
function UILibrary.contextMenu:Update(e)
    ForEach(e, function (activator, ctxEntries)
        if type(ctxEntries) ~= 'table' then return end
        if not self.ContextEntries[activator] then self.ContextEntries[activator] = {} end
        self:Add(self.ContextEntries[activator], ctxEntries)
    end)
end

---Quick register options. Skips straight to registration
---@param e table<activator, ContextEntry[]> ContextEntries
function UILibrary.contextMenu:Register(e)
    ForEach(e, function (activator, ctxEntries)
        if type(ctxEntries) ~= 'table' then return end
        local ctxMenu = self:Get(activator) or {}
        self:Add(ctxMenu, ctxEntries)
        self:Update({[activator] = ctxMenu})
    end)
end

--  DETERMINE ACTIVATOR
--  ===================

--  TODO: Refactor this ugly mess into something more maintainable.
---Determine activator
---@param statsActivator activator
---@param templateActivator activator
function UILibrary.contextMenu:determineActivator(targetType, statsActivator, templateActivator)
    local targetType = targetType or "Item"
    local anyActivator = 'Any::' .. targetType
    self.Activator = anyActivator

    -- Check if statsActivator ContextEntries have been registered already
    if self.ContextEntries[statsActivator] then
        -- If anyActivators have also been registered then inherit ContextEntries. statsActivator has higher specificity than anyActivator
        if self.ContextEntries[anyActivator] then
            self:Add(self.ContextEntries[statsActivator], self.ContextEntries[anyActivator])
        end
        ContextMenu.Activator = statsActivator  --  Set Activator
    end

    -- Check if templateActivator ContextEntries have been registered already
    if self.ContextEntries[templateActivator] then
        -- If anyActivators have also been registered then inherit ContextEntries. statsActivator has higher specificity than anyActivator
        if self.ContextEntries[anyActivator] then
            self:Add(self.ContextEntries[templateActivator], self.ContextEntries[anyActivator])
        end
        -- If statsActivator was also registered then inherit ContextEntries. RootTemplate has higher specificity than statsActivator
        if self.ContextEntries[statsActivator] then
            self:Add(self.ContextEntries[templateActivator], self.ContextEntries[statsActivator])
        end
        self.Activator = templateActivator   --  Set Activator
    end
end

--  ======================
--  INTERCEPT CONTEXT MENU
--  ======================

--  PREPARE INTERCEPT
--  =================

--TODO: Both prepareIntercepts can probably be reduced to a single function

---Prepare UI Intercept Setup
---@param ui UIObject
---@param call string External Interface Call
---@param itemDouble number
---@param x number
---@param y number
---@param origin UIObject Origin UI
function UILibrary.contextMenu:prepareUIIntercept(ui, call, itemDouble, x, y, origin)
    self.Origin = origin:GetTypeId() or self.Origin   -- TypeID of the Origin UI element

    self.Target = Ext.GetItem(Ext.DoubleToHandle(itemDouble))  --  Set Item
    if not self.Target then return end
    self.TargetType = 'Item'
    self.TargetDistance = 0

    local statsActivator = 'StatsId::' .. self.Target.StatsId  ---@type activator
    local templateActivator = 'RootTemplate::' .. self.Target.RootTemplate.Id  ---@type activator

    self:determineActivator(self.TargetType, statsActivator, templateActivator)   --  Set Activator

    self.Character = Ext.GetCharacter(ui:GetPlayerHandle())  --  Set Character
    self.Intercept = IsValid(self.Activator)          --  Go for Intercept if Activator IsValid
end

---Prepare GameWorld Intercept Setup
function UILibrary.contextMenu:prepareGameWorldIntercept()
    local pickingState = Ext.GetPickingState()
    if not (pickingState.HoverEntity) then return end
    self.Origin = -1
    self.Character = Ext.GetCharacter(UserInformation.CurrentCharacter)

    ---@type activator
    local statsActivator, templateActivator
    if Ext.GetHandleType(pickingState.HoverEntity) == 'ClientCharacter' then
        self.TargetType = 'Character'
        self.Target = Ext.GetCharacter(pickingState.HoverEntity)
        statsActivator = 'StatsId::' .. self.Target.Stats.Name
        templateActivator = 'RootTemplate::' .. self.Target.RootTemplate.Id
    elseif Ext.GetHandleType(pickingState.HoverEntity) == 'ClientItem' then
        self.TargetType = 'Item'
        self.Target = Ext.GetItem(pickingState.HoverEntity)
        statsActivator = 'StatsId::' .. self.Target.StatsId
        templateActivator = 'RootTemplate::' .. self.Target.RootTemplate.Id
    end

    if not self.Character or not self.Target then return end
    self.TargetDistance = CalculateDistance(self.Character.WorldPos, self.Target.WorldPos)

    self:determineActivator(self.TargetType, statsActivator, templateActivator)   --  Set Activator
    self.Intercept = IsValid(self.Activator)    -- Go for Intercept if Activator IsValid
end

--  REGISTER LISTENERS
--  ==================

---Pre-Intercept Setup
function UILibrary.contextMenu:preIntercept()
    --  Setup Party Inventory UI
    local partyInventoryUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'partyInventory.swf')
    Ext.RegisterUICall(partyInventoryUI, 'openContextMenu', function(ui, call, id, itemDouble, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, x, y, partyInventoryUI)
    end)

    --  Setup Container Inventory UI
    local containerInventoryUI = Ext.GetUIByType(9) or Ext.GetBuiltinUI(Dir.GameGUI .. 'containerInventory.swf')
    Ext.RegisterUICall(containerInventoryUI, 'openContextMenu', function(ui, call, itemDouble, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, x, y, containerInventoryUI)
    end)

    --  Setup Character Sheet UI
    local characterSheetUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'characterSheet.swf')
    Ext.RegisterUICall(characterSheetUI, 'openContextMenu', function(ui, call, itemDouble, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, x, y, characterSheetUI)
    end)

    -- --  Setup Crafting UI
    local uiCraftUI = Ext.GetBuiltinUI(Dir.GameGUI .. 'uiCraft.swf')
    Ext.RegisterUICall(uiCraftUI, 'openContextMenu', function(ui, call, itemDouble, x, y)
        self:prepareUIIntercept(ui, call, itemDouble, x, y, uiCraftUI)
    end)

    Ext.RegisterUITypeInvokeListener(Tooltip.TypeID, 'addTooltip', function (ui, call, ...) self:prepareGameWorldIntercept() end, 'Before')
    Ext.RegisterUITypeInvokeListener(EnemyHealthBar.TypeID, 'setText', function (ui, call, ...) self:prepareGameWorldIntercept() end, 'Before')
end

---Registers ContextMenu Listeners
function UILibrary.contextMenu:RegisterContextMenuListeners()
    Debug:Print("Registering ContextMenu Listeners")

    self:preIntercept()

    --  REGISTER CONTEXT MENU HOOKS ON INTERCEPT
    --  ========================================

    Ext.RegisterUITypeInvokeListener(self.TypeID, 'open', function(ui, call, ...)
        if not self.Intercept then return end    --  If Intercept was denied then return

        local ctxEntries = self.ContextEntries[self.Activator] or ContextMenu.ContextEntries[self.Activator]    --  Get ContextEntries. (if ContextMenuC then fallback and retrieve base ContextEntries)
        if not ctxEntries then return end

        Debug:Print("Intercepted ContextMenu. Registering Hooks")
        self:GetUI(ui)   --  Fetch UI details

        --  These will be passed into Resolver functions below
        local resolverArguments = {
            ['Target'] = self.Target,
            ['Character'] = self.Character,
            ['Activator'] = self.Activator,
            ['TargetDistance'] = self.TargetDistance,
            ['TargetType'] = self.TargetType,
            ['UI'] = self.UI,
            ['Root'] = self.Root,
            ['TypeID'] = self.TypeID,
            ['ctxEntries'] = ctxEntries,
            ['InputEvents'] = InputEvents
        }

        --  Adding ctxEntries
        ForEach(ctxEntries, function (_, entry)
            if type(entry) ~= 'table' then return end

            --  Resolve ctxEntry
            local resolved = Map(entry, function (key, value)
                if key == 'New' then return key, nil end
                return key, Resolve(value, resolverArguments)
            end)

            if resolved.isUnavailable then return end -- if isUnavailable is true then return
            if resolved.restrictUI ~= nil and IsValid(Pinpoint(self.Origin, resolved.restrictUI)) then return end -- If UI TypeID is in restrictUI array then return.
            if self.Origin == -1 and resolved.range > self.TargetDistance then return end

            --  Create buttons
            self.Root.addButton(resolved.ID, resolved.actionID, resolved.clickSound, "", resolved.text, resolved.isDisabled, resolved.isLegal)
            self.Root.addButtonsDone()
            Ext.PrintWarning('3')
        end)

        self.Intercept = false   --  Done intercepting
    end, "Before")

    --  BUTTON PRESS
    --  ============

    self:GetUI()
    Ext.RegisterUICall(self.UI, 'buttonPressed', function(ui, call, id, actionID, handle)
        Debug:Print("ContextMenu Action: " .. tostring(actionID))

        local itemNetID
        local actionID = tonumber(actionID)
        if self.Target then itemNetID = self.Target.NetID end

        local payload = {
            ['CharacterGUID'] = self.Character.MyGuid,
            ['Activator'] = self.Activator,
            ['actionID'] = actionID,
            ['TargetDistance'] = self.TargetDistance,
            ['TargetType'] = self.TargetType,
            ['ItemNetID'] = itemNetID
        }
        Ext.PostMessageToServer(Channel.ContextMenu, Ext.JsonStringify(payload))   --  Post ContextAction Payload to Server. Bounces back to Client
    end)

    --  MENU CLOSE
    --  ==========

    Ext.RegisterUITypeCall(self.TypeID, 'menuClosed', function()
        self.TargetDistance = 0
        self.Target = nil
        self.Origin = nil
        self.Activator = nil
    end)

    Debug:Print("ContextMenu Listener Registration Completed")
end

--  =====================
--  SNAPSHOT CONTEXT MENU
--  =====================

---Print a snapshot of ContextMenu's current state to the debug-console and (optionally) save it in Osiris Data/S7Debug
---@param fileName string|nil if specified, will save the results in a .yaml file in `Osiris Data/S7Debug/`
function UILibrary.contextMenu:Snapshot(fileName)
    local ctxInfo = Rematerialize(self) -- Drops non-stringifiable elements
    ctxInfo['ContextEntries'] = nil  --  Too big to be useful in the debug-console

    --  Pretty print snapshot
    Write:SetHeader('ContextMenu:')
    Write:Tabulate(ctxInfo)
    if self.ContextEntries[self.Activator] then
        ctxInfo['ContextEntry'] = Yamlify(self.ContextEntries[self.Activator])
        Write:NewLine('ContextEntry:\n')
        Write:NewLine(ctxInfo['ContextEntry'])
    end
    Debug:Print(Write:Display())

    ctxInfo['ContextEntries'] = self.ContextEntries    --  Re-add ContextEntries for printing

    --  Save to external yaml file if fileName was specified
    if IsValid(fileName) then
        SaveFile('S7Debug/' .. fileName .. '.yaml', Yamlify(ctxInfo))
    end
end

--  =====================================
ContextMenu = UILibrary.contextMenu:New()
--  =====================================

--  ============================================================================================================================
if not CONTROLLER_MODE then Ext.RegisterListener('SessionLoaded', function() ContextMenu:RegisterContextMenuListeners() end) end
--  ============================================================================================================================

--  =====================
--  SNAPSHOT CONTEXT MENU
--  =====================

if Ext.IsDeveloperMode() then
    ConsoleCommander:Register({

        --  ---------------------------------------------
        --  !S7_UI_Components_Library SnapshotContextMenu
        --  ---------------------------------------------

        Name = 'SnapshotContextMenu',
        Description = 'Prints the current state of the ContextMenu object',
        Context = 'Client',
        Params = {[1] = 'fileName: string|nil - Will save results in Osiris Data/S7Debug/[fileName].yaml if specified'},
        Action = function() ContextMenu:Snapshot() end
    })
end

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