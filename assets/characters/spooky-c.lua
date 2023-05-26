local gf = false;
local duet = false
local rr = 1.2
local anim = 'idle'
local del = 0;
local WyattSing = false
offsets = {};
function makeOffsets(object)
	offsets[4] = {x=0, y=0}-- idle
end
function onCreate()
	makeOffsets()
	makeAnimatedLuaSprite('Wyatt','characters/evil/Wyatt',getProperty('dad.x')+300,getProperty('dad.y')-50)
	addAnimationByPrefix('Wyatt','idle','WyattIdle',24,false)
	addLuaSprite('Wyatt',false)
	objectPlayAnimation('Wyatt',anim,false)
    setObjectOrder('Wyatt', 5)



	--Iterate over all notes
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('Wyatt','idle',true)
		setProperty('Wyatt.offset.x', offsets[4].x);
		setProperty('Wyatt.offset.y', offsets[4].y);
	end

end

function onUpdate(elapsed)
	--for i = 0, getProperty('notes.length')-1 do
	--	--Check if the note is an Instakill Note
	--	if SkidSing == false and not getPropertyFromGroup('notes', i, 'mustHit') then
	--		setPropertyFromGroup('notes', i, 'noAnimation', true); --Change texture
	--	elseif SkidSing == true and not getPropertyFromGroup('notes', i, 'mustHit') then
	--		setPropertyFromGroup('notes', i, 'noAnimation', false); --Change texture
	--	end
	--end
	if del > 0 then
		del = del - 1;
	end


end