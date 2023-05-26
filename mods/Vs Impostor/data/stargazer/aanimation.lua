
function onCreatePost()
	makeAnimatedLuaSprite('max', 'camMax', 1550, 750);
	luaSpriteAddAnimationByPrefix('max', 'idle','walk', 1, false);
	luaSpriteAddAnimationByPrefix('max', 'wave','anim', 1, false);
    objectPlayAnimation('max', 'idle', true)
	scaleLuaSprite('max', 0.7, 0.7)
	addLuaSprite('max', false);
	setObjectOrder('max', 2)
end
function onTweenCompleted(t)
    if t == 'MaxWalkin' then
        objectPlayAnimation('max', 'wave', true)
        doTweenX('MaxWave', 'max', 1050, 4, 'linear')
    end
    if t == 'MaxWave' then
        objectPlayAnimation('max', 'idle', true)
        doTweenX('MaxLeave', 'max', 750, 3, 'linear')
    end
    if t == 'MaxLeave' then
        removeLuaSprite('max', true)
    end
end
function onStepHit()
   if curStep == 1616 then
    doTweenX('MaxWalkin', 'max', 1050, 4, 'linear')
   end
end

local ending = true
function onEndSong()
    if ending then
          ending = false
           followchars = false
           runTimer('endSong',10)
           runTimer('animation',0.5)
           runTimer('sound',5.5)
           runTimer('morph',7)
          return Function_Stop;
    end
    if ending == false then
      return Function_Continue
    end
end

function onTimerCompleted(tag)
if tag == 'endSong' then
endSong(true)
end
if tag == 'animation' then
    triggerEvent('Change Character','bf', 'shapeshifter')
    triggerEvent('Play Animation','fakejordans', 'bf')
end
if tag == 'morph' then
    triggerEvent('Play Animation','pinko', 'bf')
    triggerEvent('Alt Idle Animation','bf', '-p')
end
if tag == 'sound' then
    playSound('among-us-shapeshift',1)
end
end
