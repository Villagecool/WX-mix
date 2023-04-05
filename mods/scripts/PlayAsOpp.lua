check = true
move = true
invis = false

function onCreatePost()
    if difficulty == 1 then
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noAnimation') == true then
            setPropertyFromGroup('unspawnNotes', i, 'animSuffix', 'therenoanimation')
        end
    end
    -- Healthbar stuff
    setProperty('healthBar.flipX', true)
end
end

shouldAnimation = false

--function onCountdownTick(c)
    -- Swap Note X
--    if c == 0 then
--        if not middlescroll then
--            for i = 0, 3 do
--                j = (i + 4)

--                noteTweenX('note'..i..'TwnX', i, getPropertyFromGroup('strumLineNotes', j, 'x'), 0.001, 'quadInOut');
--                noteTweenX('note'..j..'TwnX', j, getPropertyFromGroup('strumLineNotes', i, 'x'), 0.001, 'quadInOut');
--                move = false
--            end
--        end
--    end
--end

--function onSongStart() -- Swaps them if the song skips countdown
--    if not middlescroll then
--        for i = 0, 3 do
--            if move then
--                j = (i + 4)

--                noteTweenX('note'..i..'TwnX', i, getPropertyFromGroup('strumLineNotes', j, 'x'), 0.001, 'quadInOut');
--                noteTweenX('note'..j..'TwnX', j, getPropertyFromGroup('strumLineNotes', i, 'x'), 0.001, 'quadInOut');
--            end
--        end
--    end
--end

function onSpawnNote(id, d, noteType)
    if difficulty == 1 then
    noteType = getPropertyFromGroup('notes', id, 'noteType')
    check = true -- To make sure player notes don't go on your side

    setPropertyFromGroup('unspawnNotes', id, 'noMissAnimation', true);
    setPropertyFromGroup('unspawnNotes', id, 'noAnimation', true)
    if getPropertyFromGroup('notes', id,'mustPress') == true then
        setPropertyFromGroup('notes', id,'mustPress', false)
        check = false
    elseif getPropertyFromGroup('notes', id,'mustPress') == false and check then
        setPropertyFromGroup('notes', id,'mustPress', true)
    end
    end
end

-- Animations

function goodNoteHit(id, noteData, noteType)
    if difficulty == 1 then
    local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
    local Player = 'dad'
    local PlayThis = getProperty('singAnimations')[noteData + 1]
    if getPropertyFromGroup('notes', id, 'gfNote') then
        Player = 'gf'
        setProperty('gf.holdTimer', 0)
    else
        setProperty('dad.holdTimer', 0)
    end
    if altAnim then
        animSuffix = '-alt'
    end

    if noteType == 'Hey!' then
        PlayThis = 'hey'
    end

    playAnim(Player, PlayThis..animSuffix, true)
end
end

function noteMiss(id, noteData, noteType)
    if difficulty == 1 then
    local animSuffix = 'miss'
    local Player = 'dad'
    local PlayThis = getProperty('singAnimations')[noteData + 1]
    if getPropertyFromGroup('notes', id, 'gfNote') then
        Player = 'gf'
    end

    if noteType == 'Hurt Note' then
        PlayThis = 'hurt'
    end

    setProperty(Player..'holdTimer', 0)

    playAnim(Player, PlayThis..animSuffix, true)
end
end

function opponentNoteHit(id, noteData, noteType)
    if difficulty == 1 then
        setProperty('health', getProperty('health')-0.023)
    local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
    local Player = 'boyfriend'
    local PlayThis = getProperty('singAnimations')[noteData + 1]
    if getPropertyFromGroup('notes', id, 'gfNote') then
        Player = 'gf'
        setProperty('gf.holdTimer', 0)
    else
        setProperty('boyfriend.holdTimer', 0)
    end
    if altAnim then
        animSuffix = '-alt'
    end

    if noteType == 'Hey!' then
        PlayThis = 'hey'
    end

    playAnim(Player, PlayThis..animSuffix, true)
end
end

-- icons and healthbar
function rgbToHex(rgb)
    return string.format('%02x%02x%02x', math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end

function onUpdate()
    if difficulty == 1 then
    if invis then
        setProperty('boyfriend.visible', false)
    end
    health = getProperty('health')
end
end

function onUpdatePost()
    if difficulty == 1 then
    bfcolor = rgbToHex({getProperty('boyfriend.healthColorArray[0]'),getProperty('boyfriend.healthColorArray[1]'),getProperty('boyfriend.healthColorArray[2]')})
    dadcolor = rgbToHex({getProperty('dad.healthColorArray[0]'),getProperty('dad.healthColorArray[1]'),getProperty('dad.healthColorArray[2]')})
    setHealthBarColors(bfcolor, dadcolor)
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    x3 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (75 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    setProperty('iconP1.x', x1)
    setProperty('iconP2.x', x2)
    setProperty('iconP3.x', x3)
    if health > 1.6 then
        setProperty('iconP1.animation.curAnim.curFrame', 1)
    elseif health < 0.4 then
        setProperty('iconP1.animation.curAnim.curFrame', 2)
    else
        setProperty('iconP1.animation.curAnim.curFrame', 0)
    end
    if health < 0.4 then
        setProperty('iconP2.animation.curAnim.curFrame', 1)
    elseif health > 1.6 then
        setProperty('iconP2.animation.curAnim.curFrame', 2)
    else
        setProperty('iconP2.animation.curAnim.curFrame', 0)
    end
    for i = 0, 3 do

        setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
        setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i])
        setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i])
        setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i])

        setPropertyFromGroup('playerStrums', i, 'alpha', 1)
        setPropertyFromGroup('playerStrums', i, 'visible', true)
        
        setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
        setPropertyFromGroup('opponentStrums', i, 'visible', true)
        
    end
end
end

-- game over stuff

function onGameOver()
    invis = true
end