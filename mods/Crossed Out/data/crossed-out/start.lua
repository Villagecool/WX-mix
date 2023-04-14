

function onStepHit()
    if curStep == 2 then
		objectPlayAnimation('start','BOO instance 1',false)
    end
    if curStep == 10 then
        removeLuaSprite('start',true)
       
    end
    if curStep == 15 then
      removeLuaSprite('start',true)
      removeLuaSprite('CupTitle',true)
  end
end



