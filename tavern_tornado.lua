local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end


combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell(SPELL_INSTANT)

function tornadoEffect(position)
	-- position:sendMagicEffect(CONST_ME_ICETORNADO)
end

function onCastSpell(creature, variant)
	local playerPosition = Position(creature:getPosition())
	local posModifiers = { -2, -1, 0, 1, 2 }
	--for loop intended to send magic effect to random tiles within -2 or +2 of the player like the video seemed
	-- for i=1, 40 do
	-- 	math.randomseed( os.time() + i)
	-- 	playerPosition.x = playerPosition.x + posModifiers[math.random(#posModifiers)]
	-- 	playerPosition.y = playerPosition.y + posModifiers[math.random(#posModifiers)]
	-- 	tornadoEffect(doThing, i * 250, playerPosition)
	-- end
	-- inital attempt was to use the setArea and setParameter(effect) to match the video 
	-- but I couldn't find exactly how to use the "doCombat" or "doCombatArea" functions to match it exactly
	return combat:execute(creature, variant)
end
