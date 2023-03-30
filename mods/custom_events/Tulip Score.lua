local gameWidth = 0
local infHealth = false

function onCreate()
    gameWidth = getPropertyFromClass("FlxG", "width")
end

function onEvent(n, v1, v2)
    if n == 'Tulip Score' then
        setProperty('scoreTxt.alpha', 0)
        makeLuaText('newScore', "Score: Who cares? You basically won! | Misses: Does it even matter? | Health: 200% | Accuracy: 110% | Rating: PFC", gameWidth, 0, getProperty('timeTxt.y') + 36)
        setTextSize('newScore', 18)
        setTextColor('newScore', 'BFBF1F')
        setTextBorder('newScore', 1.25, '121201')
        screenCenter('newScore', 'x')
        addLuaText('newScore')
        infHealth = true

        if hideHud == true then
            setProperty('newScore.alpha', 0)
        end
    end
end

function onUpdatePost(elapsed)
    if infHealth == true then
    setHealth(9999)
end
end

local amount = 25
local ease = 'sineOut'

function onBeatHit()
    if infHealth == true then
    if curBeat % 2 == 0 then

        setProperty('timeTxt.angle', -amount)
        doTweenAngle('yes2PL', 'timeTxt', 0, 0.15, ease)

        setProperty('timeTxt.angle', amount)
        doTweenAngle('yes2OPP', 'timeTxt', 0, 0.15, ease)
    end

    if curBeat % 2 == 1 then

        setProperty('timeTxt.angle', amount)
        doTweenAngle('yes2PL2', 'timeTxt', 0, 0.15, ease)

        setProperty('timeTxt.angle', -amount)
        doTweenAngle('yes2OPP2', 'timeTxt', 0, 0.15, ease)
    end

    setProperty('newScore.y', 641)
    doTweenY('yes', 'newScore', 681, 0.25, backIn)
end
end

--      Reference for the score text code
--      scoreTxt = new FlxText(0, timeTxt.y + 36, FlxG.width, "", 20);
--		scoreTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
--		scoreTxt.scrollFactor.set();
--		scoreTxt.borderSize = 1.25;
--		scoreTxt.visible = !ClientPrefs.hideHud;
--		add(scoreTxt);