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
	if difficulty == 1 then
		setProperty('stage.visible', false)
		setProperty('stagebut8bit.visible', true)
		triggerEvent('Change Character', 'gf','gf-pixel')
		setProperty('stage2-p.visible', true)
		setProperty('stage2.visible', false)
	else
		setProperty('stage.visible', true)
		setProperty('stagebut8bit.visible', false)
		setProperty('stage2.visible', true)
		setProperty('stage2-p.visible', false)
		triggerEvent('Change Character', 'gf','gf')
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if difficulty == 1 then
		setProperty('stage.visible', true)
		setProperty('stagebut8bit.visible', false)
		setProperty('stage2.visible', true)
		setProperty('stage2-p.visible', false)
		triggerEvent('Change Character', 'gf','gf')
	else
		setProperty('stage.visible', false)
		setProperty('stagebut8bit.visible', true)
		setProperty('stage2-p.visible', true)
		setProperty('stage2.visible', false)
		triggerEvent('Change Character', 'gf','gf-pixel')
	end
end

function onEvent(name, value_1, value_2)
    if name == 'Set Property' and value_1 == 'stagebut8bit.visible' and value_2 == 'true' then
		setProperty('stage.visible', false)
		setProperty('stagebut8bit.visible', true)
		setProperty('stage2-p.visible', true)
		setProperty('stage2.visible', false)
		triggerEvent('Change Character', 'gf','gf-pixel')
	else
		if name == 'Set Property' and value_1 == 'stagebut8bit.visible' and value_2 == 'false' then
			setProperty('stage.visible', true)
			setProperty('stagebut8bit.visible', false)
			setProperty('stage2.visible', true)
			setProperty('stage2-p.visible', false)
			triggerEvent('Change Character', 'gf','gf')
		end
	end
end