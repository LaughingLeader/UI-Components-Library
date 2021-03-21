--  ===============================
--  BOUNCE BACK CONTEXT MENU SIGNAL
--  ===============================

Ext.RegisterNetListener(Channel.ContextMenu, function (channel, payload)
    local bounce = Ext.JsonParse(payload) or {}
    if IsValid(bounce) then Ext.PostMessageToClient(bounce.CharacterGUID, Channel.ContextMenu, payload) end
end)

--  ==================================
--  GAME WORLD CONTEXT-MENU RESPONDERS
--  ==================================

---Check if the target and matcher has the same name
---@param target string
---@param matcher string
---@return boolean
local function sameName(target, matcher)
    if not IsValid(matcher) then return false end

    --  Substitute hyphens with underscores to avoid problems with string.match
    target = string.gsub(target, '%-', '_')
    matcher = string.gsub(matcher, '%-', '_')

    return string.match(target, matcher)
end

Ext.RegisterNetListener(Channel.GameWorldTarget, function (channel, payload)
    local Payload = Ext.JsonParse(payload) or {}
    Destringify(Payload)    --  Converts stringified numbers into actual numbers

    local x, y, z = table.unpack(Payload.Position)  --  World-Position of the character

    local response = {}
    if Payload.TargetType == 'Character' then
        local charactersInVicinity = Ext.GetCharactersAroundPosition(x, y, z, Payload.SearchRadius) --  Get characters around player

        for _, c in pairs(charactersInVicinity) do
            local character = Ext.GetCharacter(c)

            --  If any character with a name match is found, respond with character details and break
            if sameName(Payload.Target, character.DisplayName) then
                response = {
                    ['DisplayName'] = character.DisplayName,
                    ['GUID'] = c,
                    ['RootTemplate'] = character.RootTemplate.Id,
                    ['StatsId'] = character.Stats.Name,
                    ['Type'] = 'Character'
                }
                break
            end
        end
    else
        local itemsInVicinity = Ext.GetItemsAroundPosition(x, y, z, Payload.SearchRadius)   --  Get items around player

        for _, i in pairs(itemsInVicinity) do
            local object = Ext.GetItem(i)

            --  If any item with a name match is found, respond with item details and break
            if sameName(Payload.Target, object.DisplayName) or sameName(Payload.Target, object.CustomDisplayName) then
                response = {
                    ['DisplayName'] = object.DisplayName,
                    ['GUID'] = i,
                    ['RootTemplate'] = object.RootTemplate.Id,
                    ['StatsId'] = object.StatsId,
                    ['Type'] = 'Item'
                }
                break
            end
        end
    end

    Ext.PostMessageToClient(Payload.CharacterGUID, Channel.GameWorldTarget, Ext.JsonStringify(response))
end)