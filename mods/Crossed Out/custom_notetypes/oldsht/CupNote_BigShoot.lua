CupheadBigShootDmg = 0

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'CupNote_Shoot' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'CupNote_Shoot');
		end
	end

	if difficultyName == 'Easy' or difficultyName == 'Omegaspace' then
		CupheadBigShootDmg = 0.4
    elseif difficultyName == 'Normal' then
		CupheadBigShootDmg = 0.5
    elseif difficultyName == 'Hard' then
		CupheadBigShootDmg = 0.65
    elseif difficultyName == 'Hell' then
		CupheadBigShootDmg = 0.7
    end

	makeAnimatedLuaSprite('Cuphead Hadoken','Cuphead Hadoken', -100, 500)
	addAnimationByPrefix('Cuphead Hadoken','Hadolen instance ','Hadolen instance ',24, false)
	scaleObject('Cuphead Hadoken', 0.65, 0.65);	

	makeAnimatedLuaSprite('Cuphead Hadoken Final','Cuphead Hadoken Final', -100, 500)
	addAnimationByPrefix('Cuphead Hadoken Final','DeathBlast instance ','DeathBlast instance ',24, false)
	scaleObject('Cuphead Hadoken Final', 0.65, 0.65);	

	makeAnimatedLuaSprite('Cuphead Burst','Cuphead Hadoken', 300, 0)
	addAnimationByPrefix('Cuphead Burst','BurstFX instance ','BurstFX instance ',24, false)

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'CupNote_BigShoot' then
		if not lowQuality then
			playSound('CupheadPreBigShot', 3);
		end

		if (dadName == 'cuphead_angry') or (dadName == 'final_cuphead') then
			characterPlayAnim('dad', 'attack', true);
		elseif (gfName == 'cuphead_angry') then
			characterPlayAnim('gf', 'attack', true);
		end
		runTimer('CupheadBigShot_StartShoot', 0.4)
		runTimer('CupheadBigShot_ShotConnect', 0.8)
		runTimer('CupheadBigShot_RemoveShot', 1)
	end
end

function onTimerCompleted(tag)
	if (tag == 'CupheadBigShot_StartShoot') then
		triggerEvent('Add Camera Zoom', '0.1', '0.05');
		if not lowQuality then
			if (dadName == 'final_cuphead') then
				addLuaSprite('Cuphead Hadoken Final', true)
				objectPlayAnimation('Cuphead Hadoken Final','DeathBlast instance ', true)
			else
				addLuaSprite('Cuphead Hadoken', true)
				objectPlayAnimation('Cuphead Hadoken','Hadolen instance ', true)
			end
		end
	end
	if tag == 'CupheadBigShot_ShotConnect' then
		health = getProperty('health')
		playSound('CupheadBigShot', 3);
		if not lowQuality then
			characterPlayAnim('bf', 'hurt', true);
			addLuaSprite('Cuphead Burst', true)
			objectPlayAnimation('Cuphead Burst','BurstFX instance ', true)
		end
		setProperty('health', health - CupheadBigShootDmg)
		triggerEvent('Screen Shake', '0.2, 0.05', '0.2, 0.025');
		triggerEvent('Add Camera Zoom', '0.3', '0.1');

	end
	if tag == 'CupheadBigShot_RemoveShot' then
		removeLuaSprite('Cuphead Hadoken', false)
		removeLuaSprite('Cuphead Hadoken Final', false)
	end
end