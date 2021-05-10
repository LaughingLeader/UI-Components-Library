HotBars = {
    --[[
        GUID = {
            [1] = { [0] = "Projectile_Fireball", [1] = "Shout_InspireStart", [4] = "Projectile_PyroclasticRock" },
            [6] = { [0] = "Projectile_Fireball", [3] = "Shout_InspireStart", [4] = "Projectile_PyroclasticRock" },
            [7] = { [2] = "Projectile_Fireball", [3] = "Shout_InspireStart", [4] = "Projectile_PyroclasticRock" },
        }
    --]]
}

function HotBars:GetAll(playerGUID)
    return self[playerGUID]
end

function HotBars:Get(playerGUID, barNo)
    if not self[playerGUID] then return end
    return self[playerGUID][barNo]
end

Ext.RegisterNetListener('S7UCL::HotBarUpdate', function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    local character, offset = Destructure(payload, {'characterGUID', 'offset'})
    character = character or Osi.CharacterGetHostCharacter()
    if not HotBars[character] then HotBars[character] = {} end

    for i = 1, 145 do
        local row = math.modf(i/29) + 1
        if not HotBars[character][row] then HotBars[character][row] = {} end
        local skillbarElement = Osi.NRD_SkillBarGetSkill(character, i - 1)
        if skillbarElement then HotBars[character][row][i % 29] = skillbarElement end
    end

    Ext.Print(Ext.JsonStringify(Rematerialize(HotBars[character])))

    Ext.PostMessageToClient(character, 'S7UCL::HotBarUpdate', Ext.JsonStringify(Rematerialize(HotBars[character])))
end)

Ext.RegisterNetListener('S7UCL::UpdateHotBar', function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)
    if not IsValid(payload) then return end

    for i = 1, 30 do
        Osi.NRD_SkillBarClear(Osi.CharacterGetHostCharacter(), i)
        if HotBars[Osi.CharacterGetHostCharacter()][payload] and HotBars[Osi.CharacterGetHostCharacter()][payload][i] then
            Osi.NRD_SkillBarSetSkill(Osi.CharacterGetHostCharacter(), i, HotBars[Osi.CharacterGetHostCharacter()][payload][i])
        end
    end
end)
