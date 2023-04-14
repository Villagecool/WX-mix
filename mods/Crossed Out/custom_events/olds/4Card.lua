
canAttackCard = false;
cardSplashAlpha = 0;
cardCurAlpha = 0;
CardIsAllowedOnScreen = true
curNotesLoaded = 0
sansCanDoDodge = false
sansMustDoDodge = false
sansBoneDodgeTime = 0
sansDodgeSaveCard = true

function onCreate()
    makeLuaSprite('AceOfHearts','AceOfHearts', 100, 490)
    setObjectCamera('AceOfHearts', 'camHUD');
    scaleObject('AceOfHearts', 0.5, 0.5);
    addLuaSprite('AceOfHearts', false);
    doTweenAlpha('AceOfHearts', 'AceOfHearts', a, 0.1, 'linear');

    makeLuaSprite('FullAce','FullAce', -50, 0)
    setObjectCamera('FullAce', 'camHUD');
    scaleObject('FullAce', 0.7, 0.7);
    doTweenAlpha('FullAce', 'FullAce', a, 0.1, 'linear');
    addLuaSprite('FullAce', true);

    makeAnimatedLuaSprite('SansEvent_Dodge','SansEvent_Dodge', 640, 300)
	addAnimationByPrefix('SansEvent_Dodge','SansBoneWarn ','Alarm instance ',24 , true)
	setObjectCamera('SansEvent_Dodge', 'camHUD');
	scaleObject('SansEvent_Dodge', 0.65, 0.65);	

	makeAnimatedLuaSprite('SansEvent_Dodge_Hit','SansEvent_Dodge', 640, 300)
	addAnimationByPrefix('SansEvent_Dodge_Hit','SansBoneHit ','Bones boi instance ',24 , false)
	setObjectCamera('SansEvent_Dodge_Hit', 'camHUD');
	scaleObject('SansEvent_Dodge_Hit', 0.65, 0.65);	

    if difficultyName == 'Easy' then
        cardIsEverAllowed = true
        cupheadCardAttackDamage = 1
        cupheadCardAlphaReady = 0.4
        sansBoneDodgeBeats = 4
        sansBoneDodgeDamage = 0.5

    elseif difficultyName == 'Omegaspace' then
        cardIsEverAllowed = false
        cupheadCardAttackDamage = 0.75
        cupheadCardAlphaReady = 0.5
        sansBoneDodgeBeats = 2
        sansBoneDodgeDamage = 0.8

    elseif difficultyName == 'Normal' then
        cardIsEverAllowed = true
        cupheadCardAttackDamage = 0.75
        cupheadCardAlphaReady = 0.5
        sansBoneDodgeBeats = 2
        sansBoneDodgeDamage = 0.8

    elseif difficultyName == 'Hard' then
        cardIsEverAllowed = true
        cupheadCardAttackDamage = 0.75
        cupheadCardAlphaReady = 0.55
        sansBoneDodgeBeats = 2
        sansBoneDodgeDamage = 1  

    elseif difficultyName == 'Hell' then
        cardIsEverAllowed = true
        cupheadCardAttackDamage = 0.75
        cupheadCardAlphaReady = 0.55
        sansBoneDodgeBeats = 2
        sansBoneDodgeDamage = 1  

    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if (curNotesLoaded == 2) then
        curNotesLoaded = 2
    elseif (curNotesLoaded < cupheadCardAlphaReady) then
        if (noteType == 'CupNote_Parry') then
            if (isSustainNote == false) then
                cardCurAlpha = cardCurAlpha  + 0.1
                curNotesLoaded = curNotesLoaded + 0.1
            else
                cardCurAlpha = cardCurAlpha  + 0.025
                curNotesLoaded = curNotesLoaded + 0.025
            end 
        else
            cardCurAlpha = cardCurAlpha  + 0.005
            curNotesLoaded = curNotesLoaded + 0.005
        end
    else
        cardCurAlpha = 1
        cardSplashAlpha = 1
        canAttackCard = true;
        curNotesLoaded = 2
        if (CardIsAllowedOnScreen == true) then
            playSound('cuphead_CardIsReady', 5)
        end
    end
end

function onUpdate()
    -- Cuphead deactivate cupheads card on OmegaSpace
    if cardIsEverAllowed == false then
        CardIsAllowedOnScreen = false
    end

    -- Function for the Card
    if (CardIsAllowedOnScreen == true) and (canAttackCard == true) and (keyJustPressed('space')) then
        addScore(2000);

        characterPlayAnim('boyfriend', 'attack', false);
        curHealth = getProperty('health');
        setProperty('health', curHealth + cupheadCardAttackDamage);
        triggerEvent('Add Camera Zoom', '0.1', '0');

        canAttackCard = false;
        cardCurAlpha = 0;
        curNotesLoaded = 0
        doTweenAlpha('AceOfHearts', 'AceOfHearts', cardCurAlpha , 0.25, 'linear');
        doTweenAlpha('FullAce', 'FullAce', cardCurAlpha , 0.25, 'linear');

        if not lowQuality then
            playSound('cuphead_CardAttack', 5)
        end
    end


    if (CardIsAllowedOnScreen == true) then 
        doTweenAlpha('AceOfHearts', 'AceOfHearts', cardCurAlpha, 0.01, 'linear');
        doTweenAlpha('FullAce', 'FullAce', cardSplashAlpha, 0.01, 'linear');
    end

    if (cardSplashAlpha > 0) then
        cardSplashAlpha = cardSplashAlpha - 0.035
    end

    -- Sans' bone attack
    if sansCanDoDodge == true and keyJustPressed('space') then
      addScore(1000);
        canAttackCard = sansDodgeSaveCard
		if not lowQuality then
			playSound('SansBoneDodge_Dodge', 0.7)
		end
		removeLuaSprite('SansEvent_Dodge', false)
		sansCanDoDodge = false
		sansMustDoDodge = false
	end
end

function onEvent(name, value1)
    if (name == '4Card') then
        if value1 == 'true' then
            CardIsAllowedOnScreen = true
            playSound('cuphead_CardIsReady', 5)
            cardSplashAlpha = 1
        else
            CardIsAllowedOnScreen = false
            doTweenAlpha('AceOfHearts', 'AceOfHearts', 0, 0.01, 'linear');
            doTweenAlpha('FullAce', 'FullAce', 0, 0.01, 'linear');
        end
    end

    if name == 'Sans_BoneDodge' then 
        -- Instead of everything being in the Sans_BoneDodge Event, this Code is now in this Script instead
        -- This allowes to dodge sans while keeping the card 
        -- Whoooo
        sansDodgeSaveCard = canAttackCard
        canAttackCard = false
		playSound('SansBoneDodge_Appear', 1)
		removeLuaSprite('SansEvent_Dodge_Hit', false)
		addLuaSprite('SansEvent_Dodge', true)
		sansBoneDodgeTime = sansBoneDodgeBeats
		sansCanDoDodge = true
		sansMustDoDodge = true
	end

end

function onBeatHit()
	if sansBoneDodgeTime == 0 and sansMustDoDodge == true then 
        addScore(-1000);
		if not lowQuality then
			playSound('SansBoneDodge_Miss', 1)
		end
        canAttackCard = sansDodgeSaveCard
		removeLuaSprite('SansEvent_Dodge', false)
		addLuaSprite('SansEvent_Dodge_Hit', true)
		sansCanDoDodge = false
		sansMustDoDodge = false
		health = getProperty('health')
		setProperty('health', health - sansBoneDodgeDamage)

	elseif sansBoneDodgeTime > 0 then
		if not lowQuality then
			playSound('SansBoneDodge_Damage', 0.5)
		end
		sansBoneDodgeTime = sansBoneDodgeTime - 1
	end
end