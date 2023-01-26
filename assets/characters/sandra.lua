
function onCreatePost()
    makeLuaSprite('winIconSandraBf', 'icons/icon-sandra-win', 0, 0)
    setProperty('winIconSandraBf.visible', false)
    setObjectCamera('winIconSandraBf', 'camHUD')
    setProperty('winIconSandraBf.flipX', true)
    addLuaSprite('winIconSandraBf', true)
    
    makeLuaSprite('winIconSandraDad', 'icons/icon-sandra-win', 0, 0)
    setProperty('winIconSandraDad.visible', false)
    setObjectCamera('winIconSandraDad', 'camHUD')
    setProperty('winIconSandraDad.flipX', false)
    addLuaSprite('winIconSandraDad', true)
end
function onUpdate()
    --win icons should be in mods/images/icons, and be separate from the normal icon sheet
    --it should be named dadName-win
    if getHp() > 80 then
        if getProperty("boyfriend.curCharacter") == 'sandra' then
            setProperty('winIconSandraBf.visible', true)
            setProperty('iconP1.visible', false)
            setProperty('iconP1.alpha', 0)
            syncObjs('winIconSandraBf', 'iconP1')
        else
            setProperty('winIconSandraBf.visible', false)
        end
    else
        setProperty('winIconSandraBf.visible', false)
        setProperty('iconP1.visible', true)
        setProperty('iconP1.alpha', 1)
    end
    if getHp() < 20 then
        if getProperty("dad.curCharacter") == 'sandra' then
            setProperty('winIconSandraDad.visible', true)
            setProperty('iconP2.visible', false)
            setProperty('iconP2.alpha', 0)
            syncObjs('winIconSandraDad', 'iconP2')
        else
            setProperty('winIconSandraDad.visible', false)
        end
    else
        setProperty('winIconSandraDad.visible', false)
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