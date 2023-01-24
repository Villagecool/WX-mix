local defZoom = 0
local StampedData = 'N/A\n    Press Space'
BotTest = false
function onUpdate()
	setTextString('debugTxt', 'Current Step: '..curStep..'\n\nTimer (Milliseconds): '..getSongPosition()..'\n\nCurrent Cam Zoom: '.. getProperty('camGame.zoom')..'\n\nPress: B to toggle botplay\n\nPress Q,E to zoom in,out\nPress T to reset zoom\n\nPress C to hide HUD\n\nHealth:'..math.floor(getProperty('health')*50)..'%\n\nMusic Speed: '..getProperty('playbackRate')..'  Press Z,X to change\n\n\n\nStamped Data: '..StampedData)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F11') then
        playSound('scrollMenu', 1, 'pausescroll')
        if not getPropertyFromClass("openfl.Lib", "application.window.fullscreen") then
            setPropertyFromClass("openfl.Lib", "application.window.fullscreen", true)
        else
            setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
        end
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F3') then
        playSound('scrollMenu', 1, 'pausescroll')
        if not getProperty('debugTxt.visible') then
            setProperty('debugTxt.visible', true)
        else
            setProperty('debugTxt.visible', false)
        end
    end
    if getProperty('debugTxt.visible') then
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
            setProperty('playbackRate',getProperty('playbackRate') + 0.1)
        elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') then
            setProperty('playbackRate',getProperty('playbackRate') - 0.1)
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.C') then
            if not getProperty('camHUD.visible') then
                setProperty('camHUD.visible', true)
                setProperty('camOther.visible', true)
                setProperty('cpuControlled', BotTest)
            else
                setProperty('camHUD.visible', false)
                setProperty('camOther.visible', false)
                BotTest = getProperty('cpuControlled')
                setProperty('cpuControlled', true)
            end
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') then
			playSound('scrollMenu', 1, 'pausescroll')
            if botPlay then
                setProperty('cpuControlled', false)
                setProperty('botplayTxt.visible', false)
            else
                setProperty('cpuControlled', true)
                setProperty('botplayTxt.visible', true)
            end
        end
        --if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F5') then
		--	playSound('scrollMenu', 1, 'pausescroll')
        --    if getProperty('camGame.zoom') == 0.1 then
        --        setProperty('camGame.zoom', defZoom)
        --    else
        --        defZoom = getProperty("defaultCamZoom")
        --        setProperty('camGame.zoom', 0.1)
        --    end
        --end
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then
			playSound('scrollMenu', 1, 'pausescroll')
            setProperty('camGame.zoom', defZoom)
        end
        if keyboardPressed("Q") then
            setProperty('camGame.zoom', getProperty('camGame.zoom')-0.01)
        end
        if keyboardPressed("E") then
            setProperty('camGame.zoom', getProperty('camGame.zoom')+0.01)
        end

        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
			StampedData = '\n    Step: '..curStep..'\n    Time (seconds):'.. math.floor(getSongPosition()/1000)..'\n    Time (miliseconds):'.. getSongPosition().. '\n    Cam Zoom: '.. getProperty('camGame.zoom')..'\n    Health:'..math.floor(getProperty('health')*50)..'%'
			playSound('scrollMenu', 1, 'pausescroll')
        end
    end
end
function onCreatePost()
    defZoom = getProperty("defaultCamZoom")
    makeLuaText('debugTxt', 'air' ,5000, 120, 100);
	setTextAlignment('debugTxt', 'left')
    setTextSize('debugTxt', 20)
    addLuaText('debugTxt', false)
	setObjectCamera('debugTxt', 'camOther')
    setProperty('debugTxt.visible', false)
end