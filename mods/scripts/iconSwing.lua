local amount = 25
local ease = 'sineOut'

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
end