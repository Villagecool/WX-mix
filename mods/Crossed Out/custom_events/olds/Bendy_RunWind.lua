bendyNoteAngle = 0
bendyCharXPos = 0

function onCreate()
	if difficultyName == 'Easy' then
		bendyRunNoteXPower =  -190  
		bRNXPA = 30
	elseif difficultyName == 'Normal' or difficultyName == 'Omegaspace' then
		bendyRunNoteXPower =  -380  
		bRNXPA = 60      
	elseif difficultyName == 'Hard' then
		bendyRunNoteXPower =  -380  
		bRNXPA = 60
	elseif difficultyName == 'Hell' then
		bendyRunNoteXPower =  -560  
		bRNXPA = 90               

	end
end

function onEvent(name, value1)
	if name == 'Bendy_RunWind'then
		if value1 == 'Add' then
			bendyRunIsThere = 1
		elseif value1 == 'Remove' then
			bendyRunIsThere = 2
		end
				
	end
end


function onUpdate()
	if bendyRunIsThere == 1 then
		songPos = getSongPosition()
		noteWiggleRunStuff = (songPos/500)*(curBpm/200)
		camTurnBendyRun = (songPos/300)*(curBpm/200)

		-- Note Movement
		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - (bendyRunNoteXPower + bRNXPA*0)*math.cos((noteWiggleRunStuff*0.25)*math.pi), 4)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - (bendyRunNoteXPower + bRNXPA*1)*math.cos((noteWiggleRunStuff*0.25)*math.pi), 4)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - (bendyRunNoteXPower + bRNXPA*2)*math.cos((noteWiggleRunStuff*0.25)*math.pi), 4)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - (bendyRunNoteXPower + bRNXPA*3)*math.cos((noteWiggleRunStuff*0.25)*math.pi), 4)
		noteTweenY(defaultPlayerStrumY, 4, defaultPlayerStrumY0 + ((math.cos((noteWiggleRunStuff*2) + 0) * 5)), -1)
		noteTweenY(defaultPlayerStrumY, 5, defaultPlayerStrumY1 + ((math.cos((noteWiggleRunStuff*2) + 1) * 5)), -1)
		noteTweenY(defaultPlayerStrumY, 6, defaultPlayerStrumY2 + ((math.cos((noteWiggleRunStuff*2) + 2) * 5)), -1)
		noteTweenY(defaultPlayerStrumY, 7, defaultPlayerStrumY3 + ((math.cos((noteWiggleRunStuff*2) + 3) * 5)), -1)

		-- Cam Movement
		doTweenAngle('cameraWhoo', 'camera', (math.sin(camTurnBendyRun)*4), 0.1, 'linear')

		-- Note direction Movement
		-- is scrapped, it worked fine - but didn't feel good so I scrapped it.

	elseif bendyRunIsThere == 2 then
		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0, 0.1)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1, 0.1)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2, 0.1)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3, 0.1)
		noteTweenY(defaultPlayerStrumY, 4, defaultPlayerStrumY0, 0.1)
		noteTweenY(defaultPlayerStrumY, 5, defaultPlayerStrumY1, 0.1)
		noteTweenY(defaultPlayerStrumY, 6, defaultPlayerStrumY2, 0.1)
		noteTweenY(defaultPlayerStrumY, 7, defaultPlayerStrumY3, 0.1)

		-- Cam Movement
		doTweenAngle('camHUDWhoo', 'camHUD', 0, 0.1, 'linear')
		doTweenAngle('cameraWhoo', 'camera', 0, 0.1, 'linear')

		bendyRunIsThere = 0
	end
end

