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
		triggerEvent('Play Animation', 'scared', 'boyfriend')
		--orangeHit()
	end
end
function orangeHit()
	--setProperty('iconP1.color', 'FF9900')
	setProperty('Health.angle', 5)
	setProperty('healthBar.angle', 5)
	setProperty('healthBarBG.angle', 5)
	cancelTimer('move')
	runTimer('move', 0.2)
	
	--cancelTween('healthBarBG')
	--cancelTween('healthBar')
	--cancelTween('Health')
	--doTweenAngle('healthBarBG', 'healthBarBG', 0, 0.2, 'linear')
	--doTweenAngle('healthBar', 'healthBar', 0, 0.2, 'linear')
	--doTweenAngle('Health', 'Health', 0, 0.2, 'linear')
	--doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.5, 'linear')
end
function onTimerCompleted(t)
	if t == 'move' then
	setProperty('Health.angle', 0)
	setProperty('healthBar.angle', 0)
	setProperty('healthBarBG.angle', 0)
		
	end
end