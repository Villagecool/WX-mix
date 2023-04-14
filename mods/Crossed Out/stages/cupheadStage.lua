function onCreate()
	-- background shit
	
	makeAnimationList()

    makeAnimatedLuaSprite('CupTitle','cup/ready_wallop',-600,-30)
    addAnimationByPrefix('CupTitle','Ready?','Ready? WALLOP!',24,false)
    objectPlayAnimation('CupTitle','Ready?',false)
    setLuaSpriteScrollFactor('CupTitle',0,0)


	makeAnimatedLuaSprite('start', 'cup/the_thing2.0', -100, 0);
	scaleObject('start',1.15,1.15)
	setObjectCamera('start', 'hud');
	addAnimationByPrefix('start','dance','BOO instance 1',18,false);




	
	makeLuaSprite('Final', 'bendy/images/nightmare2',200, 200);
	scaleObject('Final',1.8,1.8)

		makeLuaSprite('NMBS', 'bendy/images/nightmare2',200, 200);
	scaleObject('NMBS',1.8,1.8)

	makeLuaSprite('BendyBGd', 'bendy/images/BACKBACKgROUNDd',620, 100);
	scaleObject('BendyBGd',1,1)
	
	makeLuaSprite('BendyBG2d', 'bendy/images/BackgroundwhereDEEZNUTSfitINYOmOUTHd', 200, 50);
	scaleObject('BendyBG2d',1,1)
	
	makeLuaSprite('BendyGroundd', 'bendy/images/MidGrounUTSd', 200, 50);
	
	scaleObject('BendyGroundd',1,1)
	


    makeAnimatedLuaSprite('SammyBG','bendy/images/third/SammyBg',1470,880)
addAnimationByPrefix('SammyBG','dance','Sam instance 1',24,true)
objectPlayAnimation('SammyBG','dance',true)
scaleObject('SammyBG',1.1,1.1)
makeAnimatedLuaSprite('JzBoy','bendy/images/JzBoy',900,880)
addAnimationByPrefix('JzBoy','dance','Jack Copper Walk by instance 1',24,true)
objectPlayAnimation('JzBoy','dance',false)


makeAnimatedLuaSprite('JzBoy','bendy/images/JzBoy',900,880)
addAnimationByPrefix('JzBoy','dance','Jack Copper Walk by instance 1',24,true)
objectPlayAnimation('JzBoy','dance',false)


makeLuaSprite('BendyBG', 'bendy/images/BACKBACKgROUND',620, 100);
scaleObject('BendyBG',1,1)

makeLuaSprite('BendyBG2', 'bendy/images/BackgroundwhereDEEZNUTSfitINYOmOUTH', 200, 50);
scaleObject('BendyBG2',1,1)

makeLuaSprite('BendyGround1', 'bendy/images/MidGrounUTS', 200, 50);
scaleObject('BendyGround1',1,1)





	makeLuaSprite('SansAltBG','sans/Waterfall',150,500)
	scaleObject('SansAltBG',1.55,1.5)
	makeLuaSprite('void','sans/void',150,500)
	scaleObject('void',9.5,9.5)
	makeLuaSprite('SansBattle','sans/battle',-160,-130)
	scaleObject('SansBattle',1.55,1.5)
	makeLuaSprite('SansBG','sans/hall',620,750)
		scaleObject('SansBG',1.55,1.5)




	makeLuaSprite('Cup-CH-RN-00', 'cup/rain/Cup-CH-RN-00', -600, -150);
	setLuaSpriteScrollFactor('Cup-CH-RN-00', 0.1, 0.1);
	scaleObject('Cup-CH-RN-00',3,3)
    
	makeLuaSprite('Cup-CH-RN-01', 'cup/rain/Cup-CH-RN-01', -850, -300);
	setLuaSpriteScrollFactor('Cup-CH-RN-01', 0.2, 0.2);
	scaleObject('Cup-CH-RN-01',3,3)

    makeLuaSprite('Cup-CH-RN-02','cup/rain/Cup-CH-RN-02', -600, -100);
	scaleObject('Cup-CH-RN-02',4,4)

	


	makeLuaSprite('Cup-BG-00', 'cup/Cup-BG-00', -600, -150);
	setLuaSpriteScrollFactor('Cup-BG-00', 0.1, 0.1);
	scaleObject('Cup-BG-00',3,3)
    
	makeLuaSprite('Cup-BG-01', 'cup/Cup-BG-01', -750, -300);
	setLuaSpriteScrollFactor('Cup-BG-01', 0.3, 0.3);
	scaleObject('Cup-BG-01',3,3)

	makeLuaSprite('Cup-BG-Ground', 'cup/Cup-BG-Ground', -600, -100);
	scaleObject('Cup-BG-Ground',4,4)
	

	makeAnimatedLuaSprite('nm bendy', 'bendy/images/nm bendy', 760, 980); -- nm bendydo
	addAnimationByPrefix('nm bendy', 'idle', 'nm bendy idle', 24, false)
	addAnimationByPrefix('nm bendy', 'singLEFT', 'nm bendy left', 24, false)
	addAnimationByPrefix('nm bendy', 'singDOWN', 'nm bendy down', 24, false)
	addAnimationByPrefix('nm bendy', 'singUP', 'nm bendy up', 24, false)
	addAnimationByPrefix('nm bendy', 'singRIGHT', 'nm bendy right', 24, false)
	setProperty('nm bendy.alpha', 0);
	scaleObject('nm bendy',1.8,1.8)

	
	addLuaSprite('Final',false)
	addLuaSprite('NMBS',false)
	addLuaSprite('BendyBGd', false);
	addLuaSprite('BendyBG2d', false);
	addLuaSprite('BendyGroundd', false);
	addLuaSprite('BendyBG', false);
	addLuaSprite('BendyBG2', false);
	addLuaSprite('SammyBG',false)
	addLuaSprite('BendyGround1', false);
	addLuaSprite('SansAltBG', false);
	addLuaSprite('void', false);
	addLuaSprite('SansBattle', false);
	addLuaSprite('SansBG', false);
	addLuaSprite('Cup-CH-RN-00', false);
    addLuaSprite('Cup-CH-RN-01', false);
    addLuaSprite('Cup-CH-RN-02', false);
	addLuaSprite('Cup-BG-00', false);
    addLuaSprite('Cup-BG-01', false);
	addLuaSprite('Cup-BG-Ground', false);
	addLuaSprite('nm bendy',true)
	addLuaSprite('CupTitle', true);
	addLuaSprite('start', true);
	
	


		




	if not lowQuality then
		

		
		
		makeAnimatedLuaSprite('CupheqdShid', 'cup/CUpheqdshid',-350,-193);
		addAnimationByPrefix('CupheqdShid','dance','Cupheadshit_gif instance 1',24,true);
		objectPlayAnimation('CupheqdShid','Cupheadshit_gif instance',false)
		scaleObject('CupheqdShid',1.6,1.6)
		setObjectCamera('CupheqdShid','other')
	




		makeAnimatedLuaSprite('Grain', 'cup/Grainshit',-350,-193);
		addAnimationByPrefix('Grain','dance','Geain instance 1',24,true);
		objectPlayAnimation('Grain','Geain instance 1',false)
		scaleObject('Grain',1.6,1.6)
		setObjectCamera('Grain','other')
	
		addLuaSprite('CupheqdShid', true);
		addLuaSprite('Grain',true)
	end
end
function onBeatHit()
	objectPlayAnimation('nm bendy', 'idle', false);
end


animationsList = {}
holdTimers = {nmbendy = -1.0};
noteDatas = {nmbendy = 0};
function makeAnimationList()
	animationsList[0] = 'singLEFT';
	animationsList[1] = 'singDOWN';
	animationsList[2] = 'singUP';
	animationsList[3] = 'singRIGHT';
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'NMBsing' then
	setProperty('nm bendy.alpha', 1);
		if not isSustainNote then
			noteDatas.nmbendy = direction;
		end	
		characterToPlay = 'nm bendy'
		animToPlay = noteDatas.nmbendy;
		holdTimers.nmbendy = 0;
				
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function playAnimation(character, animId, forced)
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'nm bendy' then
		objectPlayAnimation('nm bendy', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	end
end
function onUpdate(elapsed)
	if holdTimers.nmbendy >= 0 then
		holdTimers.nmbendy = holdTimers.nmbendy + elapsed;
	end
end