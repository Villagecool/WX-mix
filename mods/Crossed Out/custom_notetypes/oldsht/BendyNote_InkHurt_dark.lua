function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BendyNote_InkHurt_dark' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_DarkHurt_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); 
			end
		end
	end

	if difficultyName == 'Easy' then
		bendyNoteInkDamage = 0.3
	elseif difficultyName == 'Normal' or difficultyName == 'Omegaspace' then
		bendyNoteInkDamage = 0.4
	elseif difficultyName == 'Hard' then
		bendyNoteInkDamage = 0.5   
	elseif difficultyName == 'Hell' then
		bendyNoteInkDamage = 0.6        
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BendyNote_InkHurt_dark' then
		addMisses(1);
   		addScore(-500);
		characterPlayAnim('boyfriend', 'hurt', true);
		health = getProperty('health')
		setProperty('health', health - bendyNoteInkDamage);
	end
end
