SansOrangePoisonStay = 0
SansOrangeDamage = 0

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'SansNote_Orange' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_Orange_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end

	if difficultyName == 'Easy' then
		SansOrangeDamage = 0.004
    elseif difficultyName == 'Normal' or difficultyName == 'Omegaspace' then
		SansOrangeDamage = 0.007
    elseif difficultyName == 'Hard' then
		SansOrangeDamage = 0.008
    elseif difficultyName == 'Hell' then
		SansOrangeDamage = 0.011
    end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'SansNote_Orange' then
		addMisses(1);
   		addScore(-500);
		characterPlayAnim('boyfriend', 'hurt', true);
		if (isSustainNote == false) then
			SansOrangePoisonStay = SansOrangePoisonStay + 64
		else
			SansOrangePoisonStay = SansOrangePoisonStay + 16
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'SansNote_Orange' then
		addScore(500);
	end
end



function onUpdate()
    if SansOrangePoisonStay == 0 then

	else
		health = getProperty('health')
		setProperty('health', health - SansOrangeDamage);
		SansOrangePoisonStay = SansOrangePoisonStay - 1
   end
end


