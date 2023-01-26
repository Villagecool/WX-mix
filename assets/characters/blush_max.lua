
function onCreatePost()
    makeLuaSprite('winIconBfMaxBlush', 'icons/icon-max-win', 0, 0)
    setProperty('winIconBfMaxBlush.visible', false)
    setObjectCamera('winIconBfMaxBlush', 'camHUD')
    setProperty('winIconBfMaxBlush.flipX', true)
    addLuaSprite('winIconBfMaxBlush', true)
    
    makeLuaSprite('winIconDadMaxBlush', 'icons/icon-max-win', 0, 0)
    setProperty('winIconDadMaxBlush.visible', false)
    setObjectCamera('winIconDadMaxBlush', 'camHUD')
    setProperty('winIconDadMaxBlush.flipX', true)
    addLuaSprite('winIconDadMaxBlush', true)
end
function onUpdate()
    --win icons should be in mods/images/icons, and be separate from the normal icon sheet
    --it should be named dadMaxName-win
    if getHp() > 80 then
        if getProperty("boyfriend.curCharacter") == 'blush_max' then
            setProperty('winIconBfMaxBlush.visible', true)
            setProperty('iconP1.visible', false)
            setProperty('iconP1.alpha', 0)
            syncObjs('winIconBfMaxBlush', 'iconP1')
        else
            setProperty('winIconBfMaxBlush.visible', false)
        end
    else
        setProperty('winIconBfMaxBlush.visible', false)
        setProperty('iconP1.visible', true)
        setProperty('iconP1.alpha', 1)
    end
    if getHp() < 20 then
        if getProperty("dad.curCharacter") == 'blush_max' then
            setProperty('winIconDadMaxBlush.visible', true)
            setProperty('iconP2.visible', false)
            setProperty('iconP2.alpha', 0)
            syncObjs('winIconDadMaxBlush', 'iconP2')
        else
            setProperty('winIconBfMaxBlush.visible', false)
        end
    else
        setProperty('winIconDadMaxBlush.visible', false)
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