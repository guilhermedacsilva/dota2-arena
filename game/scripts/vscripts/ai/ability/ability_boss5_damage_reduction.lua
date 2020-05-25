function DamageReduction( keys )
    local attacker = keys.attacker
    local ability = keys.ability
    local ability_level = ability:GetLevel() - 1
    local target = keys.target

    -- Ability variables
    local stack_value = ability:GetLevelSpecialValueFor("damage_removed", ability_level)
    local max_stacks = ability:GetLevelSpecialValueFor("max_damage_removed", ability_level)
    local duration = ability:GetLevelSpecialValueFor("duration", ability_level)
    local mana_cost = ability:GetLevelSpecialValueFor("mana_cost", ability_level)
    local modifier_name = keys.modifier_name
    local stack_count = 0

    -- Check if the target is a Hero or a Hero illusion and check if the attacker has enough mana to apply the modifier
    if target:IsHero() and attacker:GetMana() >= mana_cost then

        -- Get the stack count if the target has a modifier from before
        if target:HasModifier(modifier_name) then
            stack_count = target:GetModifierStackCount(modifier_name, ability)
            target:RemoveModifierByName(modifier_name)
        end

        -- Do the stack calculation and make sure its within the stack limit
        stack_count = stack_count + stack_value
        if stack_count > max_stacks then stack_count = max_stacks end

        -- Apply the modifier
        ability:ApplyDataDrivenModifier(attacker, target, modifier_name, {duration = duration})
        target:SetModifierStackCount(modifier_name, ability, stack_count)

        -- Take the mana needed to apply the modifier
        attacker:SpendMana(mana_cost, ability)
    end
end
