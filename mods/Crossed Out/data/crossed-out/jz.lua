function onCreate()
    
    makeAnimatedLuaSprite('JzBoy','bendy/images/JzBoy',900,760)
	addAnimationByPrefix('JzBoy','dance','Jack Copper Walk by instance 1',24,true)
	
   
end

function onUpdate(elapsed)   
 Random = math.random(0,1)
    if getProperty('KnockOutText.animation.curAnim.finished') then
        doTweenAlpha('KnockBye','KnockOutText',0,1,'LinearOut')
    end
end

function onStepHit()
    if curStep == 2573 then
        setObjectOrder('JzBoy',getObjectOrder('BendyBG2'))
    
        
    end
    if curStep == 2576 then
        objectPlayAnimation('JzBoy','dance',false)
      
    end
    if curStep == 2576 then
        objectPlayAnimation('JzBoy','dance',false)
      
    end
end



