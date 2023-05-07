function onCreate()

	makeLuaSprite('cams', 'SecCams', 400, 600);
	scaleLuaSprite('cams', 0.8, 0.8)
	addLuaSprite('cams', false);

	makeLuaSprite('walls', 'SecBackground', 400, 600);
	scaleLuaSprite('walls', 0.8, 0.8)
	addLuaSprite('walls', false);


	makeLuaSprite('Fans', 'Seccomps', 400, 600);
	scaleLuaSprite('Fans', 0.8, 0.8)
	addLuaSprite('Fans', false);

	makeLuaSprite('switch', 'Secchair', 400, 600);
	scaleLuaSprite('switch', 0.8, 0.8)
	addLuaSprite('switch', false);

	makeAnimatedLuaSprite('dude2', 'suscreator', 950, 790);
	luaSpriteAddAnimationByPrefix('dude2', 'idle','', 12, false);
	scaleLuaSprite('dude2', 1.5, 1.5)
	addLuaSprite('dude2', false);

	makeLuaSprite('ded', 'Secded', 400, 600);
	scaleLuaSprite('ded', 0.8, 0.8)
	addLuaSprite('ded', false);
    setProperty('ded.alpha', 0)
	
	makeLuaSprite('switch2', 'SecchairFront', 400, 600);
	scaleLuaSprite('switch2', 0.8, 0.8)
	addLuaSprite('switch2', false);


	makeAnimatedLuaSprite('dude', 'suscoder', 1600, 1100);
	luaSpriteAddAnimationByPrefix('dude', 'idle','', 24, false);
	scaleLuaSprite('dude', 1.5, 1.5)
	addLuaSprite('dude', true);
	--setProperty('dude2.alpha', 0)

end
function onCreatePost()
	setObjectOrder('walls', getObjectOrder('gfGroup')+1)
	setObjectOrder('Fans', getObjectOrder('gfGroup')+1.1)
	setObjectOrder('switch', getObjectOrder('gfGroup')+1.2)
	setObjectOrder('dude2', getObjectOrder('gfGroup')+1)
	setObjectOrder('ded', getObjectOrder('gfGroup')+1)
	setObjectOrder('switch2', getObjectOrder('gfGroup')+1)
end
local superBop = true
function onBeatHit()
	if superBop then
		objectPlayAnimation('dude', 'idle', true)
	else
		if curBeat % 2 == 0 then
			objectPlayAnimation('dude', 'idle', true)
		end
	end
	if curBeat % 2 == 0 then
		objectPlayAnimation('dude2', 'idle', true)
	end
end