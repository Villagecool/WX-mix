
function onCreatePost()
    makeLuaSprite('winIconBfMaxSad', 'icons/icon-max-sad-win', 0, 0)
    setProperty('winIconBfMaxSad.visible', false)
    setObjectCamera('winIconBfMaxSad', 'camHUD')
    setProperty('winIconBfMaxSad.flipX', true)
    addLuaSprite('winIconBfMaxSad', true)
    
    makeLuaSprite('winIconDadMaxSad', 'icons/icon-max-sad-win', 0, 0)
    setProperty('winIconDadMaxSad.visible', false)
    setObjectCamera('winIconDadMaxSad', 'camHUD')
    setProperty('winIconDadMaxSad.flipX', true)
    addLuaSprite('winIconDadMaxSad', true)
end
function onUpdate()
    --win icons should be in mods/images/icons, and be separate from the normal icon sheet
    --it should be named dadMaxName-win
    if getHp() > 80 then
        if getProperty("boyfriend.curCharacter") == 'depression_max' then
            setProperty('winIconBfMaxSad.visible', true)
            setProperty('iconP1.visible', false)
            setProperty('iconP1.alpha', 0)
            syncObjs('winIconBfMaxSad', 'iconP1')
        else
            setProperty('winIconBfMaxSad.visible', false)
        end
    else
        setProperty('winIconBfMaxSad.visible', false)
        setProperty('iconP1.visible', true)
        setProperty('iconP1.alpha', 1)
    end
    if getHp() < 20 then
        if getProperty("dad.curCharacter") == 'depression_max' then
            setProperty('winIconDadMaxSad.visible', true)
            setProperty('iconP2.visible', false)
            setProperty('iconP2.alpha', 0)
            syncObjs('winIconDadMaxSad', 'iconP2')
        else
            setProperty('winIconBfMaxSad.visible', false)
        end
    else
        setProperty('winIconDadMaxSad.visible', false)
        setProperty('iconP2.visible', true)
        setProperty('iconP2.alpha', 1)
    end
end
function getHp()
    return (getProperty('health') / 2) * 100
end
function syncObjs(getter, setter)
    setProperty(getter..'.x', getProperty(setter..'.x'))
    setProperty(getter..'.y', getProperty(setter..'.y'))
    setProperty(getter..'.scale.x', getProperty(setter..'.scale.x'))
    setProperty(getter..'.scale.y', getProperty(setter..'.scale.y'))
    setProperty(getter..'.angle', getProperty(setter..'.angle'))
    setObjectOrder(getter, getObjectOrder(setter)+1)
end