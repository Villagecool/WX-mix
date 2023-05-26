function onCreate()
	makeLuaSprite('1', 'weeb/kitchen-bg', -200, 150);
	makeLuaSprite('2', 'weeb/kitchen-fg', -200, 150);
	
	scaleObject('1', 6, 6)
	scaleObject('2', 6, 6)

	setProperty('1.antialiasing', false)
	setProperty('2.antialiasing', false)
	
	addLuaSprite('1', false)
	addLuaSprite('2', true)
end
-- dad: 348, 356
-- bf: 448, 356