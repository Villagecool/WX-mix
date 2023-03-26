function onCreate()
	makeLuaSprite('1', 'earthbound', -500, -500);

	
	addLuaSprite('1', false)
end
function onUpdatePost()
	setProperty('boyfriend.alpha', 0)
	triggerEvent('Camera Follow Pos', '438', '356')
end
-- dad: 348, 356
-- bf: 448, 356