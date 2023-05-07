
local maxCombo = 0
local real_combo = 0
local real_misses = 0
local timeBarTypes = {
    ['song name'] = function()
        return formatTime(songLength - (getSongPosition() - noteOffset))
    end,

    ['time left'] = function()
        return formatTime(songLength - (getSongPosition() - noteOffset))
    end,

    ['time elapsed'] = function()
        return formatTime(getSongPosition() - noteOffset)
    end
}

function onCreatePost()
    --createLuaWindow('AMONGUS', 'timebarSacorg', 20, 50)
    makeLuaText('judgeCounter', 'Sicks: ', 0, 45, 350)
    setTextSize('judgeCounter', 20)
    setTextAlignment('judgeCounter', 'left')
    setProperty('judgeCounter.y', 600)

    addLuaText('judgeCounter')
    --if getProperty("girlfriend.curCharacter") == 'sandra' then
    --makeLuaSprite('iconP3', 'icons/icon-sandra-gf', 0, 0)
    --elseif getProperty("girlfriend.curCharacter") == 'gf' then
    --    makeLuaSprite('iconP3', 'icons/icon-gf', 0, 0)
    --else
    --    setProperty('iconP3.visible', false)
    --end
    --setObjectCamera('iconP3', 'camHUD')
    --setProperty('iconP3.flipX', false)
    --addLuaSprite('iconP3', true)

	makeLuaSprite('Health', 'healthbarSacorg')
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	setObjectOrder('Health', getObjectOrder('healthBar') + 1)
	setProperty('healthBar.visible', true)
	setProperty('healthBarBG.visible', true)

	makeLuaSprite('time', 'healthbarSacorg')
	setObjectCamera('time', 'hud')
	addLuaSprite('time', true)
	setObjectOrder('time', getObjectOrder('timeBar') + 1)
	setProperty('timeBar.visible', true)
	setProperty('timeBarBG.visible', true)

    --setProperty('timeBar.color', rgbToHex(getProperty('dad.healthColorArray')))
end

function rgbToHex(rgb) --https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
    return string.format("%02x%02x%02x",math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end
function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end
local lastHealth = 1

function onUpdatePost(elapsed)
    if getProperty('combo') > maxCombo then
        maxCombo = getProperty('combo')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        triggerEvent('Play Animation', 'hey', 'bf')
    end
    setTextString('judgeCounter', 'Sicks: ' .. getProperty('sicks')..'\nGoods: ' .. getProperty('goods')..'\nBads: ' .. getProperty('bads')..'\nShits: ' .. getProperty('shits')..'\nMax Combo: ' .. maxCombo)
    --doTweenX('moveHealthIcon', 'time', health*5, health/0.5, 'linear')
    --syncObjs('iconP3', 'iconP2')
    --setProperty('iconP3.width', 150)
    --setProperty('iconP3.width', 150)
            
    --setProperty('iconP3.flipX', not mustHitSection)
	setProperty('Health.x', getProperty('healthBar.x') - 55)
	setProperty('Health.y', getProperty('healthBar.y') - 20)
	setProperty('time.x', getProperty('timeBar.x') - 55)
	setProperty('time.y', getProperty('timeBar.y') - 20)
	setTextString('timeTxt', songName..' ('..timeBarTypes[timeBarType:lower()]()..')')
	setProperty('Health.alpha', getProperty('healthBar.alpha'))
	setProperty('time.alpha', getProperty('timeBar.alpha'))
	setProperty('Health.visible', getProperty('healthBar.visible'))
	setProperty('time.visible', getProperty('timeBar.visible'))
end

function onUpdateScore(miss)
    for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.00625');
			--if getPropertyFromGroup('notes', i, 'mustPress') and not getProperty('cpuControlled') then --Doesn't let Dad/Opponent notes get ignored
			--	setPropertyFromGroup('notes', i, 'ignoreNote', true); --Miss has no penalties
			--end
        else
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.0125');
		end
	end
    --if getProperty('cpuControlled') then
    --    setProperty('scoreTxt.text', 'Score: Bot | Misses: N/A | Health: '.. math.floor(getProperty("health")*50) ..'% | Rating: (Skill Issue) ' )
    --else
    --    if hits < 1 then
    --        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. ' | Health: '.. math.floor(getProperty("health")*50) ..'% | Rating: ?')
    --    elseif misses < 1 then
    --        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. ' | Health: '.. math.floor(getProperty("health")*50) ..'% | Rating: (' ..  round(rating * 100, 2) .. '%) ' .. ratingFC )
    --    else
    --        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. ' | Health: '.. math.floor(getProperty("health")*50) ..'% | Rating: (' ..  round(rating * 100, 2) .. '%) Clear')
    --    
    --    end
    --end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
function onEvent(n,v1,v2)
    if n == 'Change Character' then
        addLuaScript('characters/'..v2)
    end
end
function syncObjs(getter, setter)
    setProperty(getter..'.x', getProperty(setter..'.x')+50)
    setProperty(getter..'.y', getProperty(setter..'.y')-70)
    setProperty(getter..'.scale.x', getProperty(setter..'.scale.x'))
    setProperty(getter..'.scale.y', getProperty(setter..'.scale.y'))
    setProperty(getter..'.angle', getProperty(setter..'.angle'))
    setObjectOrder(getter, getObjectOrder(setter)-2)
end