function onCreatePost()
	makeLuaSprite('whitebg2', '', 0, 0)
	setScrollFactor('whitebg2', 0, 0)
	makeGraphic('whitebg2', 3840, 2160, 'ffffff')
	setObjectCamera('whitebg2', 'hud');
	addLuaSprite('whitebg2', false)
	setProperty('whitebg2.alpha', 0)
	screenCenter('whitebg2', 'xy')
end
function onEvent(n, v1, v2)
	if n == 'fade' and string.lower(v1) == 'a' then
		doTweenAlpha('applebadxd69', 'whitebg2', 1, v2, 'linear')
	end
	if n == 'fade' and string.lower(v1) == 'b' then
		doTweenAlpha('applebadxd', 'whitebg2', 0, v2, 'linear')
	end
end