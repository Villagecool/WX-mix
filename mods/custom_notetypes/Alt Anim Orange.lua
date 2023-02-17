function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Anim Orange' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'wx_assets_hurt')
			setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt'); --Change texture
		end
	end
end
function opponentNoteHit(id, d, noteType, isSustainNote)
	if noteType == 'Alt Anim Orange' and getProperty('health') > 0.2 then
		setProperty('health', getProperty('health')-0.1)
	end
end