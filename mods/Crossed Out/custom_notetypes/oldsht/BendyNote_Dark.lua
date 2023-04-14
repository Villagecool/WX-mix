function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BendyNote_Dark' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_DarkNormal_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
		end
	end
end
