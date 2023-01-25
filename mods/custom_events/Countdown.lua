function onEvent(n,v1,v2)
    if n == 'Countdown' then
		time = v1
        setProperty('ready.alpha', 0);
		doTweenAlpha('count0','ready', 0, 0.3,'smootherInOut');
		runTimer('count0', time)
	end
end
function onCreatePost()
    makeLuaSprite('ready', 'ready', 300, 200)
    setObjectCamera('ready', 'hud')
    makeLuaSprite('set', 'set', 300, 200)
    setObjectCamera('set', 'hud')
    makeLuaSprite('go', 'go', 300, 200)
    setObjectCamera('go', 'hud')
	screenCenter('ready', 'xy')
	screenCenter('set', 'xy')
	screenCenter('go', 'xy')
    setProperty('ready.alpha', 0);
    setProperty('set.alpha', 0);
    setProperty('go.alpha', 0);
    addLuaSprite('ready', true)
    addLuaSprite('set', true)
    addLuaSprite('go', true)
end

function onTimerCompleted(tag)
	if tag == 'count0' then
		setProperty('ready.alpha', 1);
		doTweenAlpha('count','ready', 0, 0.3,'smootherInOut');
		runTimer('count', time)
		
	end
	if tag == 'count' then
		setProperty('set.alpha', 1);
		doTweenAlpha('count2','set', 0, 0.3,'smootherInOut');
		runTimer('count2', time)
		
	end
	if tag == 'count2' then
		setProperty('go.alpha', 1);
		doTweenAlpha('count3','go', 0, 0.3,'smootherInOut');
		
	end
end
--0.45