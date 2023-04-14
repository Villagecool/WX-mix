function onCreate()
	if not lowQuality then
		makeAnimatedLuaSprite('CupheadStage2_BfGhost','CupheadStage2_BfGhost', 1200, 200)
		addAnimationByPrefix('CupheadStage2_BfGhost','Fly instance ','Fly instance ',24, false)
		addAnimationByPrefix('CupheadStage2_BfGhost','Stay instance ','Stay instance ',24, true)
		doTweenAlpha('CupheadStage2_BfGhost','CupheadStage2_BfGhost', 0, 0.01, 'linear')

		makeAnimatedLuaSprite('CupheadStage2_BfGhost2','CupheadStage2_BfGhost', -100, 200)
		addAnimationByPrefix('CupheadStage2_BfGhost2','Fly instance ','Fly instance ',24, false)
		addAnimationByPrefix('CupheadStage2_BfGhost2','Stay instance ','Stay instance ',24, true)
		setProperty('CupheadStage2_BfGhost2.flipX', true);
		doTweenAlpha('CupheadStage2_BfGhost2','CupheadStage2_BfGhost', 0, 0.01, 'linear')
	end
end

function onEvent(name, value1, value2)
	if name == 'Cuphead_Ghosts' then
		if value1 == 'Add' then
			objectPlayAnimation('CupheadStage2_BfGhost','Stay instance ',true)
			objectPlayAnimation('CupheadStage2_BfGhost2','Stay instance ',true)
			addLuaSprite('CupheadStage2_BfGhost', false)
			addLuaSprite('CupheadStage2_BfGhost2', false)
			doTweenAlpha('CupheadStage2_BfGhost','CupheadStage2_BfGhost', 1, 1, 'linear')
			doTweenAlpha('CupheadStage2_BfGhost2','CupheadStage2_BfGhost2', 1, 1, 'linear')


		elseif value1 == 'Fly' then
			objectPlayAnimation('CupheadStage2_BfGhost','Fly instance ',true)
			objectPlayAnimation('CupheadStage2_BfGhost2','Fly instance ',true)
		end	
	end
end
