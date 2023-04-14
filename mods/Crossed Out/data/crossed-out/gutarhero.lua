function onCreate()
  BlackSansEffect = 0
  setObjectCamera('Black','hud')
  doTweenColor('WhiteToBlack','Black','000000',0.01,'LinearOut')



  makeLuaSprite('White','sans/white',-1150,500)
  scaleObject('White',1.55,1.5)
  setScrollFactor('White',0,1)
end

function onStepHit()

  if curStep == 2042 then
    addLuaSprite('White',false)
    setProperty('White.alpha',0)
    
    doTweenColor('bfColorTween', 'boyfriend', '000000', 1, 'linear')
    doTweenColor('dadColorTween', 'dad', '000000', 1, 'linear')
    triggerEvent('Set Cam Zoom',1.1,2)
  end

  if curStep == 2302 then

    removeLuaSprite('Black1',true)
    removeLuaSprite('Black2',true)
    removeLuaSprite('White',true)
  
    doTweenColor('bfColorTween', 'boyfriend', 'FFFFFF', 0.01, 'linear')
    doTweenColor('dadColorTween', 'dad', 'FFFFFF', 0.01, 'linear')
    for i = 0,7 do
      if not downscroll then
        noteTweenY('coolMoviment'..i, i, 50, 0.01, 'QuartOut')
       else
         noteTweenY('coolMoviment'..i, i, screenHeight - 150, 0.01, 'QuartOut')
       end
    end

    triggerEvent('Set Cam Zoom',0.9,'')
  end
end

function onUpdate(elapsed)
  if getProperty('White.alpha') < 1 then
    setProperty('White.alpha',getProperty('White.alpha') + 0.01)
  end
end

function onTweenCompleted(tag)
  if tag == 'Black1FadeOut' then
    removeLuaSprite('Black1',false)
  end

  if tag == 'Black2FadeOut' then
    removeLuaSprite('Black2',false)
  end
end