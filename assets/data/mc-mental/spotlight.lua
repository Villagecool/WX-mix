function onCreate()
    makeLuaSprite('screen', ' ', -500, -500)
    makeGraphic('screen',1920,1080,'000000')
    scaleObject('screen', 3, 3)
    setScrollFactor('screen', 0, 0)
    setProperty('screen.alpha', 0)
    addLuaSprite('screen',true)

    makeLuaSprite('spotlight', 'spotlight', 0, 0)
    scaleObject('spotlight', 1, 1)
    setProperty('spotlight.alpha', 0)
    addLuaSprite('spotlight',true)

end
function onStepHit()
        if mustHitSection then
            setProperty('spotlight.x', getProperty('boyfriend.x')-100)
            setProperty('spotlight.y', getProperty('boyfriend.y')-650)
        else
            setProperty('spotlight.x', getProperty('dad.x')-200)
            setProperty('spotlight.y', getProperty('dad.y')-600)
        end
end
function onCreatePost()
	makeAnimatedLuaSprite('sandra','characters/sandra-suprised',getProperty('dad.x'),getProperty('dad.y')-400)
	addAnimationByIndices('sandra','danceLeft','GF Dancing Beat', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14',24)
	addAnimationByIndices('sandra','danceRight','GF Dancing Beat', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29',24)
    objectPlayAnimation('sandra', 'danceLeft', true)
	addLuaSprite('sandra',false)

    
	makeAnimatedLuaSprite('max','characters/max-supriesed',getProperty('boyfriend.x'),getProperty('boyfriend.y')-400)
	addAnimationByPrefix('max','idle','',24,false)
    objectPlayAnimation('max', 'idle', true)
	addLuaSprite('max',false)
end
function onBeatHit()
	if curBeat % 2 == 0 then
        objectPlayAnimation('max', 'idle', true)
        objectPlayAnimation('sandra', 'danceLeft', true)
    else
        objectPlayAnimation('sandra', 'danceRight', true)
    end
end
function onSongStart()
    setProperty('screen.alpha', 1)
    doTweenAlpha('screen', 'screen', 0.6, 0.5, 'linear')
    doTweenAlpha('spotlight', 'spotlight', 0.5, 0.5, 'linear')
end