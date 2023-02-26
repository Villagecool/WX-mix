function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Anim Orange' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'wx_assets_hurt')
			setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt'); --Change texture
		end
	end
end
		