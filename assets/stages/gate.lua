function onCreate()
	makeLuaSprite('1', 'gate/sky', -600, -650);
	makeLuaSprite('2', 'gate/ground', -600, -350);
	makeLuaSprite('3', 'gate/backtrees', -600, -350);
	makeLuaSprite('4', 'gate/gate', -600, -350);
	makeLuaSprite('5', 'gate/backLight', -600, -350);
	makeLuaSprite('6', 'gate/frontLight', -600, -350);
	makeLuaSprite('7', 'gate/frontbush', -600, -350);
	
	scaleObject('1', 2, 2)
	scaleObject('2', 3, 3)
	scaleObject('3', 3, 3)
	scaleObject('4', 3, 3)
	scaleObject('5', 3, 3)
	scaleObject('6', 3, 3)
	scaleObject('7', 3, 3)

	setScrollFactor('1', 0, 0);
	setScrollFactor('3', 0.9, 0.9);
	setScrollFactor('7', 1.2, 1);
	
	addLuaSprite('1', false)
	addLuaSprite('2', false)
	addLuaSprite('3', false)
	addLuaSprite('4', false)
	addLuaSprite('5', false)
	addLuaSprite('6', true)
	addLuaSprite('7', true)
end
-- dad: 348, 356
-- bf: 448, 356
function onCreatePost()
	doTweenColor('rrr', 'boyfriend', '96ACBC', 0.1, 'linear')
	doTweenColor('rr5r', 'gf', '96ACBC', 0.1, 'linear')
end