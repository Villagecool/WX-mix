function onCreate()
	makeLuaSprite('1', 'bench/1', -600, -350);
	makeLuaSprite('2', 'bench/2', -600, -350);
	makeLuaSprite('3', 'bench/3', -600, -350);
	makeLuaSprite('4', 'bench/4', -600, -350);
	makeLuaSprite('4.5', 'bench/put between 4 and 5', -600, -350);
	makeLuaSprite('5', 'bench/5', -600, -350);
	makeLuaSprite('6', 'bench/6', -600, -350);
	makeLuaSprite('7', 'bench/7', -600, -350);
	makeLuaSprite('8', 'bench/8', -600, -350);
	makeLuaSprite('9', 'bench/9', -600, -350);
	makeLuaSprite('10', 'bench/10', -600, -350);
	makeLuaSprite('11', 'bench/11', -600, -350);
	makeLuaSprite('12', 'bench/12', -600, -350);
	
	scaleObject('1', 1.5, 1.5)
	scaleObject('2', 1.5, 1.5)
	scaleObject('3', 1.5, 1.5)
	scaleObject('4', 1.5, 1.5)
	scaleObject('4.5', 1.5, 1.5)
	scaleObject('5', 1.5, 1.5)
	scaleObject('6', 1.5, 1.5)
	scaleObject('7', 1.5, 1.5)
	scaleObject('8', 1.5, 1.5)
	scaleObject('9', 1.5, 1.5)
	scaleObject('10', 1.5, 1.5)
	scaleObject('11', 1.5, 1.5)
	scaleObject('12', 1.5, 1.5)

	
	setScrollFactor('1', 0.9, 0.9);
	setScrollFactor('2', 0.9, 0.9);
	setScrollFactor('3', 0.9, 0.9);
	setScrollFactor('4', 0.9, 0.9);
	setScrollFactor('4.5', 0.9, 0.9);
	setScrollFactor('5', 0.9, 0.9);
	
	addLuaSprite('1', false)
	addLuaSprite('3', false)
	addLuaSprite('2', false)
	addLuaSprite('4', false)
	addLuaSprite('4.5', false)
	addLuaSprite('5', false)
	addLuaSprite('6', false)
	addLuaSprite('7', false)
	addLuaSprite('8', false)
	addLuaSprite('9', false)
	addLuaSprite('10', false)
	addLuaSprite('11', false)
	addLuaSprite('12', true)
end
-- dad: 348, 356
-- bf: 448, 356
function onCreatePost()
	--color = 'F9CDA7'
	--doTweenColor('shadeBf', 'boyfriend', color, 0.01, 'circIn')
	--doTweenColor('shadeDad', 'dad', color, 0.01, 'circIn')
	--doTweenColor('shadeGf', 'gf', color, 0.01, 'circIn')
end