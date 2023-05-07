local MinMisses=5
local MissSelecter=false
local PracticeMode=false
local BalledGameOver=false
local Credits=false
function onCreate()
    addHaxeLibrary('Discord')
    --addHaxeLibrary('discord_rpc.DiscordRpc')
    --addHaxeLibrary('discord_rpc', 'DiscordRpc')
    addHaxeLibrary('DiscordRpc', 'discord_rpc')
    addLuaScript('data/CameraMove.lua')
    setGlobalFromScript('data/CameraMove','CamNoteMove',20)
    setGlobalFromScript('data/CameraMove','ForceCamPos',true)
    setGlobalFromScript('data/CameraMove','ManualPos',{750,500})
    addCharacterToList('black','dad')
    addCharacterToList('blackold','dad')
    addCharacterToList('bf-defeat-normal','boyfriend')
    addCharacterToList('bf-defeat-scared','boyfriend')
    addCharacterToList('bf','boyfriend')
    precacheSound('amongkill')

    makeAnimatedLuaSprite('DefeatBackv4','defeat')
    scaleObject('DefeatBackv4',1.5,1.5)
    addAnimationByPrefix('DefeatBackv4','Beat','defeat',24,false)
    screenCenter('DefeatBackv4','xy')
    addLuaSprite('DefeatBackv4')

    makeLuaSprite('DefeatBackDead','lol thing')
    scaleObject('DefeatBackDead',1.3,1.3)
    setScrollFactor('DefeatBackDead',0.8,0.8)
    screenCenter('DefeatBackDead','xy')
    setProperty('DefeatBackDead.x',getProperty('DefeatBackDead.x')-50)
    setProperty('DefeatBackDead.y',getProperty('DefeatBackDead.y')+200)
    addLuaSprite('DefeatBackDead')

    makeLuaSprite('DefeatBack','deadBG')
    scaleObject('DefeatBack',0.4,0.4)
    setScrollFactor('DefeatBack',0.85,0.85)
    screenCenter('DefeatBack','xy')
    setProperty('DefeatBack.x',getProperty('DefeatBack.x')+100)
    setProperty('DefeatBack.y',getProperty('DefeatBack.y')+300)
    addLuaSprite('DefeatBack')

    makeLuaSprite('DefeatBackOld','defeatfnf')
    scaleObject('DefeatBackOld',1.7,1.7)
    screenCenter('DefeatBackOld','xy')
    setProperty('DefeatBackOld.x',getProperty('DefeatBackOld.x')+100)
    setProperty('DefeatBackOld.y',getProperty('DefeatBackOld.y'))
    addLuaSprite('DefeatBackOld')
    setProperty('DefeatBackOld.visible',false)

    makeLuaSprite('Overlay','iluminao omaga')
    scaleObject('Overlay',1.5,1.5)
    screenCenter('Overlay','xy')
    addLuaSprite('Overlay',true)

    if not lowQuality then

        setBlendMode('Overlay','add')
        makeLuaSprite('OverlayDead','deadFG')
        scaleObject('OverlayDead',0.4,0.4)
        setScrollFactor('OverlayDead',1.1,1.1)
        screenCenter('OverlayDead','xy')
        setProperty('OverlayDead.y',getProperty('OverlayDead.y')+800)
        setProperty('OverlayDead.x',getProperty('OverlayDead.x')+150)
        addLuaSprite('OverlayDead',true)
    end
    --if getRandomBool(1) then
    --    BalledGameOver=true
    --    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-defeat-dead-balls')
    --    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'defeat_kill_ballz_sfx')
    --else
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead-defeat')
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'defeat_kill_sfx')
    --end
    --setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover_v4_LOOP')
    --setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover_v4_End')
    
    Text=getTextFromFile('data/'..'defeat'..'/info.txt')
end
function onSectionHit()
    playAnim('DefeatBackv4','Beat')
end
function onCreatePost()
    setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup')+1)
end
function onGameOver()
    removeLuaScript('data/CameraMove.lua')
end
function onCountdownStarted()
    for i=0,3 do
        setPropertyFromGroup('opponentStrums',i,'x',-200)
        setPropertyFromGroup('playerStrums',i,'x',-278+(160*0.7)*i+50+(screenWidth/2))
    end
end
function onEndSong()
    local Text=[[Try again
       (without Practice Mode)]]
    if PracticeMode then
        makeLuaText('TryAgain',Text,0)
        setTextSize('TryAgain',50)
        setTextColor('TryAgain','FFFFFF')
        screenCenter('TryAgain','xy')
        setObjectCamera('TryAgain','other')
        addLuaText('TryAgain')
        setProperty('TryAgain.alpha',0)
        doTweenAlpha('TryAgain','TryAgain',1,3,'linear')
        doTweenAlpha('IfPractice','BackS',1,3,'linear')
        return Function_Stop
    end
end
function onUpdate(elapsed)
    CustomEvent()
    if getProperty('boyfriend.curCharacter') =='bf-defeat-scared' then
        setProperty('DefeatBackDead.visible',true)
        setProperty('DefeatBack.visible',true)
        setProperty('OverlayDead.visible',true)
    else
        setProperty('DefeatBackDead.visible',false)
        setProperty('DefeatBack.visible',false)
        setProperty('OverlayDead.visible',false)
    end
    if getProperty('dad.curCharacter') =='blackold' then
        changePresence(nil, 'VS impostor', 'icon-defeat', false, nil, '-defeat')
        setTextColor('scoreTxt','FFFFFF')
        setProperty('DefeatBackv4.visible',false)
        setProperty('Overlay.visible',false)
        setProperty('iconP1.visible',false)
        setProperty('iconP2.visible',false)
        setProperty('DefeatBackOld.visible',true)
        SetScoreTxt('Old')
    else
        setTextColor('scoreTxt','E80000')
        setProperty('DefeatBackv4.visible',true)
        setProperty('Overlay.visible',true)
        setProperty('iconP1.visible',true)
        setProperty('iconP2.visible',true)
        setProperty('DefeatBackOld.visible',false)
        SetScoreTxt()
    end
end
function GetRating()
    
    if ratingFC~='' then
        return '('..tostring(toInt(rating*10000)/100)..'%) - '..ratingFC
    else
        return '?'
    end
end
function toInt(float) 
    if float<=math.floor(float)+0.5 then
        return math.floor(float)
    else
        return math.ceil(float)
    end
 end
function Set(tag,X,Y)
    if X~=nil then
        setProperty(tag..'.x',X)
    end
    if Y~=nil then
        setProperty(tag..'.y',Y)
    end
 end
function CustomEvent()
    if curBeat == 16 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 32 then
        setProperty('defaultCamZoom',0.7)
    end
    if curBeat == 48 then
        setProperty('defaultCamZoom',0.8)
    end
    if curBeat == 68 then
        setProperty('defaultCamZoom',0.5)
    end
    if curBeat == 100 then
        setProperty('defaultCamZoom',0.6)
        setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,500},bf={900,500}})
        setGlobalFromScript('data/CameraMove','ForceCamPos',false)
    end
    if curBeat == 164 then
        setProperty('defaultCamZoom',0.5)
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
        setGlobalFromScript('data/CameraMove','ManualPos',{750,500})
    end
    if curBeat == 194 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 196 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 212 then
        setProperty('defaultCamZoom',0.7)
    end
    if curBeat == 228 then
        setProperty('defaultCamZoom',0.8)
    end
    if curBeat == 244 then
        setProperty('defaultCamZoom',0.85)
    end
    if curBeat == 260 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 292 then
        setProperty('defaultCamZoom',0.75)
    end
    if curBeat == 360 then
        setProperty('defaultCamZoom',0.6)
        setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,500},bf={900,500}})
        setGlobalFromScript('data/CameraMove','ForceCamPos',false)
        
    end
    if curBeat == 424 then
        setProperty('defaultCamZoom',0.7)
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
        setGlobalFromScript('data/CameraMove','ManualPos',{750,500})
    end
    if curBeat == 456 then
        setProperty('defaultCamZoom',0.8)
    end
    if curBeat == 472 then
        setProperty('defaultCamZoom',0.9)
    end
    if curBeat == 482 then
        setProperty('defaultCamZoom',0.7)
    end
    if curBeat == 756 then
        setProperty('defaultCamZoom',50)
    end
end
function onStartCountdown()
    runTimer('transDelay',1)
    return Function_Continue
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='transDelay' then
        setProperty('BackS.alpha',0)
        startCountdown()
    end
    if tag=='Reset' then
        restartSong()
    end
end
function onTweenCompleted(tag)
    if tag=='IfPractice' then
        runTimer('Reset',1.5)
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end