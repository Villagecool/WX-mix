function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Anim Orange' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURTNOTE_assets')
			setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt'); --Change texture
		end
	end
end
function opponentNoteHit(id, d, noteType, isSustainNote)
	if noteType == 'Alt Anim Orange' then
		if difficulty == 1 then
				setProperty('health', getProperty('health')+0.1)
		else
			if getProperty('health') > 0.2 then
				setProperty('health', getProperty('health')-0.1)
				makeMagic(2)
			end
		end
	end
end
function goodNoteHit(id, d, noteType, isSustainNote)
	if noteType == 'Alt Anim Orange' then
		if difficulty == 1 then
			if getProperty('health') > 0.2 then
				setProperty('health', getProperty('health')-0.1)
				makeMagic(2)
			end
		else
				setProperty('health', getProperty('health')+0.1)
		end
	end
end
function makeMagic(amount)
	for i = 0, amount do
		thing = math.random(1,6)
		size =  math.random(1,2)
		makeAnimatedLuaSprite('magicThing'..thing, 'MAGIC_Assets', getProperty('dad.x')+math.random(-200,200), getProperty('dad.y')+math.random(0,200));
		addAnimationByPrefix('magicThing'..thing, 'stuff', 'thing'..thing, 0, false);
		setProperty('magicThing'..thing..'.alpha', 0.5);
		setProperty('magicThing'..thing..'.color', getColorFromHex('FF9900'));
		scaleObject('magicThing'..thing, size, size)
		doTweenAlpha('magicThing'..thing..'Tweenalpha', 'magicThing'..thing, 0 , 0.5, 'linear')
		doTweenAngle('magicThing'..thing..'Tweenangle', 'magicThing'..thing, 360 , 0.5, 'linear')
		doTweenY('magicThing'..thing..'TweenY', 'magicThing'..thing, getProperty('dad.y')-200 , 0.5, 'linear')
		doTweenX('magicThing'..thing..'TweenX', 'magicThing'..thing, getProperty('boyfriend.x')+50 , 0.5, 'linear')
		addLuaSprite('magicThing'..thing, false);
	end
	setProperty('healthBar.color', getColorFromHex('FF9900'));
	doTweenColor('magicThingcolor', 'healthBar', 'FFFFFF' , 0.5, 'linear')
end