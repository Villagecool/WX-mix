CurBeatGuitar = 0
GuitarStageIsThere = 0
GuitarSideBoop_Tim = 0.3;
GuitarSideBoop_Pow = 2;
GuitarCamBoop_Pow = 0.2;
GuitarSideBoop_Dir = 'fals';
GuitarNoteHitAlpha = 0


function onCreate()
	if not lowQuality and flashingLights then
		makeLuaSprite('guitarNoteHit', 'guitarNoteHit', -50, 0)
		setScrollFactor('guitarNoteHit', 0.9, 0.9);
		scaleObject('guitarNoteHit', 0.7, 0.7);
		setObjectCamera('guitarNoteHit', 'other');
		doTweenAlpha('guitarNoteHit','guitarNoteHit', 0, 0.1, 'linear')
	end

    addLuaSprite('guitarNoteHit', false)
end

function onEvent(name, value1)
	if name == 'Sans_GuitarStage' then
		if value1 == 'Do' then
			GuitarStageIsThere = 1

		elseif value1 == 'Dont' then
			GuitarStageIsThere = 2
		end	
	end
end

function onBeatHit()
	if GuitarStageIsThere == 1 then
		-- Notes Go to da middle
		noteTweenX('play3', 7, 760, 0.5, ' elasticOut')
		noteTweenX('play4', 6, 645, 0.5, ' elasticOut')
		noteTweenX('play5', 5, 535, 0.5, ' elasticOut')
		noteTweenX('play6', 4, 420, 0.5, ' elasticOut')

		-- The Background boping
		if CurBeatGuitar == 0 then
			CurBeatGuitar = 1
			doTweenAlpha('SansStage4_BackFrame1','SansStage4_BackFrame1', 0, 0.01, 'linear')
			doTweenAlpha('SansStage4_BackFrame2','SansStage4_BackFrame2', 1, 0.01, 'linear')
		else
			CurBeatGuitar = 0 
			doTweenAlpha('SansStage4_BackFrame1','SansStage4_BackFrame1', 1, 0.01, 'linear')
			doTweenAlpha('SansStage4_BackFrame2','SansStage4_BackFrame2', 0, 0.01, 'linear')
		end

		-- The cam left right thing BBPanzu made
		if GuitarSideBoop_Tim == nil then
			GuitarSideBoop_Tim = 0.005
		else
			GuitarSideBoop_Tim = GuitarSideBoop_Tim / 100
		end

		if c == 'fals' then
			doTweenAngle('turn', 'camGame', GuitarSideBoop_Pow/3, stepCrochet*GuitarSideBoop_Tim, 'elasticOut')
			c = 'tru';
		else
			doTweenAngle('turn', 'camGame', -GuitarSideBoop_Pow/2, stepCrochet*GuitarSideBoop_Tim, 'elasticOut')
			c = 'fals';
		end
		triggerEvent('Add Camera Zoom', GuitarCamBoop_Pow);

	elseif GuitarStageIsThere == 2 then
		noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0, 2, 'elasticOut')
		noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1, 2, 'elasticOut')
		noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2, 2, 'elasticOut')
		noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3, 2, 'elasticOut')
		
		doTweenAngle('turn', 'camGame', 0, 0.1, 'linear')
		
		GuitarStageIsThere = 0
		doTweenAlpha('guitarNoteHit','guitarNoteHit', 0, 0.01, 'linear')
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if (GuitarStageIsThere == 1) and (isSustainNote == false) then
		if noteData == 0 then
			doTweenColor('guitarNoteHitL', 'guitarNoteHit', 'bc009a', 0.01, 'quartIn'); 
		elseif noteData == 1 then
			doTweenColor('guitarNoteHitD', 'guitarNoteHit', '3900b8', 0.01, 'quartIn'); 
		elseif noteData == 2 then
			doTweenColor('guitarNoteHitU', 'guitarNoteHit', '29a200', 0.01, 'quartIn'); 
		elseif noteData == 3 then
			doTweenColor('guitarNoteHitR', 'guitarNoteHit', '860000', 0.01, 'quartIn'); 
		end
		GuitarNoteHitAlpha = 1
	end

end

function onUpdate()
    doTweenAlpha('guitarNoteHit','guitarNoteHit', GuitarNoteHitAlpha, 0.01, 'linear')
    GuitarNoteHitAlpha = GuitarNoteHitAlpha - 0.035
end