local wasMustHit = false
local missed = 0
function onStepHit()
    if wasMustHit then
        if not wasMustHit == mustHitSection then
                triggerEvent('Hey!', '', '')
        end
    end
    wasMustHit = mustHitSection
end
function onSongStart()
    missed = getProperty('misses')
    wasMustHit = mustHitSection
end