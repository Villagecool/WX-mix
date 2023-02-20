local wasMustHit = false
local missed = 0
function onStepHit()
    setTextString("name", missed..getProperty('misses'))
    if wasMustHit then
        if not wasMustHit == mustHitSection then
            if missed == getProperty('misses') then
                triggerEvent('Hey!', '', '')
                missed = getProperty('misses')
            else
                missed = getProperty('misses')
            end
        end
    end
    wasMustHit = mustHitSection
end
function onSongStart()
	makeLuaText("name", missed..getProperty('misses'), 1, 5, 5)
	setTextSize("name", 50)
	addLuaText("name", true)
    missed = getProperty('misses')
    wasMustHit = mustHitSection
end