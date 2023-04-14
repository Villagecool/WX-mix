ShotSoundRandomStuff = 0
CupheadShootDmg = 0

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'CupNote_Shoot' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'CupNote_Shoot');
		end
	end

	if difficultyName == 'Easy' or difficultyName == 'Omegaspace' then
		CupheadShootDmg = 0.04
    elseif difficultyName == 'Normal' then
		CupheadShootDmg = 0.05
    elseif difficultyName == 'Hard' then
		CupheadShootDmg = 0.065
    elseif difficultyName == 'Hell' then
		CupheadShootDmg = 0.07
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'CupNote_Shoot' then
		health = getProperty('health')
		ShotSoundRandomStuff = math.random(1, 6)
		triggerEvent('Add Camera Zoom', '0.', '0.025');
		if not lowQuality then
			if ShotSoundRandomStuff == 1 then
				playSound('CupheadShoot1', 3);
			elseif ShotSoundRandomStuff == 2 then
				playSound('CupheadShoot2', 3);
			elseif ShotSoundRandomStuff == 3 then
				playSound('CupheadShoot3', 3);
			elseif ShotSoundRandomStuff == 4 then
				playSound('CupheadShoot4', 3);
			elseif ShotSoundRandomStuff == 5 then
				playSound('CupheadShoot5', 3);
			elseif ShotSoundRandomStuff == 6 then
				playSound('CupheadShoot6', 3);
			end
		end

		if (dadName == 'cuphead_angry') or (dadName == 'final_cuphead') then
			if noteData == 0 then
				characterPlayAnim('dad', 'singLEFT-alt', false);
			elseif noteData == 1 then
				characterPlayAnim('dad', 'singDOWN-alt', false);
			elseif noteData == 2 then
				characterPlayAnim('dad', 'singUP-alt', false);
			elseif noteData == 3 then
				characterPlayAnim('dad', 'singRIGHT-alt', false);
			end
		elseif (gfName == 'cuphead_angry') then
			if noteData == 0 then
				characterPlayAnim('gf', 'singLEFT-alt', false);
			elseif noteData == 1 then
				characterPlayAnim('gf', 'singDOWN-alt', false);
			elseif noteData == 2 then
				characterPlayAnim('gf', 'singUP-alt', false);
			elseif noteData == 3 then
				characterPlayAnim('gf', 'singRIGHT-alt', false);
			end
		end

		if isSustainNote == false then
			setProperty('health', health - CupheadShootDmg)
		end
	end
end