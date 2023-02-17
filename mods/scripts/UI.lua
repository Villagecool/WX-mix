

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

local lastHealth = 0
function onCreatePost()
        makeLuaSprite('iconP3', 'icons/icon-sandra-gf', 0, 0)
        setProperty('iconP3.visible', true)
    setObjectCamera('iconP3', 'camHUD')
    setProperty('iconP3.flipX', false)
    addLuaSprite('iconP3', true)

	makeLuaSprite('Health', 'healthbarSacorg')
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	setObjectOrder('Health', getObjectOrder('healthBar') + 1)
	setProperty('healthBar.visible', true)
	setProperty('healthBarBG.visible', true)

	makeLuaSprite('time', 'timebarSacorg')
	setObjectCamera('time', 'hud')
	addLuaSprite('time', true)
	setObjectOrder('time', getObjectOrder('timeBar') + 1)
	setProperty('timeBar.visible', true)
	setProperty('timeBarBG.visible', true)

    setProperty('timeBar.color', rgbToHex(getProperty('dad.healthColorArray')))
end

function rgbToHex(rgb) --https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
    return string.format("%02x%02x%02x",math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end
function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end
local lastHealth = 1
function onUpdatePost()
    --if lastHealth == getProperty('health') then
    --    --setProperty('dad.scale.x',  1)
    --else
    --    setProperty('iconP2.scale.x', getProperty('iconP2.scale.x')*1.2)
    --    setProperty('iconP1.scale.x', getProperty('iconP1.scale.x')*1.2)
    --end
    lastHealth = getProperty('health')
    --doTweenX('moveHealthIcon', 'time', health*5, health/0.5, 'linear')
            syncObjs('iconP3', 'iconP2', 50,-70)
            setProperty('iconP3.alpha', getProperty('gf.alpha'))
            setProperty('iconP3.visible', getProperty('gf.visible'))
            
    setProperty('iconP3.flipX', not mustHitSection)
	setProperty('Health.x', getProperty('healthBar.x') - 55)
	setProperty('Health.y', getProperty('healthBar.y') - 20)
	setProperty('time.x', getProperty('timeBar.x') - 55)
	setProperty('time.y', getProperty('timeBar.y') - 20)
    
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.00625');
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				--setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
        else
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.0125');
		end
	end
    if hits < 1 then
        setProperty('scoreTxt.text', 'Score: 0 | Misses: 0 | Health: 50% | Rating: ?')
    elseif misses < 1 then
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. ' | Health: '.. math.floor(getProperty("health")*50) ..'% | Rating: (' ..  round(rating * 100, 2) .. '%) ' .. ratingFC )
    else
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. ' | Health: '.. math.floor(getProperty("health")*50) ..'% | Rating: (' ..  round(rating * 100, 2) .. '%) Clear')
    
    end
	setTextString('timeTxt', songName..' ('..timeBarTypes[timeBarType:lower()]()..')')
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
function syncObjs(getter, setter, xoffset, yoffset)
    setProperty(getter..'.x', getProperty(setter..'.x')+xoffset)
    setProperty(getter..'.y', getProperty(setter..'.y')+yoffset)
    setProperty(getter..'.scale.x', getProperty(setter..'.scale.x'))
    setProperty(getter..'.scale.y', getProperty(setter..'.scale.y'))
    setProperty(getter..'.angle', getProperty(setter..'.angle'))
    setObjectOrder(getter, getObjectOrder(setter)-2)
end