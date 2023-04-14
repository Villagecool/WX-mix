function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'CupNote_Parry' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_Parry_assets');
		end
	end
end
function  goodNoteHit(id, noteData, noteType, isSustainNote)
	if (noteType == 'CupNote_Parry') and (isSustainNote == false) then
		playSound('Cuphead_ParryNote', 1)
	end
end
