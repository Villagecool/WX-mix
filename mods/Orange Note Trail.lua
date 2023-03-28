trailEnabledDad = false;
trailEnabledBF = false;
timerStartedDad = false;
timerStartedBF = false;

trailLength = 5;
trailDelay = 0.05;

function opponentNoteHit(id, d, noteType, isSustainNote)
    if noteType == 'Alt Anim Orange' then
	    createTrailFrame('Dad');
	    createTrailFrame('Wyatt');
    end
end
function goodNoteHit(id, d, noteType, isSustainNote)
    if noteType == 'Alt Anim Orange' then
    	createTrailFrame('BF');
    end
end

curTrailDad = 0;
curTrailBF = 0;
function createTrailFrame(tag)
	num = 0;
	color = -1;
	image = '';
	frame = 'BF idle dance';
	x = 0;
	y = 0;
	scaleX = 0;
	scaleY = 0;
	offsetX = 0;
	offsetY = 0;

	if tag == 'BF' then
		num = curTrailBF;
		curTrailBF = curTrailBF + 1;
		color = getColorFromHex('FF9900');
		image = getProperty('boyfriend.imageFile')
		frame = getProperty('boyfriend.animation.frameName');
		x = getProperty('boyfriend.x');
		y = getProperty('boyfriend.y');
		scaleX = getProperty('boyfriend.scale.x'); 
		scaleY = getProperty('boyfriend.scale.y'); 
		offsetX = getProperty('boyfriend.offset.x');
		offsetY = getProperty('boyfriend.offset.y');
	elseif tag == 'Wyatt' then
			num = curTrailBF;
			curTrailBF = curTrailBF + 1;
			color = getColorFromHex('FF9900');
			image = getProperty('Wyatt.imageFile')
			frame = getProperty('Wyatt.animation.frameName');
			x = getProperty('Wyatt.x');
			y = getProperty('Wyatt.y');
			scaleX = getProperty('Wyatt.scale.x'); 
			scaleY = getProperty('Wyatt.scale.y'); 
			offsetX = getProperty('Wyatt.offset.x');
			offsetY = getProperty('Wyatt.offset.y');
		else
		num = curTrailDad;
		curTrailDad = curTrailDad + 1;
			color = getColorFromHex('FF9900');
			image = getProperty('dad.imageFile')
			frame = getProperty('dad.animation.frameName');
			x = getProperty('dad.x');
			y = getProperty('dad.y');
			scaleX = getProperty('dad.scale.x');
			scaleY = getProperty('dad.scale.y');
			offsetX = getProperty('dad.offset.x');
			offsetY = getProperty('dad.offset.y');
	end

	--if num - trailLength + 1 >= 0 then
	--	for i = (num - trailLength + 1), (num - 1) do
	--		setProperty('psychicTrail'..tag..i..'.alpha', getProperty('psychicTrail'..tag..i..'.alpha') - (0.6 / (trailLength - 1)));
	--	end
	--end
	removeLuaSprite('psychicTrail'..tag..(num - trailLength));

	if not (image == '') then
		trailTag = 'psychicTrail'..tag..num;
		makeAnimatedLuaSprite(trailTag, image, x, y);
		setProperty(trailTag..'.offset.x', offsetX);
		setProperty(trailTag..'.offset.y', offsetY);
		setProperty(trailTag..'.scale.x', scaleX*1.3);
		setProperty(trailTag..'.scale.y', scaleY*1.3);
		setProperty(trailTag..'.alpha', 0.8);
		setProperty(trailTag..'.color', color);
		setBlendMode(trailTag, 'add');
		addAnimationByPrefix(trailTag, 'stuff', frame, 0, false);
		addLuaSprite(trailTag, false);
		doTweenAlpha(trailTag..'Tween', trailTag, 0 , 0.5, 'linear')
		doTweenY(trailTag..'Tween2', trailTag, getProperty(trailTag..'.y')-100 , 0.5, 'linear')
		function onTweenCompleted(tag)
			if tag == trailTag..'Tween' then
				removeLuaSprite(trailTag)
			end
		end
	end
end