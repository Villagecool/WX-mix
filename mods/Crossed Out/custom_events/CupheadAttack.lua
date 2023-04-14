function onCreate()
    Dodge = 0;
    BigShotSpeedX = 0;
    BigShotMove = false;
    bf_visibleCuphead = 0
    bf_characterFound = false
    BigShotYOffset = 0
    LifeDownCupTimer = 0
    CupheadHurtAnimation = false
    InstaKillPeaBigShot = false

    DodgeTimerCupAttack = (getProperty('boyfriend.x') - getProperty('dad.x')) / 30000
    
    if not downscroll then

        makeAnimatedLuaSprite('CupAlert','cup/mozo',500,540)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    else
        makeAnimatedLuaSprite('CupAlert','cup/gay',500,110)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    end

    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        makeAnimatedLuaSprite('BigShotCuphead', 'cup/bull/Cuphead Hadoken',getProperty('dad.x') - 200,getProperty('dad.y') - 50);
        addAnimationByPrefix('BigShotCuphead','Burst','BurstFX instance 1',24,false);
        addAnimationByPrefix('BigShotCuphead','Hadolen','Hadolen instance 1',24,true);
        objectPlayAnimation('BigShotCuphead','Hadolen',true)
        BigShotYOffset = -50
    end

    if getProperty('dad.curCharacter') == 'Nightmare-Cuphead' then
        makeAnimatedLuaSprite('BigShotCuphead', 'cup/bull/NMcupheadAttacks',getProperty('dad.x') - 200,getProperty('dad.y') + 100);
        addAnimationByPrefix('BigShotCuphead','Hadolen','DeathBlast instance 1',24,true);
        objectPlayAnimation('BigShotCuphead','Hadolen',true)
        scaleObject('BigShotCuphead',1.2,1.2)
        BigShotYOffset = 100
    end

    setBlendMode('BigShotCuphead','add')
end

function onEvent(name,value1,value2)

    if name == "CupheadAttack" then
        BigShotY = getProperty('dad.y') + BigShotYOffset
        if value1 ~= '' then
            addLuaSprite('CupAlert',true)
            playSound('Cup/fuckyoumoro')
        end
        if value2 ~= '' then
            InstaKillPeaBigShot = true
        else
            InstaKillPeaBigShot = false
        end
    Dodge = 2


    runTimer('CupheadAttack',0.6)
    runTimer('AttackAnimation',0.3)
    playSound('Cup/CupPre_shoot')
    end
end

function onUpdate()


    
    if getProperty('CupAlert.animation.curAnim.finished') then
        removeLuaSprite('CupAlert',false)
        objectPlayAnimation('CupAlert','Alert',true)
    end

    if BigShotMove == true then
     setProperty('BigShotCuphead.x',getProperty('BigShotCuphead.x') + 45)
    end

    if getProperty('BigShotCuphead.animation.curAnim.finished') == true and getProperty('BigShotCuphead.animation.curAnim.name') == 'Burst' then
        removeLuaSprite('BigShotCuphead',false)
    end
 
    if Dodge == 2 and keyJustPressed('space') and not botPlay or Dodge == 2 and botPlay then
        Dodge = 1;
    end

    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and bf_visibleCuphead == 1 or getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' and bf_visibleCuphead == 1 then
        if bf_visibleCuphead == 1 then
            bf_visibleCuphead = 0
        end
        for i = 0,getProperty('notes.length')-1 do

            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
    end

    if getProperty('dad.animation.curAnim.name') == 'big shot' then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == false then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end

        CupheadHurtAnimation = true

    elseif getProperty('dad.animation.curAnim.name') ~= 'big shot' and CupheadHurtAnimation == true then

        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == false then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        CupheadHurtAnimation = false
    end

    if bf_visibleCuphead == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end
    if getProperty('BigShotCuphead.x') > screenWidth + getProperty('BigShotCuphead.width') then
        removeLuaSprite('BigShotCuphead',false)
    end

end

function onTimerCompleted(tag)


    if tag == 'AttackAnimation' then
        characterPlayAnim('dad', 'big shot', false);
        setProperty('dad.specialAnim', true);
    end


    if tag == 'CupheadAttack' then

     setProperty('BigShotCuphead.x',getProperty('dad.x') - 200,getProperty('dad.y') - 50)
     BigShotSpeedX = 0
     BigShotMove = true;
     removeLuaSprite('BigShotCuphead', false)
     addLuaSprite('BigShotCuphead',true)
     setProperty('BigShotCuphead.y',BigShotY)
     objectPlayAnimation('BigShotCuphead','Hadolen',true)
     playSound('cup/CupShoot')
     runTimer('dodgeCupAttack',DodgeTimerCupAttack)

    end

    if tag == 'dodgeCupAttack' then
        if Dodge == 1 then
            characterPlayAnim('boyfriend','dodge',false)
            setProperty('boyfriend.specialAnim',true)
            playSound('cup/CupDodge',1)
            bf_visibleCuphead = 1
            Dodge = 0
        end
   
        if Dodge == 2 then
         characterPlayAnim('boyfriend','hurt',false);
         setProperty('boyfriend.specialAnim',true);

            if getProperty('health') - 1.4 > 0 and not InstaKillPeaBigShot then
             setProperty('health',getProperty('health') - 1.4)

            elseif getProperty('health') - 1.4 <= 0 or InstaKillPeaBigShot then
             runTimer('GameOver',0.3);
            end

            if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
                objectPlayAnimation('BigShotCuphead','Burst',false)    
                setProperty('BigShotCuphead.y',BigShotY - 500)
                BigShotMove = false
            end
        end
   
 
    end

    if tag == 'GameOver' then

     setProperty('health', -500);
    end
end

function onStepHit()

    if curStep == 1174 and songName == 'Knockout' then
        BigShotMove = false
        objectPlayAnimation('BigShotCuphead','Burst',false)    
        setProperty('BigShotCuphead.y',getProperty('BigShotCuphead.y') - 500)   
    end
end