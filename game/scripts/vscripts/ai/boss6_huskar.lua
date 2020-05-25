function Spawn( entityKeyValues )
    abilitySpear = AICore:FindAbility(thisEntity, "ability_boss6_burning_spear" )
    abilitySpear:ToggleAutoCast()
    abilityLifebreak = AICore:FindAbility(thisEntity, "ability_boss6_life_break" )
    abilityInnerfire = AICore:FindAbility(thisEntity, "huskar_inner_fire" )
    abilityBattleTrance = AICore:FindAbility(thisEntity, "troll_warlord_battle_trance" )
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if abilityLifebreak:IsFullyCastable() then
        AICore:CastAbilityTargetMoreHP(thisEntity, abilityLifebreak, enemy)
    elseif abilityInnerfire:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, abilityInnerfire)
    elseif thisEntity:GetHealth() < 2500 and abilityBattleTrance:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, abilityBattleTrance)
    end
    return 1
end
