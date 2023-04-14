SansBluePoisonStay = 0
SansBlueDamage = 0

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'SansNote_Blue' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_Blue_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); 
			end
		end
	end

	if difficultyName == 'Easy' then
		SansBlueDamage = 0.004
    elseif difficultyName == 'Normal' or difficultyName == 'Omegaspace' then
		SansBlueDamage = 0.007
    elseif difficultyName == 'Hard' then
		SansBlueDamage = 0.008
    elseif difficultyName == 'Hell' then
		SansBlueDamage = 0.011
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'SansNote_Blue' then
		addMisses(1);
   		addScore(-500);
		characterPlayAnim('boyfriend', 'hurt', true);
		if (isSustainNote == false) then
			SansBluePoisonStay = SansBluePoisonStay + 64
		else
			SansBluePoisonStay = SansBluePoisonStay + 16
		end
	end
end


function onUpdate()
    if SansBluePoisonStay == 0 then

	else
		health = getProperty('health')
		setProperty('health', health- SansBlueDamage);
		SansBluePoisonStay = SansBluePoisonStay - 1
   end
end


