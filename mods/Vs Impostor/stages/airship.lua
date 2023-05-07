
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 2000;
local yy = 1050;
local xx2 = 2300;
local yy2 = 1050;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()

	makeLuaSprite('cargo walls', 'airship/cargowall', 250, 50);
	scaleLuaSprite('cargo walls', 1., 1.)
	addLuaSprite('cargo walls', false);
	setProperty('cargo walls.alpha', 0)

	makeLuaSprite('cargo', 'airship/cargo', 50, 50);
	scaleLuaSprite('cargo', 1., 1.)
	addLuaSprite('cargo', false);
	setProperty('cargo.alpha', 0)

	makeAnimatedLuaSprite('sandra','characters/sandra-suprised',2000, 450)
	addAnimationByIndices('sandra','danceLeft','GF Dancing Beat', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14',24)
	addAnimationByIndices('sandra','danceRight','GF Dancing Beat', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29',24)
    objectPlayAnimation('sandra', 'danceLeft', true)
    setProperty('sandra.flipX', true)
    setProperty('sandra.alpha', 0)
	addLuaSprite('sandra',false)

end
function onBeatHit()
	if curBeat % 2 == 0 then
        objectPlayAnimation('sandra', 'danceLeft', true)
    else
        objectPlayAnimation('sandra', 'danceRight', true)
    end
end
function onCreatePost()
    setProperty('gf.alpha', 0);
    setProperty('boyfriend.alpha', 0);
    setProperty('dad.alpha', 0);
end

function onStepHit()
if curStep == 16 then
doTweenAlpha('whitebox', 'white', 1, 0.1, 'linear')
end
if curStep == 1431 then
    doTweenAlpha('cargo', 'cargo', 0, 1, 'linear')
    doTweenAlpha('sandra', 'sandra', 0, 1, 'linear')
doTweenAlpha('cargo wall', 'cargo wall', 0, 1, 'linear')
triggerEvent('Change Character', 'dad', 'egg_boi')
doTweenAlpha('black', 'gf', 0, 1, 'linear')
doTweenAlpha('overlay', 'overlay', 0, 1, 'linear')
end
if curStep == 2048 then
doTweenAlpha('blackBox', 'black', 1, 0.1, 'linear')
end
end
function onTweenCompleted(tag)
if tag == 'whitebox' then
doTweenAlpha('whiteboxfade', 'white', 0, 0.1, 'linear')
end
if tag == 'blackBox' then
    triggerEvent('Change Character', 'dad', 'greendk')
doTweenAlpha('blackboxfade', 'black', 0, 0.1, 'linear')
setProperty('cargo.alpha', 1)
setProperty('cargo wall.alpha', 1)
setProperty('dad.alpha', 1)
setProperty('gf.alpha', 1)
setProperty('sandra.alpha', 1)
setProperty('overlay.alpha', 0.7)
setProperty('f.alpha', 0)
end
if tag == 'blackBox2' then
doTweenAlpha('blackboxfade2', 'black', 0, 0.1, 'linear')
end
end

function onSongStart()
    doTweenAlpha('cargo', 'cargo', 1, 1, 'linear')
    doTweenAlpha('sandra', 'sandra', 1, 1, 'linear')
doTweenAlpha('cargo wall', 'cargo wall', 1, 1, 'linear')
doTweenAlpha('white', 'dad', 1, 1, 'linear')
doTweenAlpha('black', 'gf', 1, 1, 'linear')
doTweenAlpha('bf', 'boyfriend', 1, 1, 'linear')
doTweenAlpha('overlay', 'overlay', 0.7, 1, 'linear')
end

function onUpdate()
    	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.8)
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
        else

            setProperty('defaultCamZoom',0.8)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curBeat >= 356 and curBeat < 420 then
		setProperty('defaultCamZoom',1.1)
        xx2 = 2750;
        yy2 = 1150;  
	end
    if curBeat == 420 then
		setProperty('defaultCamZoom',0.8)
        xx2 = 2300;
        yy2 = 1050;  
	end
    if curBeat >= 552 and curBeat < 556 then
		setProperty('defaultCamZoom',1.2)
        xx = 1650;
        yy = 1180;  
	end
    if curBeat == 556 then
        xx = 2000;
        yy = 1050;  
	end
    if curBeat == 916 then
        doTweenZoom('defeated', 'camGame', 0.4, 20, 'linear')
    end

end

