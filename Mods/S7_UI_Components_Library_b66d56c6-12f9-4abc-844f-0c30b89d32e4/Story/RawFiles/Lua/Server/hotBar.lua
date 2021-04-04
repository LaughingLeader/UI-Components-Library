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
    local _, character = Disintegrate(payload, ':')
    character = character or Osi.CharacterGetHostCharacter()
    if not HotBars[character] then HotBars[character] = {} end

    for i = 1, 145 do
        local row = math.modf(i/29)
        if not HotBars[character][row] then HotBars[character][row] = {} end
        local skillbarElement = Osi.NRD_SkillBarGetSkill(character, i - 1)
        if skillbarElement then HotBars[character][row][i] = skillbarElement end
    end

    Ext.PostMessageToClient(character, 'S7UCL::HotBarUpdate', Ext.JsonStringify(Rematerialize(HotBars[character])))
end)