
function onCreatePost()
    makeLuaSprite('winIconBf', 'icons/icon-max-win', 0, 0)
    setProperty('winIconBf.visible', false)
    setObjectCamera('winIconBf', 'camHUD')
    setProperty('winIconBf.flipX', true)
    addLuaSprite('winIconBf', true)
    
    makeLuaSprite('winIconDad', 'icons/icon-max-win', 0, 0)
    setProperty('winIconDad.visible', false)
    setObjectCamera('winIconDad', 'camHUD')
    setProperty('winIconDad.flipX', true)
    addLuaSprite('winIconDad', true)
end
function onUpdate()
    --win icons should be in mods/images/icons, and be separate from the normal icon sheet
    --it should be named dadName-win
    if getHp() > 80 then
        if getProperty("boyfriend.curCharacter") == 'blush_max' then
            setProperty('winIconBf.visible', true)
            setProperty('iconP1.visible', false)
            syncObjs('winIconBf', 'iconP1')
        end
    else
        setProperty('winIconBf.visible', false)
        setProperty('iconP1.visible', true)
    end
    if getHp() < 20 then
        if getProperty("dad.curCharacter") == 'blush_max' then
            setProperty('winIconDad.visible', true)
            setProperty('iconP2.visible', false)
            syncObjs('winIconDad', 'iconP2')
        end
    else
        setProperty('winIconDad.visible', false)
        setProperty('iconP2.visible', true)
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
    setObjectOrder(getter, getObjectOrder(setter))
end