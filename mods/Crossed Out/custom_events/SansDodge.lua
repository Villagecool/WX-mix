local DodgeSans = 0;
local Color = 0
local RandomColor = 0;
local characterSansDodgeFound = false
local Bf_Sans_Dodge = false
local InstaKillSans = false


function onCreate()
    makeAnimatedLuaSprite('DodgeAlert2','sans/Sans_Shit_NM',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 50)

    addAnimationByPrefix('DodgeAlert2','alertBlue','AlarmBlue instance 1',24,false)
    addAnimationByPrefix('DodgeAlert2','alertOrange','AlarmOrange instance 1',24,false)

    addAnimationByPrefix('DodgeAlert2','attackBlue','Bones boi instance 1',24,false)
    addAnimationByPrefix('DodgeAlert2','attackOrange','Bones Orange instance 1',24,false)
    setBlendMode('DodgeAlert2','add')
    
    scaleObject('DodgeAlert2',0.8,0.8)

    if getProperty('boyfriend.curCharacter') ~= 'BF_Sans_Chara' and getProperty('boyfriend.curCharacter') ~= 'BF_Sans_IC' and getProperty('boyfriend.curCharacter') ~= 'BF_Sans_Chara' then
        makeAnimatedLuaSprite('DodgeAlert','sans/Bone',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') + 50)
        addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
        addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
        scaleObject('DodgeAlert',0.8,0.8)
    end


    if songName == 'Burning-In-Hell' then
        makeAnimatedLuaSprite('DodgeAlert','sans/DodgeMechs',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 50)
        addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
        addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
        scaleObject('DodgeAlert',0.8,0.8)
    end

    if songName == 'Crossed-Out' or songName == 'Sansational' then
        makeAnimatedLuaSprite('DodgeAlert','sans/DodgeMechs',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') + 50)
        addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
        addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
        scaleObject('DodgeAlert',0.8,0.8)
        
    end
    if getProperty('boyfriend.curCharacter') == 'BF_Sans_Chara' then
        makeAnimatedLuaSprite('BFSansDodge','sans/Cardodge',getProperty('boyfriend.x') + 5,getProperty('boyfriend.y') + 50)
        addAnimationByPrefix('BFSansDodge','dodge','Dodge instance 1',24,false)
        characterSansDodgeFound = true
    end

    if getProperty('boyfriend.curCharacter') == 'bf_cuphead_1bw' then
        makeAnimatedLuaSprite('BFSansDodge','sans/DodgeMechs',getProperty('boyfriend.x') - 5,getProperty('boyfriend.y') - 28)
        addAnimationByPrefix('BFSansDodge','dodge','Dodge instance 1',24,false)
        characterSansDodgeFound = true
    end

end


function onUpdate(elapsed)
    RandomColor = math.random(3,4,6,8,9,12)

    if DodgeSans == 3 and keyJustPressed('space') and not botPlay or Dodge == 3 and Color == 'Orange' and botPlay or DodgeSans == 3 and botPlay and Color == 0 then
        playSound('sans/dodge')
        DodgeSans = 2;
    end



    if getProperty('DodgeAlert.animation.curAnim.finished') and getProperty('DodgeAlert.animation.curAnim.name') == 'attack' then
         triggerEvent('Camera Follow Pos','','')
        removeLuaSprite('DodgeAlert',false)
        objectPlayAnimation('DodgeAlert','alert',false)
    end

    if getProperty('DodgeAlert2.animation.curAnim.finished') and getProperty('DodgeAlert2.animation.curAnim.name') == 'attackOrange' or getProperty('DodgeAlert2.animation.curAnim.finished') and getProperty('DodgeAlert2.animation.curAnim.name') == 'attackBlue' then
        triggerEvent('Camera Follow Pos','','')
        removeLuaSprite('DodgeAlert2',false)
        objectPlayAnimation('DodgeAlert2','alert2',false)
        Color = 0
    end

    if getProperty('BFSansDodge.animation.curAnim.finished') and Bf_Sans_Dodge == true and characterSansDodgeFound == true then
        removeLuaSprite('BFSansDodge',false)
        setProperty('boyfriend.visible',true)
        Bf_Sans_Dodge = false
    end

    if DodgeSans == 1 and getProperty('boyfriend.animation.curAnim.finished') == true and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and characterSansDodgeFound == false or DodgeSans == 1 and getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' and characterSansDodgeFound == false then
        for i = 0,getProperty('notes.length')-1 do
             if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        DodgeSans = 0
    end
    if DodgeSans == 1 and characterSansDodgeFound == false then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end    
end

function onEvent(name,value1,value2)

        if name == "SansDodge" then
            runTimer('SansAttack',0.8)
            playSound('sans/notice')
            setProperty('DodgeAlert.y',getProperty('boyfriend.y') - 50)
            setProperty('DodgeAlert2.y',getProperty('boyfriend.y') - 50)
            triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50,getProperty('boyfriend.y'))
            DodgeSans = 3

            if value1 ~= '' then 
                addLuaSprite('DodgeAlert2',true)
                Color = 1
            else
                addLuaSprite('DodgeAlert',true)
                objectPlayAnimation('DodgeAlert','alert')
                Color = 0
            end 

            if value2 ~= '' then
                InstaKillSans = true
            else
                InstaKillSans = false
            end
            if Color == 1 then
                if RandomColor % 4 == 0 then
                    Color = 'Blue'
                    objectPlayAnimation('DodgeAlert2','alertBlue')
                elseif RandomColor % 3 == 0 then

                    Color = 'Orange'
                    objectPlayAnimation('DodgeAlert2','alertOrange')
                end
            end
        end
end

function onTimerCompleted(tag)
    if tag == 'SansAttack' then
      playSound('sans/sansattack')
      setProperty('DodgeAlert.y',getProperty('DodgeAlert.y') + 50)
      setProperty('DodgeAlert2.y',getProperty('DodgeAlert2.y') + 50)
      cameraShake('game',0.01,0.2)

 
        if Color ~= null then
            objectPlayAnimation('DodgeAlert2','attack'..Color,false)


            if DodgeSans == 2 and Color == 'Orange' then
                if characterSansDodgeFound == true and DodgeSans == 2 then
                    setProperty('BF_Attack.visible',false)
                    setProperty('BFSansDodge.visible',true)
                    Bf_Sans_Dodge = true
                    setProperty('boyfriend.visible',false)
                    addLuaSprite('BFSansDodge',true)
                    objectPlayAnimation('BFSansDodge','dodge')
                elseif DodgeSans == 2 and characterSansDodgeFound == false  then
                   characterPlayAnim('boyfriend','dodge',true)
                   setProperty('boyfriend.specialAnim',true)
                end
                DodgeSans = 1
                Color = 0
            end
         
 
            if DodgeSans == 3 and Color == 'Orange' or DodgeSans == 2 and Color == 'Blue' then
                characterPlayAnim('boyfriend','hurt',true)
                setProperty('boyfriend.specialAnim',true);
                if (getProperty('health') - 1) > -0.01 and not InstaKillSans then
                    setProperty('health',getProperty('health') - 1)
                elseif (getProperty('health') - 1) <= -0.05 or InstaKillSans then
                    runTimer('GameOverSans',0.35)
                end
                DodgeSans = 0
            end
        end
 
         if Color == 0 then
             objectPlayAnimation('DodgeAlert','attack')
             if characterSansDodgeFound == true and DodgeSans == 2 then
                 setProperty('BF_Attack.visible',false)
                 setProperty('BFSansDodge.visible',true)
                 Bf_Sans_Dodge = true
                 setProperty('boyfriend.visible',false)
                 addLuaSprite('BFSansDodge',true)
                 objectPlayAnimation('BFSansDodge','dodge')
             elseif DodgeSans == 2 and characterSansDodgeFound == false  then
                characterPlayAnim('boyfriend','dodge',true)
                setProperty('boyfriend.specialAnim',true)
                DodgeSans = 1
             end
 
             if DodgeSans == 3 then
                characterPlayAnim('boyfriend','hurt',true)
                setProperty('boyfriend.specialAnim',true);

                if characterSansDodgeFound then
                    characterPlayAnim('boyfriend','singUPmiss',true)
                    setProperty('boyfriend.specialAnim',true)
                end

                if (getProperty('health') - 1) > -0.01 and not InstaKillSans then
                    setProperty('health',getProperty('health') - 1)
                elseif (getProperty('health') - 1) <= -0.01 or InstaKillSans then
                    runTimer('GameOverSans',0.35)
                end
                DodgeSans = 0
             end
         end
         
 
         
     end
    if tag == 'GameOverSans' then
     setProperty('health',0)
    end
end

function onStepHit()

end


