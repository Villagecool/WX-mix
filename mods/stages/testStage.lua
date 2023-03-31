function onCreate()
	-- background shit
	makeLuaSprite('stage', 'stage', -600, -140);
	setScrollFactor('stage', 1, 1);

	
	makeLuaSprite('stagebut8bit', 'stagebut8bit', -600, -140);
	setScrollFactor('stagebut8bit', 1, 1);
	scaleObject('stagebut8bit', 1, 1);

	addLuaSprite('stage', false);
	addLuaSprite('stagebut8bit', false);
	setProperty('stagebut8bit.visible', false)

end
function goodNoteHit(id, direction, noteType, isSustainNote)
	setProperty('stage.visible', true)
	setProperty('stagebut8bit.visible', false)
	triggerEvent('Change Character', 'gf','gf')
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	setProperty('stage.visible', false)
	setProperty('stagebut8bit.visible', true)
	triggerEvent('Change Character', 'gf','gf-pixel')
end

function onEvent(name, value_1, value_2)
    if name == 'Set Property' and value_1 == 'stagebut8bit.visible' and value_2 == 'true' then
		setProperty('stage.visible', false)
		setProperty('stagebut8bit.visible', true)
		triggerEvent('Change Character', 'gf','gf-pixel')
	else
		if name == 'Set Property' and value_1 == 'stagebut8bit.visible' and value_2 == 'false' then
			setProperty('stage.visible', true)
			setProperty('stagebut8bit.visible', false)
			triggerEvent('Change Character', 'gf','gf')
		end
	end
end