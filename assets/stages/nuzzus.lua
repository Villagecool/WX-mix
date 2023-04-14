function onCreate()
	makeAnimatedLuaSprite('1', 'stages/earthbound', -400, -300);
	addAnimationByPrefix('1','idle','idle',12,true)
	objectPlayAnimation('1','idle',false)
	scaleObject('1', 6,6)
	addLuaSprite('1', false)
end
function onUpdatePost()
	setProperty('boyfriend.alpha', 0)
	triggerEvent('Camera Follow Pos', '438', '356')
end
-- dad: 348, 356
-- bf: 448, 356