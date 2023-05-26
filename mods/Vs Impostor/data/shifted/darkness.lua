
function onStepHit()
    if curStep == 768 then
        dark(true)
    end
    if curStep == 928 then
        doTweenAlpha('sus', 'DefeatBackv4', 1,3, 'linear')
    end
    if curStep == 1056 then
        dark(false)
    end
end
function dark(onoff)
    if onoff == true then
        cameraFlash('game','000000', 3,false)
        setProperty('walls2.alpha', 1)
        setProperty('switch.alpha', 0)
        setProperty('switch2.alpha', 0)
        setProperty('dude.alpha', 0)
        setProperty('cams.alpha', 0)
        ogBF = getProperty('boyfriend.curCharacter')
        ogDAD = getProperty('dad.curCharacter')
        ogGF = getProperty('gf.curCharacter')
        triggerEvent('Change Character', "bf", "lime_dark")
        triggerEvent('Change Character', "dad", "pink-play-dark")
        triggerEvent('Change Character', "2", "gf-grene-dark")
        setProperty('boyfriend.flipX', false)
        setProperty('dad.flipX', true)
        setProperty('boyfriend.x', 600+getProperty('boyfriend.positionArray[0]'))
        setProperty('dad.x', 1400+getProperty('dad.positionArray[0]'))
    else
        cameraFlash('game','FFFFFF', 1,false)
        setProperty('walls2.alpha', 0)
        setProperty('DefeatBackv4.alpha', 0)
        setProperty('switch.alpha', 1)
        setProperty('switch2.alpha', 1)
        setProperty('dude.alpha', 1)
        setProperty('cams.alpha', 1)
        triggerEvent('Change Character', "bf", ogBF)
        triggerEvent('Change Character', "dad", ogDAD)
        triggerEvent('Change Character', "2", ogGF)
        setProperty('boyfriend.flipX', false)
        setProperty('dad.flipX', true)
        setProperty('boyfriend.x', 600+getProperty('boyfriend.positionArray[0]'))
        setProperty('dad.x', 1400+getProperty('dad.positionArray[0]'))
    end
end
