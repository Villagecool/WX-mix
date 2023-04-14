gasterIsThere = false

function onEvent(name, value1, value2)
	if name == 'Sans_Gaster' then
		if value1 == 'Add' then
			gasterIsThere = true
			addLuaSprite('SansEvent_GasterHand', true)
		elseif value1 == 'Remove' then 
			gasterIsThere = false
			removeLuaSprite('SansEvent_GasterHand', true)

		end
	end	
end

function onCreate()
	downScroll = getPropertyFromClass('ClientPrefs', 'downScroll')
	if difficultyName == 'Easy' then
		gasterHealthBlock = 1.5 
		gasterHealthBlockSpriteX = 385
	else
		gasterHealthBlock = 1 
		gasterHealthBlockSpriteX = 540    
	end

	if downScroll then
		gasterHealthBlockSpriteY = 0
	else
		gasterHealthBlockSpriteY = 555
	end

	makeLuaSprite('SansEvent_GasterHand','SansEvent_GasterHand', gasterHealthBlockSpriteX, gasterHealthBlockSpriteY)
	setProperty('SansEvent_GasterHand.antialiasing', false)
	setObjectCamera('SansEvent_GasterHand', 'camHUD');
end

function onUpdate()
	if mustHitSection  == true then
		doTweenAlpha('SansStage_Gaster','SansStage_Gaster', 2, 3,'linear')
	else
		doTweenAlpha('SansStage_Gaster','SansStage_Gaster', 0, 2,'linear')
	end
	health = getProperty('health')
	if difficultyName == 'Omega' then
	else
		if (gasterIsThere == true) and (health > gasterHealthBlock) then
			setProperty('health', gasterHealthBlock)
		end
	end
end