function onCreate()
    Dodge = 0;
    BigShotMove = false;
    BigShotX = 700;
    DoubleAttackMoviment = 0;
    bf_visibleCuphead3 = 0
    DodgeTimerCupDoubleAttack = (getProperty('boyfriend.x') - getProperty('dad.x')) / 30000
    CupheadHurtAnimation = false
    InstaKillRoundabout = false
    
    if not downscroll then

        makeAnimatedLuaSprite('CupAlert','cup/mozo',500,353)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    else
        makeAnimatedLuaSprite('CupAlert','cup/gay',500,110)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    end

    
    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
     makeAnimatedLuaSprite('Roundabout', 'cup/bull/Roundabout',getProperty('dad.x')- 420,getProperty('dad.x') + 500);
	 addAnimationByPrefix('Roundabout','Roundabout','Roundabout instance 1',24,true);
	 objectPlayAnimation('Roundabout','Roundabout',true)
     scaleObject('Roundabout',1.3,1.3)
     setProperty('Roundabout.offset.y', -250)
    else
        makeAnimatedLuaSprite('Roundabout', 'cup/bull/NMcupheadAttacks',getProperty('dad.x') + 420,getProperty('dad.x') + 270);
        addAnimationByPrefix('Roundabout','Roundabout','DeathRoundabout instance 1',24,true);
        objectPlayAnimation('Roundabout','Roundabout',true)
        scaleObject('Roundabout',0.9,0.9)
        setProperty('Roundabout.offset.y', -100)
    end
    setBlendMode('Roundabout','add')
end

function onEvent(name,value1,value2)



    if name == "CupheadDoubleAttack" then


        Dodge = 2

        runTimer('CupheadDoubleAttack',0.6)
        playSound('Cup/CupPre_shoot')
        runTimer('AttackAnimation',0.3)
        if value1 ~= '' then
            addLuaSprite('CupAlert',true)
            playSound('Cup/fuckyoumoro')
            objectPlayAnimation('CupAlert','Alert',true)
        end
        if value2 ~= '' then
            InstaKillRoundabout = true
        else
            InstaKillRoundabout = false
        end
    end
end

function onUpdate(elapsed) 

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

    if getProperty('CupAlert.animation.curAnim.finished') then
        removeLuaSprite('CupAlert',false)
    end

    if Dodge == 2 and keyJustPressed('space') and not botPlay or Dodge == 2 and botPlay then
        Dodge = 1;
    end

    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and bf_visibleCuphead3 == 1 or bf_visibleCuphead3 == 1 and getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        bf_visibleCuphead3 = 0
    end

    if bf_visibleCuphead3 == 1 then

        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end
end

function onTimerCompleted(tag)
    
    if tag == 'AttackAnimation' then
        characterPlayAnim('dad', 'big shot', false);
        setProperty('dad.specialAnim', true);
    end

    if tag == 'CupheadDoubleAttack' then

     removeLuaSprite('Roundabout', false)
     addLuaSprite('Roundabout',true)
     setObjectOrder('Roundabout',6)
     setProperty('Roundabout.x',getProperty('dad.x') + 420)
     setProperty('Roundabout.y',getProperty('dad.y'))
     doTweenX('Roundabout','Roundabout',getProperty('boyfriend.x') + 600, 1, 'QuadOut');
     runTimer('RoundaboutTime',0.7);
     playSound('cup/CupShoot');
     setObjectOrder('Roundabout',getObjectOrder('boyfriendGroup') - 1)
     runTimer('dodgeDoubleAttack',DodgeTimerCupDoubleAttack)
    end

    if tag == 'dodgeDoubleAttack' then
       if Dodge == 1 then
        characterPlayAnim('boyfriend','dodge',true)
        setProperty('boyfriend.specialAnim',true)
        bf_visibleCuphead3 = 1
        playSound('cup/CupDodge',1)
       end

        if Dodge == 2 then
            characterPlayAnim('boyfriend','hurt',false);
            setProperty('boyfriend.specialAnim',true);
            if getProperty('health') - 1.2 > 0 and not InstaKillRoundabout then
            setProperty('health',getProperty('health') - 1.2)
            elseif getProperty('health') - 1.2 <= 0 or InstaKillRoundabout then
                runTimer('GameOver',0.3);
            end
            objectPlayAnimation('BigShotCuphead','Burst',false)
            setProperty('BigShotCuphead.x','boyfriend.x' + 150)
        end
    end

    if tag == 'Dodge' then
        if Dodge == 1 then
         setObjectOrder('Roundabout',getObjectOrder('boyfriendGroup') + 1)
         characterPlayAnim('boyfriend','dodge',true)
         setProperty('boyfriend.specialAnim',true)
         bf_visibleCuphead3 = 1
         playSound('cup/CupDodge',1)
		end


        if Dodge == 2 then
          characterPlayAnim('boyfriend','hurt',false);
          setProperty('boyfriend.specialAnim',true);
          if getProperty('health') - 1.2 > 0 and not InstaKillRoundabout then
            setProperty('health',getProperty('health') - 1.2)
            elseif getProperty('health') - 1.2 <= 0 or InstaKillRoundabout then
                runTimer('GameOver',0.3);
            end
          setProperty('BigShotCuphead.x','boyfriend.x' + 150)
        end
    end

    if tag == 'GameOver' then
     removeLuaSprite('BigShotCuphead', false)
     setProperty('health', -1);
    end
    
    if tag == 'RoundaboutTime' then
        doTweenX('Roundabout','Roundabout',-300, 1.5, 'QuadIn');
        runTimer('RoundaboutDestroy',2)
        Dodge = 2;
        runTimer('Dodge',0.5)
        setObjectOrder('Roundabout',7)
    end

    if tag == 'RoundaboutDestroy' then
     removeLuaSprite('Roundabout',false)
    end
end
