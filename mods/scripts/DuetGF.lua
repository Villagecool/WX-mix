local dueting = false
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'DuetGF' then
		end
	end
end
function opponentNoteHit(id, d, noteType, isSustainNote)
    if noteType == 'DuetGF' then
        singGF(d)
    end
end
function goodNoteHit(id, d, noteType, isSustainNote)
    if noteType == 'DuetGF' or dueting then
        singGF(d)
    end
end
function singGF(d)
    if d == 0 then
        triggerEvent('Play Animation','singLEFT', '2')
	end
	if d == 1 then
        triggerEvent('Play Animation','singDOWN', '2')
	end
	if d == 2 then
        triggerEvent('Play Animation','singUP', '2')
	end
	if d == 3 then
        triggerEvent('Play Animation','singRIGHT', '2')
	end
end
function onEvent(n,v1,v2)
    if n == 'Duet Skid n Pump' then
        if v1 == 'true' then dueting = true else dueting = false end
    end
end