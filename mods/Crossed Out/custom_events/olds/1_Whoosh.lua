function onCreate()
  
    if not lowQuality then
        makeLuaSprite('WhooshWhite', 'WhooshWhite', 0, 0);
        setObjectCamera('WhooshWhite', 'camHUD');
        precacheImage('WhooshWhite')
        
        makeAnimatedLuaSprite('BendyStage_Transition','BendyStage_Transition', -550, -450)
        scaleObject('BendyStage_Transition', 2, 2);
        setObjectCamera('BendyStage_Transition', 'camHUD')
        addAnimationByPrefix('BendyStage_Transition','beb instance ','beb instance ', 24, false)
        precacheImage('BendyStage3_Back')
    end

    -- This is for Bendy's Ink notes,
    -- Why? you may aks?
    -- Well this Event is loaded and (for some reason) if I put this into the Note.lua thing, the note doesn't load soo....
    makeLuaSprite('InkSplash_Ink','InkSplash_Ink', 0, 0)
	setObjectCamera('InkSplash_Ink', 'other');
	doTweenAlpha('InkSplash_Ink', 'InkSplash_Ink', 0, 0.01, 'linear');
	addLuaSprite('InkSplash_Ink', true)

end

function onEvent(name, value1, value2)
	if name == '1_Whoosh' then
        if value1 == '1' then
            addLuaSprite('WhooshWhite', true);
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 0.8, 'linear');

        elseif value1 == '2' then
            addLuaSprite('WhooshWhite', true);
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 1, 'linear');

        elseif value1 == '3' then
            addLuaSprite('WhooshWhite', true);
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 2, 'linear');

        elseif value1 == 'Dark' then
            addLuaSprite('BendyStage_Transition', false)
            objectPlayAnimation('BendyStage_Transition','beb instance ', true)

        elseif value1 == 'Dark2' then
            objectPlayAnimation('BendyStage_Transition','beb instance ', true)

        elseif value1 == 'DarkRemove' then
            removeLuaSprite('BendyStage_Transition', true)

        end
    end
end

function onTweenCompleted(tag)
    if tag == 'WhooshWhite' then
        removeLuaSprite('WhooshWhite', false);
        doTweenAlpha('WhooshWhite', 'WhooshWhite', 1, 0.001, 'linear');
    end
end