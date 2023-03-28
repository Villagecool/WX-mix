function onCreate()
	makeLuaSprite('1', 'earthbound', -500, -500);

	
	addLuaSprite('1', false)
end
function onUpdatePost()
	triggerEvent('Camera Follow Pos', '438', '356')
end
-- dad: 348, 356
-- bf: 448, 356
function onStartCountdown()
	setProperty('boyfriend.alpha', 0)
	setPropertyFromClass('GameOverSubstate', 'characterName', 'boom-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'BOOM');
end
function onGameOver()
	setProperty('boyfriend.alpha', 1)
	return Function_Continue
end