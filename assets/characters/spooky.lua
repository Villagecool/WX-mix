local gf = false;
local duet = false
local rr = 1.2
local anim = 'idle'
local del = 0;
local WyattSing = false
offsets = {};
function makeOffsets(object)
	offsets[0] = {x=10, y=-10}--left
	offsets[1] = {x=-20, y=-40}--down
	offsets[2] = {x=-10, y=22}--up
	offsets[3] = {x=-60, y=0}--right
	
	offsets[4] = {x=0, y=0}-- idle
end
function onCreate()
	makeOffsets()
	makeAnimatedLuaSprite('Wyatt','characters/Wyatt',getProperty('dad.x')+100,getProperty('dad.y')-50)
	addAnimationByPrefix('Wyatt','idle','WyattIdleAlt',24,false)
	addAnimationByPrefix('Wyatt','singLEFT','WyattLeftAlt',24,false)
	addAnimationByPrefix('Wyatt','singDOWN','WyattDownAlt',24,false)
	addAnimationByPrefix('Wyatt','singUP','WyattUpAlt',24,false)
	addAnimationByPrefix('Wyatt','singRIGHT','WyattRightAlt',24,false)

	
	addAnimationByPrefix('Wyatt','singLEFT-alt','WyattLeftAlt',24,false)
	addAnimationByPrefix('Wyatt','singDOWN-alt','WyattDownAlt',24,false)
	addAnimationByPrefix('Wyatt','singUP-alt','WyattUpAlt',24,false)
	addAnimationByPrefix('Wyatt','singRIGHT-alt','WyattRightAlt',24,false)

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
local alt = '-alt'
function opponentNoteHit(id, d, noteType, isSustainNote)
	if noteType == 'Alt Anim Orange' or altAnim then
		alt = '-alt'
	else
		alt = ''
	end
		if d == 0 then
		anim = 'singLEFT'..alt
		end
		if d == 1 then
		anim = 'singDOWN'..alt
		end
		if d == 2 then
		anim = 'singUP'..alt
		end
		if d == 3 then
		anim = 'singRIGHT'..alt
		end
		if WyattSing or noteType == 'WyattSing' then
			objectPlayAnimation('Wyatt',anim,true)
			setProperty('Wyatt.offset.x', offsets[d].x);
			setProperty('Wyatt.offset.y', offsets[d].y);
		end
end

function onEvent(name,value1,value2)
	if name == 'Duet Skid n Pump' then
		if value1 == 'true' then
			WyattSing = true
		elseif value1 == 'false' then
			WyattSing = false
		end
	end

end

