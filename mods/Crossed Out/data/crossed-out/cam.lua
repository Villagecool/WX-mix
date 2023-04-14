local allowCountdown = false

local campointx = 1400
local campointy = 1400
local bfturn = false
local camMovement = 10
local velocity = 3.5

function onMoveCamera(focus)

    if focus == 'boyfriend' then
        campointx = getProperty('camFollow.x')
        campointy = getProperty('camFollow.y')
        bfturn = true
    elseif focus == 'dad' then
        campointx = getProperty('camFollow.x')
        campointy = getProperty('camFollow.y')
        bfturn = false
        setProperty('cameraSpeed', 1)    
    end
end

function onUpdatePost(elapsed)

    if bfturn then
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            setProperty('camFollow.x', campointx)
            setProperty('camFollow.y', campointy)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            setProperty('camFollow.x', campointx - camMovement)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            setProperty('camFollow.y', campointy + camMovement)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            setProperty('camFollow.y', campointy - camMovement)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            setProperty('camFollow.x', campointx + camMovement)
        end
        setProperty('cameraSpeed', velocity)
    end

    if not bfturn then
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            setProperty('camFollow.x', campointx)
            setProperty('camFollow.y', campointy)
        elseif getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            setProperty('camFollow.x', campointx - camMovement)
        elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            setProperty('camFollow.y', campointy + camMovement)
        elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
            setProperty('camFollow.y', campointy - camMovement)
        elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            setProperty('camFollow.x', campointx + camMovement)
        end
        setProperty('cameraSpeed', velocity)
    end

end