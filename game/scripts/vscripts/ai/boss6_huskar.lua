function Spawn( entityKeyValues )
    thisEntity._abilitySpear = AICore:FindAbility(thisEntity, "ability_boss6_burning_spear" )
    thisEntity._abilitySpear:ToggleAutoCast()
    thisEntity._abilityLifebreak = AICore:FindAbility(thisEntity, "ability_boss6_life_break" )
    thisEntity._abilityInnerfire = AICore:FindAbility(thisEntity, "huskar_inner_fire" )
    thisEntity._abilityBattleTrance = AICore:FindAbility(thisEntity, "troll_warlord_battle_trance" )
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if thisEntity._abilityLifebreak:IsFullyCastable() then
        AICore:CastAbilityTargetMoreHP(thisEntity, thisEntity._abilityLifebreak, enemy)
    elseif thisEntity._abilityInnerfire:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityInnerfire)
    elseif thisEntity:GetHealth() < 2500 and thisEntity._abilityBattleTrance:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityBattleTrance)
    end
    return 1
end
