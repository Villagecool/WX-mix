local amount = 25
local ease = 'sineOut'
local lastHealth = 0

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('iconP1.angle', -amount)
        doTweenAngle('iconLeftPL', 'iconP1', 0, 0.15, ease)

        setProperty('iconP2.angle', amount)
        doTweenAngle('iconLeftOPP', 'iconP2', 0, 0.15, ease)
    end

    if curBeat % 2 == 1 then
        setProperty('iconP1.angle', amount)
        doTweenAngle('iconLeftPL2', 'iconP1', 0, 0.15, ease)

        setProperty('iconP2.angle', -amount)
        doTweenAngle('iconLeftOPP2', 'iconP2', 0, 0.15, ease)
    end
    if not lastHealth == getProperty('health') then
        setProperty('dad.scale.x', getProperty('iconP2.scale.x')+5.1)
        setProperty('iconP1.scale.x', getProperty('iconP1.scale.x')+5.1)
    else
        setProperty('dad.scale.x',  1)
    end
    lastHealth = getProperty('health')
end