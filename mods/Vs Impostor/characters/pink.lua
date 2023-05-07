function onUpdate(e)
	local angleOfs = math.random(-10, 10)
	if getProperty('healthBar.percent') > 80 and getProperty('dad.curCharacter') == 'pink' then
		setProperty('iconP2.angle', getProperty('iconP1.angle')+angleOfs)
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.2 and noteType == '' then
        setProperty('health', getProperty('health')-0.005)
    end
end