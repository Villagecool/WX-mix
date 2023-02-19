function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'WyattSing' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Change texture
		end
	end
end