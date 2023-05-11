function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet Note' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/Bullet_Note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let BF's notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

local dodgeAnims = {"dodgeLEFT", "dodgeDOWN", "dodgeUP", "dodgeRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet Note' then
			playSound('hankshoot', 0.5);
			if getProperty('gf.curCharacter') == 'pinkdk' then
				characterPlayAnim('gf', 'slash', true);
				setProperty('gf.specialAnim', true);
			else
				characterPlayAnim('dad', 'shoot', true);
				setProperty('dad.specialAnim', true);
			end
			if getProperty('boyfriend.curCharacter') == 'bf' or getProperty('boyfriend.curCharacter') == 'bf-defeat-scared' then
				characterPlayAnim('boyfriend', dodgeAnims[direction + 1], true);
			else
		characterPlayAnim('boyfriend', 'dodge', true);
			end
		setProperty('boyfriend.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet Note' and difficulty == 1 then
		setProperty('health', 1);
		playSound('hankshoot', 0.5);
	elseif noteType == 'Bullet Note' and difficulty == 0 then
		setProperty('health', getProperty('health')-0.8);
		runTimer('bleed', 0.2, 20);
		playSound('hankded', 0.6);
		characterPlayAnim('boyfriend', 'hurt', true);
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