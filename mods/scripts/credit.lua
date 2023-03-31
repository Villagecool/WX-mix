local composer = ''
local ogMod = ''
function onCreatePost()
    if songName == 'Tulip' then
        composer = 'PhoenixPH'
    elseif songName == 'Tulip Old' then
        composer = 'PhoenixPH'
    elseif songName == 'South Old' then
        composer = 'WerteX_390'
    elseif songName == 'South' then
        composer = 'WerteX_390'
    elseif songName == 'Sussus Nuzzus' then
        composer = 'WerteX_390'
        ogMod = 'VS impostor'
    elseif songName == 'MC MENTAL' then
        composer = 'MC MENTAL'
    elseif songName == 'Festive' then
        composer = 'PhoenixPH'
    elseif songName == 'Spookeez' then
        composer = 'WerteX_390'
    else
        composer = 'unknown'
    end
end
function onSongStart()
	makeLuaSprite('credsBG', '', -200, 500)
	makeGraphic('credsBG', 200, 50, rgbToHex(getProperty('dad.healthColorArray')))
	setObjectCamera('credsBG', 'camOther');
	addLuaSprite('credsBG', false)
	setProperty('credsBG.alpha', 0.5)
    
    makeLuaText('credsTxt', songName ,5000, -200, 505);
	setTextAlignment('credsTxt', 'left')
    setTextSize('credsTxt', 20)
    addLuaText('credsTxt', true)
	setTextFont('credsTxt', 'AnnyantRoman.ttf')
	setObjectCamera('credsTxt', 'camOther')
    
    makeLuaText('credsTxt2', 'By: '..composer ,5000, -200, 530);
	setTextAlignment('credsTxt2', 'left')
    setTextSize('credsTxt2', 10)
    addLuaText('credsTxt2', true)
	setTextFont('credsTxt2', 'AnnyantRoman.ttf')
	setObjectCamera('credsTxt2', 'camOther')

	makeLuaSprite('credsCompose', 'credits/'..composer, -80, 490)
	setObjectCamera('credsCompose', 'camOther');
	scaleObject('credsCompose', 0.5,0.5);
	addLuaSprite('credsCompose', true)

    if ogMod == '' then
	    makeLuaSprite('credsMod', 'credits/vill', -80, 590)
        setProperty('credsMod.visible', false)
	    addLuaSprite('credsMod', true)
    else
	    makeLuaSprite('credsMod', 'credits/'..ogMod, -160, 340)
	    setObjectCamera('credsMod', 'camOther');
	    scaleObject('credsMod', 0.5,0.5);
	    addLuaSprite('credsMod', true)
    end
    
    doTweenX('moveInBG', 'credsBG', 0, 0.5, 'sineOut')
    doTweenX('moveInTxt', 'credsTxt', 10, 0.5, 'sineOut')
    doTweenX('moveInTxt2', 'credsTxt2', 10, 0.5, 'sineOut')
    if 20+13*string.len(songName) > 120 then
        doTweenX('moveInCompose', 'credsCompose', 20+13*string.len(songName), 0.5, 'sineOut')
    else
        doTweenX('moveInCompose', 'credsCompose', 120, 0.5, 'sineOut')
    end
    doTweenX('moveInMod', 'credsMod', 20, 0.5, 'sineOut')
    runTimer('waitCreds', 5)


end
function rgbToHex(rgb) --https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
    return string.format("%02x%02x%02x",math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end
function onTweenCompleted(t)
    if t == 'moveOutBG' then
        removeLuaSprite('credsBG', false)
        removeLuaSprite('credsTxt', false)
        removeLuaSprite('credsTxt2', false)
        removeLuaSprite('credsCompose', false)
        removeLuaSprite('credsMod', false)
    end
end
function onTimerCompleted(t)
    if t == 'waitCreds' then
        doTweenX('moveOutBG', 'credsBG', -200, 0.5, 'sineOut')
        doTweenX('moveOutTxt', 'credsTxt', -190, 0.5, 'sineOut')
        doTweenX('moveOutTxt2', 'credsTxt2', -190, 0.5, 'sineOut')
        doTweenX('moveOutCompose', 'credsCompose', -80, 0.5, 'sineOut')
        doTweenX('moveOutMod', 'credsMod', -160, 0.5, 'sineOut')
    end
end