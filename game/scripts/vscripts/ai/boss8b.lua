function Spawn( entityKeyValues )
    thisEntity._abilityAura = AICore:FindAbility(thisEntity, "necrolyte_heartstopper_aura" )
    thisEntity._abilityAura:SetLevel(2)
end
