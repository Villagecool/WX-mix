function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Knife' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/knifenotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);


			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
				
			end
			
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Knife' then
		if not getProperty('cpuControlled') or not instakill then
			setProperty('health', getProperty('health')-1);
			runTimer('bleed', 0.2, 40);
			setProperty('dad.specialAnim', true);
			characterPlayAnim('boyfriend', 'hurt', true);
			setProperty('boyfriend.specialAnim', true);
			cameraShake('camGame', 0.01, 0.2);
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'bleed' and loopsLeft >= 1 then
	        if getProperty('health') > 0.1 then
            setProperty('health', health-0.01);
	end
end
end
function onUpdate(e)
    for i = 0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'Knife' then
			local strumTime = getPropertyFromGroup('notes', i, 'strumTime')
			local distance = strumTime - getSongPosition();
			local animDone = false
			if distance >= 10 and distance <= 20 and not animDone then
				animDone = true
				setProperty('health', getProperty('health') +0.0475);
				characterPlayAnim('dad', 'slash', true);
				setProperty('dad.specialAnim', true);
				characterPlayAnim('boyfriend', 'dodge', true);
				setProperty('boyfriend.specialAnim', true);
			end
		end
	end
end