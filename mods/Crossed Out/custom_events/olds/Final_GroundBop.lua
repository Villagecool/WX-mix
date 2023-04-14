finalClickClack = 0
maxBeats = 0

function onEvent(name, value1)
	if name == 'Final_GroundBop' then
		if value1 == 'Do' then
			FinalStageIsThere = 1
			maxBeats = 3
			finalClickClack = 3
		elseif value1 == 'Full' then
			maxBeats = 1
		elseif value1 == 'Hefty' then
			maxBeats = 0
		elseif value1 == 'Dont' then
			maxBeats = 6969
		end
	end
end

function onBeatHit()
	--if FinalStageIsThere == 1 then
		if finalClickClack < maxBeats then 
			finalClickClack = finalClickClack + 1
		else
			objectPlayAnimation('Final_Base1','Ground Bop instance1 ', true)
			objectPlayAnimation('Final_Base2','Ground Bop instance2 ', true)
			finalClickClack = 0
		end
	--end
end
