curTutorialImages = 0
totTutorialImages = 0

function onCreate()
	makeAnimatedLuaSprite('Tutorial_Bendy_Char','Tutorial_Bendy_Char', -50, 50)
	addAnimationByPrefix('Tutorial_Bendy_Char','Tutorial Bendy Idle Instance','Tutorial Bendy Idle Instance',24, true)
	setObjectCamera('Tutorial_Bendy_Char', 'camHUD');
    scaleObject('Tutorial_Bendy_Char', 1.5, 1.5);

	makeAnimatedLuaSprite('Tutorial_Cuphead_Char','Tutorial_Cuphead_Char', -0, 160)
	addAnimationByPrefix('Tutorial_Cuphead_Char','Tutorial Cuphead Idle Instance','Tutorial Cuphead Idle Instance',24, true)
	setObjectCamera('Tutorial_Cuphead_Char', 'camHUD');
    scaleObject('Tutorial_Cuphead_Char', 2, 2);

    makeAnimatedLuaSprite('Tutorial_Sans1_Char','Tutorial_Sans1_Char', 50, 140)
	addAnimationByPrefix('Tutorial_Sans1_Char','Tutorial Sans Idle Instance','Tutorial Sans Idle Instance',24, true)
	setObjectCamera('Tutorial_Sans1_Char', 'camHUD');
    scaleObject('Tutorial_Sans1_Char', 1, 1);

    makeAnimatedLuaSprite('Tutorial_Sans2_Char','Tutorial_Sans2_Char', 50, 140)
	addAnimationByPrefix('Tutorial_Sans2_Char','Tutorial Sans2 Idle Instance','Tutorial Sans2 Idle Instance',24, true)
	setObjectCamera('Tutorial_Sans2_Char', 'camHUD');
    scaleObject('Tutorial_Sans2_Char', 1, 1);

    makeAnimatedLuaSprite('Tutorial_PotatoPc_Char','Tutorial_PotatoPc_Char', 80, 160)
	addAnimationByPrefix('Tutorial_PotatoPc_Char','BF idle dance','BF idle dance',24, true)
	setObjectCamera('Tutorial_PotatoPc_Char', 'camHUD');
    scaleObject('Tutorial_PotatoPc_Char', 1.3, 1.3);
    setProperty('Tutorial_PotatoPc_Char.flipX', true);

    makeAnimatedLuaSprite('Tutorial_Achievements_Char','SansStage3_Papyrus', -20, 110)
	addAnimationByPrefix('Tutorial_Achievements_Char','Even more Mad instance ','Even more Mad instance ',24, true)
	setObjectCamera('Tutorial_Achievements_Char', 'camHUD');
    scaleObject('Tutorial_Achievements_Char', 1.5, 1.5);


    makeLuaSprite('Tutorial_CupHead','Tutorial_CupHead', -0, -0)
    setObjectCamera('Tutorial_CupHead', 'camHUD')
    scaleObject('Tutorial_CupHead', 0.67, 0.67);

    makeLuaSprite('Tutorial_Sans','Tutorial_Sans', -0, -0)
    setObjectCamera('Tutorial_Sans', 'camHUD')
    scaleObject('Tutorial_Sans', 0.67, 0.67);

    makeLuaSprite('Tutorial_SansAttack','Tutorial_SansAttack', -0, -0)
    setObjectCamera('Tutorial_SansAttack', 'camHUD')

    makeLuaSprite('Tutorial_Bendy','Tutorial_Bendy', -0, -0)
    setObjectCamera('Tutorial_Bendy', 'camHUD')
    scaleObject('Tutorial_Bendy', 0.67, 0.67);

    makeLuaSprite('Tutorial_Achievements','Tutorial_Ghost', -0, -0)
    setObjectCamera('Tutorial_Achievements', 'camHUD')

    makeLuaSprite('Tutorial_PotatoPc','Tutorial_PotatoPc', -0, -0)
    setObjectCamera('Tutorial_PotatoPc', 'camHUD')

    makeLuaSprite('Tutorial_Difficult','Tutorial_Difficult', -0, -0)
    setObjectCamera('Tutorial_Difficult', 'camHUD')

    makeLuaSprite('Tutorial_EasySans','Tutorial_EasySans', -0, -0)
    setObjectCamera('Tutorial_EasySans', 'camHUD')
    scaleObject('Tutorial_EasySans', 0.67, 0.67);

    makeLuaSprite('Tutorial_SkillIssue','Tutorial_SkillIssue', -0, -0)
    setObjectCamera('Tutorial_SkillIssue', 'camHUD')

    makeLuaSprite('Tutorial_SkillIssueText','Tutorial_SkillIssueText', 200, 400)
    setObjectCamera('Tutorial_SkillIssueText', 'other')

    makeLuaSprite('Tutorial_secret_bg','Tutorial_secret_bg', 60, 130)
    scaleObject('Tutorial_secret_bg', 0.8, 0.8);
    setObjectCamera('Tutorial_secret_bg', 'camHUD')

    makeLuaSprite('Tutorial_Background','Tutorial_Background', 0, 0)
    setObjectCamera('Tutorial_Background', 'camHUD')

    makeLuaSprite('Tutorial_Background_500','Tutorial_Background_500', 0, 0)
    setObjectCamera('Tutorial_Background_500', 'other')

    makeAnimatedLuaSprite('Tutorial_static','Tutorial_static', 0, 0)
	addAnimationByPrefix('Tutorial_static','static','static',24, false)
    objectPlayAnimation('Tutorial_static', 'static', true)
	setObjectCamera('Tutorial_static', 'other');
    scaleObject('Tutorial_static', 1.2, 1.2);
    doTweenAlpha('Tutorial_static', 'Tutorial_static', 0, 0.01, 'linear')
    addLuaSprite('Tutorial_static', true);

end


function onUpdate()
    doTweenAlpha('Tutorial_static', 'Tutorial_static', 1, 0.01, 'linear')

    if keyJustPressed('space') then
        objectPlayAnimation('Tutorial_static', 'static', true)

        if curTutorialImages == 10 then
            curTutorialImages = 0
            removeLuaSprite('Tutorial_SkillIssue', false);
            removeLuaSprite('Tutorial_SkillIssueText', false);  
            playSound('tutorialScreenEnd', 1)
        else
            curTutorialImages = curTutorialImages + 1
            playSound('tutorialScreenSwitch', 1)
        end
        totTutorialImages = totTutorialImages + 1
    end

    if curTutorialImages == 1 then
        addLuaSprite('Tutorial_CupHead', true);  
        addLuaSprite('Tutorial_Cuphead_Char', true);

    elseif  curTutorialImages == 2 then   
        addLuaSprite('Tutorial_Sans', true);
        addLuaSprite('Tutorial_Sans1_Char', true);
        removeLuaSprite('Tutorial_CupHead', false); 
        removeLuaSprite('Tutorial_Cuphead_Char', false); 

    elseif  curTutorialImages == 3 then
        addLuaSprite('Tutorial_EasySans', true);
        addLuaSprite('Tutorial_SansAttack', true);
        addLuaSprite('Tutorial_Sans2_Char', true);
        removeLuaSprite('Tutorial_Sans', false);
        removeLuaSprite('Tutorial_Sans1_Char', false);

    elseif  curTutorialImages == 4 then
        removeLuaSprite('Tutorial_SansAttack', false);


    elseif  curTutorialImages == 5 then
        addLuaSprite('Tutorial_Bendy', true);
        addLuaSprite('Tutorial_Bendy_Char', true);
        removeLuaSprite('Tutorial_EasySans', false);
        removeLuaSprite('Tutorial_Sans2_Char', false);  

    elseif  curTutorialImages == 6 then
        addLuaSprite('Tutorial_Achievements', true);
        addLuaSprite('Tutorial_Achievements_Char', true);
        removeLuaSprite('Tutorial_Bendy', false);
        removeLuaSprite('Tutorial_Bendy_Char', false);  

    elseif  curTutorialImages == 7 then
        addLuaSprite('Tutorial_PotatoPc', true);
        addLuaSprite('Tutorial_PotatoPc_Char', true);
        removeLuaSprite('Tutorial_Achievements', false);
        removeLuaSprite('Tutorial_Achievements_Char', false);  

    elseif  curTutorialImages == 8 then
        addLuaSprite('Tutorial_Difficult', true);
        removeLuaSprite('Tutorial_PotatoPc', false);
        removeLuaSprite('Tutorial_PotatoPc_Char', false);
        
        cameraShake('camHUD', 0.001, 0.05)  

    elseif  curTutorialImages == 9 then
        addLuaSprite('Tutorial_SkillIssue', true);
        addLuaSprite('Tutorial_SkillIssueText', false);
        removeLuaSprite('Tutorial_Difficult', false);

        cameraShake('camHUD', 0.0025, 0.05)
        cameraShake('other', 0.005, 0.05)

    elseif  curTutorialImages == 10 then
        addLuaSprite('Tutorial_Background', true);

        removeLuaSprite('Tutorial_SkillIssue', false);
        removeLuaSprite('Tutorial_SkillIssueText', false);

        curTutorialImages = 0  
        playSound('tutorialScreenEnd', 1)

    end     

    if totTutorialImages == 100 then
        addLuaSprite('Tutorial_secret_bg', true);
    elseif totTutorialImages == 500 then
        addLuaSprite('Tutorial_Background_500', true);
    end
end
