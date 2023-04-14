local CupheadShotting = false;
local BF_CupheadAttacking = false

local attack = 0;
local CardAnimation = 0;
local bf_visibleCuphead2 = 0;

local ShottingStyle = nil -- lua uses nil instead of null 

local RandomSound = 0
local CardCrapY = 520

local PeaShootCounter = 1
local PeaShotHurt = 0

local ChaserShotNumber = 0
local ChaserShotHurt = 0
local ChaserShotSound = 0

local BulletOffsetY = 0
local BulletTimer = 0
local StartTimer = false

local DisableNotes = 0

function onCreate()


    makeAnimatedLuaSprite('Cardcrap', 'cup/Cardcrap',1000,CardCrapY + 100);
    addAnimationByPrefix('Cardcrap','Filled','Card Filled instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Parry','PARRY Card Pop out  instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Normal','Card Normal Pop out instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Used','Card Used instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Flipped','Card but flipped instance 1',1,true)
    objectPlayAnimation('Cardcrap','Flipped',true)
    setProperty('Cardcrap.scale.y',0)
    setObjectCamera('Cardcrap','hud');


    if downscroll then
        CardCrapY = -30
        setProperty('Cardcrap.y',CardCrapY - 100)
        setProperty('Cardcrap.angle',180)
    end

    addLuaSprite('Cardcrap',true)
        
    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then

        --Load Green Shot
        makeAnimatedLuaSprite('FlashShot','cup/bull/Cupheadshoot',getProperty('dad.x') + 320,getProperty('dad.y') + 100)
        addAnimationByPrefix('FlashShot','Flash','BulletFlashFX instance 1',24,false);
     
        -- cuphead blue shot
        for i = 0, 3 do
            makeAnimatedLuaSprite('Peashoot' ..i, 'cup/bull/Cupheadshoot', getProperty('dad.x') + 400, getProperty('dad.y') - 105 + BulletOffsetY);
            addAnimationByPrefix('Peashoot'..i, 'H-Tween0', 'BulletFX_H-Tween_02 instance 1', 24, false);
            addAnimationByPrefix('Peashoot'..i, 'H-Tween1', 'BulletFX_H-Tween_02 instance 2', 24, false);
            addAnimationByPrefix('Peashoot'..i, 'H-Tween2', 'BulletFX_H-Tween_03 instance 1', 24, false);

            -- sorry for this :[
            if (i == 0) then
                BulletOffsetY = 0
            elseif (i == 1) then
                BulletOffsetY = -25
            elseif (i == 2) then
                BulletOffsetY = -50
            end
        end


    else
        --Load Blue Shot
        for i = 1, 5 do
            makeAnimatedLuaSprite('PeashootNM' ..i, 'cup/bull/NMcupheadBull', getProperty('dad.x') + 435, getProperty('dad.y') + 175);

            addAnimationByPrefix('PeashootNM' ..i, 'H-Tween0', 'Shot01 instance 1', 25, false);
            addAnimationByPrefix('PeashootNM' ..i, 'H-Tween1', 'Shot02 instance 1', 25, false);
            addAnimationByPrefix('PeashootNM' ..i, 'H-Tween2', 'Shot03 instance 1', 25, false);
            addAnimationByPrefix('PeashootNM' ..i, 'H-Tween3', 'Shot04 instance 1', 25, false);
            addAnimationByPrefix('PeashootNM' ..i, 'H-Tween4', 'Shot05 instance 1', 25, false);

            setBlendMode('PeashootNM' ..i, 'add')
        end
    end
    for i = 0, 7 do
        makeAnimatedLuaSprite('GreenShit' ..i, 'cup/bull/GreenShit', getProperty('dad.x') + 360, getProperty('dad.y') + 60);
        addAnimationByPrefix('GreenShit' ..i,'ChaserShot1', 'GreenShit01', 24,false);
        addAnimationByPrefix('GreenShit' ..i,'ChaserShot2', 'GreenShit02', 24,false);
        addAnimationByPrefix('GreenShit' ..i,'ChaserShot3', 'GreenShit03', 24,false);
        setBlendMode('GreenShit' ..i,'add')
    end
end

function onEvent(name,value1,value2)
    if (name == 'CupheadShotting') then
        if (value1 == '' and value2 == '') then
            StartTimer = true
            BulletTimer = 10

            ShottingStyle = nil
        end

        if (value1 ~= '' and value2 ~= 'False' or value1 ~= '' and value2 == '') then
            ShottingStyle = 1
        end

        if (value2 == '' or value2 == 'True') then
            CupheadShotting = true;
            DisableNotes = 2
        end

        if (value2 ~= '') then
            CupheadShotting = false;
            ShottingStyle = nil
        end
    end
end



function onUpdate()
    if DisableNotes == 2 then
        if CupheadShotting == false then
            DisableNotes = 1
        end
        for j = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', j, 'noteType') == '' then
                setPropertyFromGroup('notes', j, 'hitHealth', '0');
            end
        end
    elseif DisableNotes == 1 then
        for j = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', j, 'noteType') == '' then
                setPropertyFromGroup('notes', j, 'hitHealth', '0.023');
            end
        end
        DisableNotes = 0
    end

    if getProperty('Cardcrap.scale.y') >= 1 and CardAnimation == -1 and getProperty('Cardcrap.animation.curAnim.name') == 'Flipped' then
        CardAnimation = 1
        attack = 1
        setProperty('Cardcrap.scale.y',1)
        objectPlayAnimation('Cardcrap','Normal',true)
        setProperty('Cardcrap.y',CardCrapY)
    end
    RandomSound = math.random(1,3)

    for ChaserShotCount = 1, 7 do 
        if getProperty('GreenShit'..ChaserShotCount..'.animation.curAnim.finished') == true then
            removeLuaSprite('GreenShit'..ChaserShotCount,false)
        end
        if getProperty('GreenShit'..ChaserShotCount..'.animation.curAnim.curFrame') == 10 and ChaserShotHurt ~= ChaserShotCount and getProperty('health') > 0.05 then
            setProperty('health', getProperty('health')-0.023)
            ChaserShotHurt = ChaserShotCount
        end
        if getProperty('GreenShit'..ChaserShotHurt..'.animation.curAnim.curFrame') ~= 10 then
            ChaserShotHurt = ChaserShotCount
        end
    end

    if getProperty('FlashShot.animation.curAnim.finished') == true then
        removeLuaSprite('FlashShot',false)
    end

    for PeaShotC = 0, 3 do
        if (getProperty('Peashoot' ..PeaShotC.. '.animation.curAnim.finished')) then
            removeLuaSprite('Peashoot' ..PeaShotC, false)
        end
        while (getProperty('Peashoot'..PeaShotC..'.animation.curAnim.curFrame') == 6 and PeaShotHurt ~= PeaShotC) do
            setProperty('health', getProperty('health') - 0.06)
            PeaShotHurt = PeaShotC
        end
    end
    for NMPeaShotC = 1, 5 do
        if (getProperty('PeashootNM' ..NMPeaShotC.. '.animation.curAnim.finished')) then
            removeLuaSprite('PeashootNM' ..NMPeaShotC, false)
        end
        while (getProperty('PeashootNM'..NMPeaShotC..'.animation.curAnim.curFrame') == 5 and PeaShotHurt ~= NMPeaShotC) do
            setProperty('health', getProperty('health') - 0.06)
            PeaShotHurt = NMPeaShotC
        end
    end
    if (CupheadShotting == true and StartTimer == true and ShottingStyle == nil) then
        if (BulletTimer > 0) then 
            BulletTimer = BulletTimer - 1 
        end
        if (BulletTimer <= 0) then
            BulletTimer = 10
            PeaShootCounter = PeaShootCounter + 1

            characterPlayAnim('dad','shotting', true)
            setProperty('dad.specialAnim', true);

            if (getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead') then

                addLuaSprite('FlashShot', true)
                objectPlayAnimation('FlashShot', 'Flash', true)

                addLuaSprite('Peashoot' ..PeaShootCounter-1, true)
                objectPlayAnimation('Peashoot' ..PeaShootCounter-1, 'H-Tween' ..math.random(0, 2), true)
            else
                addLuaSprite('PeashootNM' ..PeaShootCounter-1, true)
                objectPlayAnimation('PeashootNM' ..PeaShootCounter-1, 'H-Tween' ..math.random(0, 4), true)
            end
            playSound('Cup/pea' ..math.random(0, 5))
        end
    end

    if (getProperty('Cardcrap.animation.curAnim.finished') == true) then
        if (getProperty('Cardcrap.animation.curAnim.name') == 'Used') then

            objectPlayAnimation('Cardcrap','Flipped',true)
            if (not downscroll) then
                setProperty('Cardcrap.y', CardCrapY + 100)
            else
                setProperty('Cardcrap.y', CardCrapY - 100)
            end
            setProperty('Cardcrap.scale.y',0)
            CardAnimation = -1

        elseif (getProperty('Cardcrap.animation.curAnim.name') == 'Parry') then
            objectPlayAnimation('Cardcrap', 'Filled', false)
        end
    end

    if attack == 1 then

        if CardAnimation == 0 then -- Add Card's sprite 

            objectPlayAnimation('Cardcrap','Parry',false)
            CardAnimation = 2
        end



        if BF_CupheadAttacking == false then

            if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') or botPlay and CupheadShotting == true and ShottingStyle ~= 1 then -- If press Shift, BF will attack
                objectPlayAnimation('Cardcrap','Used',false)
                characterPlayAnim('boyfriend','attack',true)
                setProperty('boyfriend.specialAnim',true)
                runTimer('CupheadHurt',0.3)
                playSound('IC/Throw'..RandomSound)
                attack = 0
                CardAnimation = -1
                bf_visibleCuphead2 = 1
                BF_CupheadAttacking = true
            end
        end
    end

    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' and bf_visibleCuphead2 == 1 or getProperty('boyfriend.animation.curAnim.name') ~= 'attack' and bf_visibleCuphead2 == 1 then
        BF_CupheadAttacking = false
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        bf_visibleCuphead2 = 0
    end

    if bf_visibleCuphead2 == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end

    if ChaserShotNumber > 7 then
        ChaserShotNumber = 0
    end

    if ChaserShotSound > 3 then
        ChaserShotSound = 0
    end

    if (getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead') then
        if (PeaShootCounter > 3) then
            PeaShootCounter = 1
        end
    else
        if (PeaShootCounter > 5) then
            PeaShootCounter = 1
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'CupheadNote' then
		-- put something here if you want
		attack = 1;
        setProperty('Cardcrap.y', CardCrapY)
        setProperty('Cardcrap.scale.y', 1)
        if CardAnimation == -1 then
            CardAnimation = 0
        end
	end

    if noteType ~= 'CupheadNote' then
       
		-- put something here if you want
        if getProperty('Cardcrap.animation.curAnim.name') == 'Flipped' then
            setProperty('Cardcrap.scale.y',getProperty('Cardcrap.scale.y') + 0.01)
            if not downscroll then
              setProperty('Cardcrap.y',getProperty('Cardcrap.y') - 1)
            else
                setProperty('Cardcrap.y',getProperty('Cardcrap.y') + 1)
            end
        end
	end
end

local CupheadShotAnimations = {"pewLEFT","pewDOWN","pewUP","pewRIGHT"}

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if ShottingStyle == 1 and CupheadShotting == true and not isSustainNote then -- Create the green shot
        characterPlayAnim('dad',CupheadShotAnimations[noteData + 1],true)

        setProperty('dad.specialAnim',true)
        addLuaSprite('GreenShit'..ChaserShotNumber,true)
        objectPlayAnimation('GreenShit'..ChaserShotNumber,'ChaserShot'..math.random(1,3), false)
        playSound('cup/chaser'..ChaserShotSound)
        ChaserShotNumber  = ChaserShotNumber + 1
        ChaserShotSound  = ChaserShotSound + 1
    end
	if CupheadShotting == true and ShottingStyle ~= 1 then
		-- put something here if you want
		CupheadShotting = false;

	end
end

function onTimerCompleted(tag)
    if tag == 'CupheadHurt' then

        if CupheadShotting == true then

            setProperty('health',getProperty('health') + 1)

            for j = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', j, 'noteType') == '' and getPropertyFromGroup('notes', i, 'mustPress') == true then
                    setPropertyFromGroup('notes', j, 'hitHealth', '0.023');
                end
            end

            if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then

             characterPlayAnim('dad','hurt',true)
             setProperty('dad.specialAnim',true);
             playSound('cup/CupHurt')

            else
                characterPlayAnim('dad','dodge',true)
                setProperty('dad.specialAnim',true);
                playSound('cup/CupDodge')
            end

            CupheadShotting = false;
        else
            if CupheadShotting == false or getProperty('dad.curCharacter') == 'Nightmare-Cuphead' then

             characterPlayAnim('dad','dodge',true)
             setProperty('dad.specialAnim',true);
             playSound('cup/CupDodge')
            end
        end
    end
end
