function onCreate()

	addLuaScript('data/CameraMove.lua')
    setGlobalFromScript('data/CameraMove','CamNoteMove',20)
    setGlobalFromScript('data/CameraMove','CharcterMove',{dad=10,bf=10})
    setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={1100,1200},bf={1500,1200}})
    setGlobalFromScript('data/CameraMove','CharacterForce',true)


	makeLuaSprite('cams', 'SecCams', 400, 600);
	scaleLuaSprite('cams', 0.8, 0.8)
	addLuaSprite('cams', false);

	makeLuaSprite('walls', 'SecBackground', 400, 600);
	scaleLuaSprite('walls', 0.8, 0.8)
	addLuaSprite('walls');


	makeLuaSprite('Fans', 'Seccomps', 400, 600);
	scaleLuaSprite('Fans', 0.8, 0.8)
	addLuaSprite('Fans');

	makeLuaSprite('switch', 'Secchair', 400, 600);
	scaleLuaSprite('switch', 0.8, 0.8)
	addLuaSprite('switch');

	makeAnimatedLuaSprite('dude2', 'suscreator', 950, 790);
	luaSpriteAddAnimationByPrefix('dude2', 'idle','', 12, false);
	scaleLuaSprite('dude2', 1.5, 1.5)
	addLuaSprite('dude2');

	makeLuaSprite('ded', 'Secded', 400, 600);
	scaleLuaSprite('ded', 0.8, 0.8)
	addLuaSprite('ded');
    setProperty('ded.alpha', 0)
	
	makeLuaSprite('switch2', 'SecchairFront', 400, 600);
	scaleLuaSprite('switch2', 0.8, 0.8)
	addLuaSprite('switch2');


	makeLuaSprite('walls2', 'SecDark', 400, 600);
	scaleLuaSprite('walls2', 0.8, 0.8)
	setProperty('walls2.alpha', 0)
	addLuaSprite('walls2');

    makeAnimatedLuaSprite('DefeatBackv4','defeat',-400,100)
    scaleObject('DefeatBackv4',1.5,1.5)
	setProperty('DefeatBackv4.alpha', 0)
    addAnimationByPrefix('DefeatBackv4','Beat','defeat',24,false)
    addLuaSprite('DefeatBackv4',true)
	setBlendMode('DefeatBackv4','add')

	makeAnimatedLuaSprite('dude', 'suscoder', 1600, 1100);
	luaSpriteAddAnimationByPrefix('dude', 'idle','', 24, false);
	scaleLuaSprite('dude', 1.5, 1.5)
	addLuaSprite('dude', true);
	--setProperty('dude2.alpha', 0)

end
function onCreatePost()
    addCharacterToList(getProperty('dad.curCharacter'),'dad')
    addCharacterToList(getProperty('gf.curCharacter'),'gf')
    addCharacterToList(getProperty('boyfirend.curCharacter'),'boyfriend')
	setObjectOrder('cams', 1)
	setObjectOrder('gfGroup', 3)
	setObjectOrder('walls', 9)
	setObjectOrder('Fans', 9)
	setObjectOrder('switch', 9)
	setObjectOrder('dude2', 9)
	setObjectOrder('ded', 9)
	setObjectOrder('switch2', 9)
	setObjectOrder('walls2', 9)
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
function onSectionHit()
    playAnim('DefeatBackv4','Beat')
end