
function onCreatePost()
    makeLuaSprite('winIconBfMaxHappi', 'icons/icon-max-win', 0, 0)
    setProperty('winIconBfMaxHappi.visible', false)
    setObjectCamera('winIconBfMaxHappi', 'camHUD')
    setProperty('winIconBfMaxHappi.flipX', true)
    addLuaSprite('winIconBfMaxHappi', true)
    
    makeLuaSprite('winIconDadMaxHappi', 'icons/icon-max-win', 0, 0)
    setProperty('winIconDadMaxHappi.visible', false)
    setObjectCamera('winIconDadMaxHappi', 'camHUD')
    setProperty('winIconDadMaxHappi.flipX', false)
    addLuaSprite('winIconDadMaxHappi', true)
end
function onUpdate()
    --win icons should be in mods/images/icons, and be separate from the normal icon sheet
    --it should be named dadName-win
        if getProperty("boyfriend.curCharacter") == 'happy_max' then
            setProperty('winIconBfMaxHappi.visible', true)
            setProperty('iconP1.visible', false)
            setProperty('iconP1.alpha', 0)
            syncObjs('winIconBfMaxHappi', 'iconP1')
    else
        setProperty('winIconBfMaxHappi.visible', false)
        setProperty('iconP1.visible', true)
        setProperty('iconP1.alpha', 1)
    end
        if getProperty("dad.curCharacter") == 'happy_max' then
            setProperty('winIconDadMaxHappi.visible', true)
            setProperty('iconP2.visible', false)
            setProperty('iconP2.alpha', 0)
            syncObjs('winIconDadMaxHappi', 'iconP2')
    else
        setProperty('winIconDadMaxHappi.visible', false)
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