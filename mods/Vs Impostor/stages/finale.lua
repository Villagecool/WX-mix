function onCreate()
	addLuaScript('data/CameraMove.lua')
    setGlobalFromScript('data/CameraMove','CamNoteMove',20)
    setGlobalFromScript('data/CameraMove','CharcterMove',{dad=80,bf=0})
    setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,600},bf={700,700}})
    setGlobalFromScript('data/CameraMove','CharacterForce',true)
    addLuaScript('data/GhostAnim.lua')

    addCharacterToList('pinkparasite','dad')


    makeLuaSprite('Overlay','iluminao omaga',-550, 250)
    addLuaSprite('Overlay',true)

    makeLuaSprite('Bars','bars',0,0)
    setObjectCamera('Bars','hud')
    addLuaSprite('Bars')

    if not lowQuality then
        setBlendMode('Overlay','add')
    end
    
	makeLuaSprite('bgg', 'finale/bgg', -900, -400);
	setScrollFactor('bgg', 0.8, 0.8);
	makeLuaSprite('dead', 'finale/dead', 500, -270);
	setScrollFactor('dead', 0.8, 0.8);
	makeLuaSprite('bg', 'finale/bg', -1090, -530);
	setScrollFactor('bg', 1, 1);
	makeLuaSprite('splat', 'finale/splat', 70, 1200);
	makeLuaSprite('fore', 'finale/fore', -1050, -160);
    setScrollFactor('fore', 1.1, 1.1);
  
	makeLuaSprite('dark', 'finale/dark', -1020, -350);
	setScrollFactor('dark', 1.05, 1.05);

	makeLuaSprite('lamp', 'finale/lamp', 990, -380);

	makeAnimatedLuaSprite('light', 'finale/light', -530, -100);
	setScrollFactor('light', 1.05, 1.05);
  addAnimationByPrefix('light','light','light',24,true);
  if not lowQuality then
	setBlendMode('light','add')
	setBlendMode('dark','multiply')
  end



	scaleObject('bgg', 1.1, 1.1)
	scaleObject('dead', 1.1, 1.1)
	scaleObject('bg', 1.1, 1.1)
	scaleObject('lamp', 1.1, 1.1)
	scaleObject('fore', 1.1, 1.1)
    scaleObject('splat', 1.1, 1.1)
    scaleObject('dark', 1.1, 1.1)
	scaleObject('light', 1.1, 1.1)
    if downscroll then
        makeLuaSprite('HealthBarBG','healthBarfinaleBlue',0,-47)
        setProperty('HealthBarBG.flipY',true)
    else
        makeLuaSprite('HealthBarBG','healthBarfinaleBlue',0,530)
    end
    
    setObjectCamera('HealthBarBG','hud')
    scaleObject('HealthBarBG',0.6,0.6)
    screenCenter('HealthBarBG','x')
    addLuaSprite('HealthBarBG')
    makeLuaSprite('HealthBarRed',nil,0,getProperty('HealthBarBG.y'))
    screenCenter('HealthBarRed','x')
    setObjectCamera('HealthBarRed','hud')
    scaleObject('HealthBarRed',0.6,0.6)
    screenCenter('HealthBarRed','x')
    addLuaSprite('HealthBarRed')
    setProperty('HealthBarRed.flipY',getProperty('HealthBarBG.flipY'))
    if downscroll then
    makeAnimatedLuaSprite('iconPAUGHA','icons/icon-blackfinale',getProperty('HealthBarBG.x')-200,getProperty('HealthBarBG.y')-100)
    else
        makeAnimatedLuaSprite('iconPAUGHA','icons/icon-blackfinale',getProperty('HealthBarBG.x')-200,getProperty('HealthBarBG.y')-150)
    end
    addAnimationByPrefix('iconPAUGHA','1','black icon mad',24,true)
    addAnimationByPrefix('iconPAUGHA','0','black icon calm',24,true)
    addOffset('iconPAUGHA','1',0,0)
    addOffset('iconPAUGHA','0',0,-20)

    setObjectCamera('iconPAUGHA','hud')
    addLuaSprite('iconPAUGHA')
    setProperty('HealthBarBG.visible',false)
    setProperty('camHUD.alpha',0)

    Text=getTextFromFile('data/'..songPath..'/info.txt')
end
function onBeatHit()
    if curBeat % 4 == 0 then
	playAnim('light','light',true)
	end
end
function onUpdate(elapsed)
    if getSongPosition() >= 0 and getSongPosition() < 9600 then
        setProperty('camGame.zoom',Lerp(getProperty('camGame.zoom'), 1,boundTo(elapsed * 0.01, 0, 1)))
    end
end
function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
 end
local Credits=false
function onUpdatePost()
    setProperty('healthBar.alpha',0)
    setProperty('Health.alpha',0)
    setProperty('iconP2.visible',false)
    setProperty('iconP1.x',getProperty('HealthBarBG.x')+637)
    if downscroll then
        setProperty('iconP1.y',getProperty('HealthBarBG.y')+65)
    else
        setProperty('iconP1.y',getProperty('HealthBarBG.y')+35)
    end
    for i=0,3 do
        setPropertyFromGroup('strumLineNotes',i,'alpha',0)
    end
    playAnim('iconPAUGHA',getProperty('iconP2.animation.curAnim.curFrame'))
    setProperty('iconPAUGHA.visible',getProperty('HealthBarBG.visible'))
    setProperty('iconP1.visible',getProperty('HealthBarBG.visible'))

    if getProperty('HealthBarBG.visible') then
        loadGraphic('HealthBarRed','healthBarfinaleRed',1407*(1-(getHealth()/2)),437)
        setProperty('HealthBarRed.x',getProperty('HealthBarBG.x'))
        setProperty('HealthBarRed.y',getProperty('HealthBarBG.y'))
        setProperty('HealthBarRed.offset.x',280)
        setProperty('HealthBarRed.offset.y',87)
        setProperty('HealthBarRed.origin.x',getProperty('HealthBarBG.origin.x'))
        setProperty('HealthBarRed.origin.y',getProperty('HealthBarBG.origin.y'))
       
        if getHealth()>=2 then
            setProperty('HealthBarRed.visible',false)
        else
            setProperty('HealthBarRed.visible',true)
        end
    else
        setProperty('HealthBarRed.visible',false)
    end

    if curBeat == 32 then
        setProperty('defaultCamZoom',0.8)
    end

    if curBeat < 32 then --start
        setGlobalFromScript('data/CameraMove','ManualPos',{ 750, 800})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
    end

    if curBeat >= 32 and curBeat < 48 then
        setGlobalFromScript('data/CameraMove','ManualPos',{450, 1000})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
    end
    if curBeat >= 48 and curBeat < 64 then --to bf
        setGlobalFromScript('data/CameraMove','ManualPos',{1250, 1000})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
    end
    if curBeat >= 64 and curBeat < 68 then --bf zoom in
        triggerEvent('Camera Follow Pos', 1400, 1050)
        setGlobalFromScript('data/CameraMove','ManualPos',{1400, 1050})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
        setProperty('defaultCamZoom',1.2)
    end
    if curBeat == 67 then
        setProperty('defaultCamZoom',2.4)
    end
    if mustHitSection and curBeat >= 68 then
        setProperty('defaultCamZoom',0.5)
        setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,600},bf={700,700}})
        setGlobalFromScript('data/CameraMove','CharacterForce',true)
        setGlobalFromScript('data/CameraMove','ForceCamPos',false)
    elseif curBeat >= 68 then
        setProperty('defaultCamZoom',0.4)
        setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,600},bf={700,700}})
        setGlobalFromScript('data/CameraMove','CharacterForce',true)
        setGlobalFromScript('data/CameraMove','ForceCamPos',false)
    end
    if curBeat == 492 then
        doTweenZoom('defeated', 'camGame', 2.4, 1.2, 'circIn')
    end
    if curBeat >= 5 then
        if getProperty('CreditsBG.x')>-0.9 then
            Credits=true
        end
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end