chars = {
    ['blush_max'] = true,
}
--name of the chars that will have win icons
playable = {
    ['blush_max'] = true,
}
opI = false
opP = true
--if the char would be used by the player
--so you would do like
--[[
    chars = {
        ['char1'] = true,
        ['char2'] = true,
    }
    playable = {
        ['char1'] = true,
        ['char2'] = false,
    }
]]
function onUpdate()
    if chars[dadName] and not opI then
        opI = true
        makeLuaSprite('winIconDad', 'icons/'..dadName..'-win', 0, 0)
        setProperty('winIconDad.visible', false)
        setObjectCamera('winIconDad', 'camHUD')
        addLuaSprite('winIconDad')
    end
    if not chars[dadName] and opI then
        opI = false
        removeLuaSprite('winIconDad')
    end
    if chars[boyfriendName] and not opP then
        opP = true
        makeLuaSprite('winIconBf', 'icons/icon-max-win', 0, 0)
        setProperty('winIconBf.visible', false)
        setObjectCamera('winIconBf', 'camHUD')
    	setProperty('winIconBf.flipX', true)
        addLuaSprite('winIconBf')
    end
    if not chars[boyfriendName] and opP then
        opP = false
        removeLuaSprite('winIconBf')
    end
    --win icons should be in mods/images/icons, and be separate from the normal icon sheet
    --it should be named dadName-win
    if getHp() > 80 then
        if opP then
            setProperty('winIconBf.visible', true)
            setProperty('iconP1.visible', false)
            syncObjs('winIconBf', 'iconP1')
        end
    else
        setProperty('winIconBf.visible', false)
        setProperty('iconP1.visible', true)
    end
    if getHp() < 20 then
        if opI then
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