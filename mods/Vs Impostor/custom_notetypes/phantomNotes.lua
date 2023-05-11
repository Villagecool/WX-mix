function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phantomNotes' then --Check if the note on the chart is a phantomNotes
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/Bullet_Note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let BF's notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'mustPress', false);
			else
				setPropertyFromGroup('unspawnNotes', i, 'mustPress', true);
			end
		end
	end
end

local dodgeAnims = {"dodgeLEFT", "dodgeDOWN", "dodgeUP", "dodgeRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'phantomNotes' then
			playSound('hankshoot', 0.5);
			if getProperty('gf.curCharacter') == 'pinkdk' then
				characterPlayAnim('gf', 'slash', true);
				setProperty('gf.specialAnim', true);
			else
				characterPlayAnim('boyfriend', 'shoot', true);
				setProperty('boyfriend.specialAnim', true);
			end
			if getProperty('dad.curCharacter') == 'bf' or getProperty('boyfriend.curCharacter') == 'bf-defeat-scared' then
				characterPlayAnim('dad', dodgeAnims[direction + 1], true);
			else
		characterPlayAnim('dad', 'dodge', true);
			end
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2);
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'bleed' then
		setProperty('health', getProperty('health')-0.001);
	end
	if tag == 'shootanim' then
		setProperty('dad.curCharacter', curDad);
	end
end