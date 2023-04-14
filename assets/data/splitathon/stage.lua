function onCreatePost()
	makeLuaSprite('bg', 'stages/farm', -500, -200);
    scaleObject('bg', 2.3,2.3)
	addLuaSprite('bg', false)
	doTweenColor('rr52r', 'bg', '5465AD', 0.1, 'linear')
	colorChars('848DB5')
end
function colorChars(color)
	doTweenColor('char1', 'boyfriend', color, 0.1, 'linear')
	doTweenColor('char2', 'dad',  color, 0.1, 'linear')
	doTweenColor('char3', 'gf',  color, 0.1, 'linear')
end