dogModesteps = 0
dogModeactive = false
dogModeSwitch = true

BlasterDamageDealt = 0
curHealthValue = 0
newHealthValueStep = 0

canMove = false;
spawned = {};
bProp = {};
bInd = 0;

targetW = 450;
targetH = 300;
boxX = 965 - 325;
boxY = 720 / 2;
boxW = 0;
boxH = 0;

boxA = 0;

pX = 0;
pY = 0;

isBlue = false;
gravDir = 270;
vsp = 0;
grav = 0.26;

hRemove = false;

curAtk = 'none';
atkTimer = 0;

bts = 0;
bTimer = 0;
succ = 0;

dmgMulti = 1;

local damageTaken = 0;

local forceKill = false;

--stolen xddd
function get_angle(vector1,vector2)
	--Multiply the components of both vectors along the x-axis with each other
	local i = vector1["x"]*vector2["x"]
	local j = vector1["y"]*vector2["y"]
	local k = vector1["z"]*vector2["z"]
	local sumtotal = i+j+k --dot product
	local absoluteA = math.sqrt((vector1["x"]^2)+(vector1["y"]^2)+(vector1["z"]^2))
	local absoluteB = math.sqrt((vector2["x"]^2)+(vector2["y"]^2)+(vector2["z"]^2))
	--now angle :
	local product = absoluteA*absoluteB
	return math.acos(sumtotal/product)
end

function point_direction(x1, y1, x2, y2)
	local v1 = {};
	local v2 = {};

	v1['x'] = 1;
	v1['y'] = 0;
	v1['z'] = 0;

	v2['x'] = x2 - x1;
	v2['y'] = y2 - y1;
	v2['z'] = 0;

	local a = math.deg(get_angle(v1, v2));

	if (y2 > y1) then
		a = -a + 360;
	end

	return (a);
end

function bullInit(i)
	local n = 'b'..i;
	local t = bProp[n..'.type'];

	if (t == 'blaster') then
		--debugPrint('hola');
		bProp[n..'.safe'] = true;
		bProp[n..'.iniAng'] = bProp[n..'.ang'];
		bProp[n..'.iniX'] = bProp[n..'.x'];
		bProp[n..'.iniY'] = bProp[n..'.y'];
		bProp[n..'.state'] = 0;
		bProp[n..'.extend'] = 1;

		if (bProp[n..'.exArg'] == nil) then bProp[n..'.exArg'] = 1 end

		bProp[n..'.ang'] = bProp[n..'.ang'] + 600;
		bProp[n..'.x'] = bProp[n..'.x'] - math.cos(math.rad(bProp[n..'.iniAng'])) * 1280;
		bProp[n..'.y'] = bProp[n..'.y'] + math.sin(math.rad(bProp[n..'.iniAng'])) * 1280;
		setProperty(n..'.alpha', 1);
		stopSound('blaster');
		playSound('blaster', 0.3, 'blaster');

		setProperty(n..'.x', boxX + bProp[n..'.x']);
		setProperty(n..'.y', boxY + bProp[n..'.y']);
	elseif (t == 'blast') then
		bProp[n..'.w'] = 430 * 3;
		--bProp[n..'.h'] = 18 * 3;
		bProp[n..'.safe'] = true;
		bProp[n..'.exDir'] = 1;
		bProp[n..'.sc'] = 2;

		setProperty(n..'.scale.x', 3);
		setProperty(n..'.scale.y', 2);
		setProperty(n..'.alpha', 1);
		setProperty(n..'.visible', false);

		bProp[n..'.adj'] = false;

	elseif (t == 'jkblaster') then
		bProp[n..'.safe'] = true;
		bProp[n..'.iniAng'] = bProp[n..'.ang'];
		bProp[n..'.iniX'] = bProp[n..'.x'];
		bProp[n..'.iniY'] = bProp[n..'.y'];
		bProp[n..'.state'] = 0;
		bProp[n..'.extend'] = 1;

		if (bProp[n..'.exArg'] == nil) then bProp[n..'.exArg'] = 1 end

		bProp[n..'.ang'] = bProp[n..'.ang'] + 600;
		bProp[n..'.x'] = bProp[n..'.x'] - math.cos(math.rad(bProp[n..'.iniAng'])) * 1280;
		bProp[n..'.y'] = bProp[n..'.y'] + math.sin(math.rad(bProp[n..'.iniAng'])) * 1280;
		setProperty(n..'.alpha', 1);
		stopSound('blaster');
		playSound('blaster', 0.5, 'blaster');

		setProperty(n..'.x', boxX + bProp[n..'.x']);
		setProperty(n..'.y', boxY + bProp[n..'.y']);
	
	elseif (t == 'blasterInvis') then
		bProp[n..'.safe'] = true;
		bProp[n..'.iniAng'] = bProp[n..'.ang'];
		bProp[n..'.iniX'] = bProp[n..'.x'];
		bProp[n..'.iniY'] = bProp[n..'.y'];
		bProp[n..'.state'] = 0;
		bProp[n..'.extend'] = 1;

		if (bProp[n..'.exArg'] == nil) then bProp[n..'.exArg'] = 1 end

		bProp[n..'.ang'] = bProp[n..'.ang'] + 600;
		bProp[n..'.x'] = bProp[n..'.x'] - math.cos(math.rad(bProp[n..'.iniAng'])) * 1280;
		bProp[n..'.y'] = bProp[n..'.y'] + math.sin(math.rad(bProp[n..'.iniAng'])) * 1280;
		setProperty(n..'.alpha', 1);
		stopSound('rise');
		playSound('rise', 1, 'rise');

		setProperty(n..'.x', boxX + bProp[n..'.x']);
		setProperty(n..'.y', boxY + bProp[n..'.y']);

	elseif (t == 'blastInvis') then
		bProp[n..'.w'] = 430 * 3;
		--bProp[n..'.h'] = 18 * 3;
		bProp[n..'.safe'] = true;
		bProp[n..'.exDir'] = 1;
		bProp[n..'.sc'] = 2;

		setProperty(n..'.scale.x', 3);
		setProperty(n..'.scale.y', 2);
		setProperty(n..'.alpha', 1);
		setProperty(n..'.visible', false);

		bProp[n..'.adj'] = false;

	elseif (t == 'GasterBlastBase') then
		bProp[n..'.safe'] = true;
		bProp[n..'.iniAng'] = bProp[n..'.ang'];
		bProp[n..'.iniX'] = bProp[n..'.x'];
		bProp[n..'.iniY'] = bProp[n..'.y'];
		bProp[n..'.state'] = 0;
		bProp[n..'.extend'] = 1;

		if (bProp[n..'.exArg'] == nil) then bProp[n..'.exArg'] = 1 end
			bProp[n..'.ang'] = bProp[n..'.ang'] + 600;
			bProp[n..'.x'] = bProp[n..'.x'] - math.cos(math.rad(bProp[n..'.iniAng'])) * 1280;
			bProp[n..'.y'] = bProp[n..'.y'] + math.sin(math.rad(bProp[n..'.iniAng'])) * 1280;
			setProperty(n..'.alpha', 1); 

			setProperty(n..'.x', boxX + bProp[n..'.x']);
			setProperty(n..'.y', boxY + bProp[n..'.y']);

	elseif (t == 'GasterBlastBlast') then
		bProp[n..'.w'] = 430 * 3;
		--bProp[n..'.h'] = 18 * 3;
		bProp[n..'.safe'] = true;
		bProp[n..'.exDir'] = 1;
		bProp[n..'.sc'] = 2;

		setProperty(n..'.scale.x', 3);
		setProperty(n..'.scale.y', 2);
		setProperty(n..'.alpha', 1);
		setProperty(n..'.visible', false);

		bProp[n..'.adj'] = false;

	elseif (t == 'GasterWarnBase') then
		bProp[n..'.safe'] = true;
		bProp[n..'.iniAng'] = bProp[n..'.ang'];
		bProp[n..'.iniX'] = bProp[n..'.x'];
		bProp[n..'.iniY'] = bProp[n..'.y'];
		bProp[n..'.state'] = 0;
		bProp[n..'.extend'] = 1;

		if (bProp[n..'.exArg'] == nil) then bProp[n..'.exArg'] = 1 end
			bProp[n..'.ang'] = bProp[n..'.ang'] + 600;
			bProp[n..'.x'] = bProp[n..'.x'] - math.cos(math.rad(bProp[n..'.iniAng'])) * 1280;
			bProp[n..'.y'] = bProp[n..'.y'] + math.sin(math.rad(bProp[n..'.iniAng'])) * 1280;
			setProperty(n..'.alpha', 1);
			stopSound('GasterHandAppear');
			playSound('GasterHandAppear', 1, 'GasterHandAppear');

			setProperty(n..'.x', boxX + bProp[n..'.x']);
			setProperty(n..'.y', boxY + bProp[n..'.y']);

	elseif (t == 'GasterWarnBlast') then
		bProp[n..'.w'] = 430 * 3;
		bProp[n..'.safe'] = true;
		bProp[n..'.exDir'] = 1;
		bProp[n..'.sc'] = 2;

		setProperty(n..'.scale.x', 3);
		setProperty(n..'.scale.y', 2);
		setProperty(n..'.alpha', 1);
		setProperty(n..'.visible', false);

		bProp[n..'.adj'] = false;

	end

	if (bProp[n..'.plat']) then
		bProp[n..'.h'] = bProp[n..'.h'] * 1.4;
	end

end

function bullSpawn(type, xx, yy, hsp, vsp, dmg, ang, exArg, exArg2)
	hsp = hsp or 0;
	vsp = vsp or 0;
	dmg = dmg or 1;
	ang = ang or 0;
	exArg = exArg or nil;
	exArg2 = exArg2 or nil
	local name = 'b'..bInd;
	table.insert(spawned, name);
	bProp[name..'.type'] = type;
	bProp[name..'.x'] = xx;
	bProp[name..'.y'] = yy;
	bProp[name..'.hsp'] = hsp;
	bProp[name..'.vsp'] = vsp;
	bProp[name..'.dmg'] = dmg;
	bProp[name..'.ang'] = ang;
	bProp[name..'.exArg'] = exArg;
	bProp[name..'.exArg2'] = exArg2;
	bProp[name..'.unspawn'] = false;
	bProp[name..'.iTime'] = bTimer;

	bProp[name..'.safe'] = false;
	bProp[name..'.adj'] = true;
	bProp[name..'.plat'] = false;
	if (dmg == 0) then bProp[name..'.safe'] = true end

	local t = type;
	local spr = t;

	--here special cases
	if (t == 'plat1' or t == 'plat2' or t == 'plat3') then
		bProp[name..'.plat'] = true;
		bProp[name..'.safe'] = true;
	end

	makeLuaSprite(name, 'ut/bullets/'..spr, boxX + xx, boxY + yy);
	setProperty(name..'.offset.x', getProperty(name..'.width') / 2);
	setProperty(name..'.offset.y', getProperty(name..'.height') / 2);

	bProp[name..'.w'] = getProperty(name..'.width') * 2;
	bProp[name..'.h'] = getProperty(name..'.height') * 2;

	setProperty(name..'.scale.x', 2);
	setProperty(name..'.scale.y', 2);
	setProperty(name..'.alpha', 0);
	setProperty(name..'.angle', ang);
	setProperty(name..'.antialiasing', false);
	addLuaSprite(name, true);
	setObjectCamera(name, 'camHUD');

	bullInit(bInd);

	bInd = bInd + 1;

	return(name);
end

sndTime = 0.0;
function bullUpdate(elapsed)
	hRemove = false;
	bts = bts + elapsed * 60
	for i = 0, bInd - 1, 1 do
		local n = 'b'..i;

		--moving
		succ = bTimer
		while (succ < math.floor(bts)) do
			bullStep(i);
			succ = succ + 1;
		end

		bProp[n..'.x'] = bProp[n..'.x'] + bProp[n..'.hsp'] * (elapsed * 60);
		bProp[n..'.y'] = bProp[n..'.y'] + bProp[n..'.vsp'] * (elapsed * 60);

		local blX = bProp[n..'.x'];
		local blY = bProp[n..'.y'];

		setProperty(n..'.x', boxX + blX);
		setProperty(n..'.y', boxY + blY);
		setProperty(n..'.angle', -bProp[n..'.ang']);
		

		--collision
		local lX = -bProp[n..'.w'] / 2 - 8;
		local rX = bProp[n..'.w'] / 2 + 8;
		local uY = -bProp[n..'.h'] / 2 - 8;
		local dY = bProp[n..'.h'] / 2 + 8;

		local xdif = pX - bProp[n..'.x'];
		local ydif = pY - bProp[n..'.y'];
		local dis = math.sqrt((xdif) ^ 2 + (ydif) ^ 2);

		local vec1 = {};
		local vec2 = {};

		vec1['x'] = math.cos(math.rad(bProp[n..'.ang']));
		vec1['y'] = math.sin(math.rad(bProp[n..'.ang']));
		vec1['z'] = 0;

		vec2['x'] = xdif;
		vec2['y'] = -ydif;
		vec2['z'] = 0;
		local bang = get_angle(vec1, vec2);
		--local bang = math.acos(xdif / dis) - math.rad(bProp[n..'.ang']);
		--local bangy = math.asin(ydif / dis) - math.rad(bProp[n..'.ang']);
		local ppX = math.cos(bang) * dis;
		local ppY = math.sin(bang) * dis;

		local hitIt = (ppX > lX and ppX < rX and ppY > uY and ppY < dY);

		local dmg = bProp[n..'.dmg'];

		if (dmg < 0) then
			setProperty(n..'.color', getColorFromHex('00A1FF'));
			hitIt = hitIt and moving;
		end

		if ((bProp[n..'.unspawn'] == false and bProp[n..'.safe'] == false and canMove) and hitIt) then
			if (hRemove == false) then
				local diffDmg = 2;

				if (difficultyName == 'Easy') then
					diffDmg = diffDmg / 3
				elseif (difficultyName == 'Normal') then
					diffDmg = diffDmg / 1.8
				elseif (difficultyName == 'Hard') then
					diffDmg = diffDmg / 1.2   
				elseif (difficultyName == 'Hell') then
					diffDmg = diffDmg / 1.4 -- The attacks in Hell are really hard, i didn't want to be that evil...  
				end

				local indDmg = math.abs(dmg);
				if (dmgMulti ~= 1) then indDmg = dmgMulti; end
				setProperty('health', getProperty('health') - (elapsed / 1.1) * diffDmg * indDmg * healthLossMult);
				damageTaken = damageTaken + (elapsed * 30) * diffDmg * indDmg * healthLossMult;
				dtRed = dtrMax;
				if (instakillOnMiss) then
					forceKill = true;
				end
				hRemove = true;
			end
		end

		if (bProp[n..'.plat'] and canMove and hitIt) then
			if (vsp >= 0 and pY > blY - 16 and pY < blY + 3) then --and ppY < 8) then
				vsp = 0;
				ground = true;
				pY = blY - 15;
				pX = pX + (bProp[n..'.hsp'] * (elapsed * 60));
			end
		end

		if (bProp[n..'.unspawn']) then
			local ga = getProperty(n..'.alpha');
			setProperty(n..'.alpha', ga - elapsed * 5);
			--if (ga <= 0)
		elseif (bProp[n..'.adj']) then
			setProperty(n..'.alpha', getProperty(n..'.alpha') + elapsed * 5);
		end
	end

	while (bTimer < math.floor(bts)) do
		bTimer = bTimer + 1;
	end

	if (hRemove) then
		if (sndTime <= 0) then 
			playSound('snd_hurt1', 1);
			sndTime = 1;
		else
			sndTime = sndTime - elapsed * 30;
		end
	else
		sndTime = 0;
	end
end

function bullStep(i)
	local n = 'b'..i;
	local t = succ - bProp[n..'.iTime'];
	local tp = bProp[n..'.type'];

	if (tp == 'blaster') then
		local s = bProp[n..'.state'];
		if (s == 0) then
			bProp[n..'.x'] = bProp[n..'.x'] + (bProp[n..'.iniX'] - bProp[n..'.x']) / 5;
			bProp[n..'.y'] = bProp[n..'.y'] + (bProp[n..'.iniY'] - bProp[n..'.y']) / 5;
			bProp[n..'.ang'] = bProp[n..'.ang'] + (bProp[n..'.iniAng'] - bProp[n..'.ang']) / 5;

			bProp[n..'.esp'] = 0;
			if (t == 40) then
				bProp[n..'.state'] = 1;
			end
		elseif (s == 1) then
			bProp[n..'.esp'] = bProp[n..'.esp'] + 0.006;
			bProp[n..'.extend'] = bProp[n..'.extend'] - bProp[n..'.esp'];

			if (t == 48) then
				bProp[n..'.extend'] = 1.2;
				bProp[n..'.state'] = 2;
				bProp[n..'.esp'] = 0;

				removeLuaSprite(n, true);
				makeLuaSprite(n, 'ut/bullets/blasterOpen', boxX + bProp[n..'.x'], boxY + bProp[n..'.y']);
				setProperty(n..'.offset.x', getProperty(n..'.width') / 2);
				setProperty(n..'.offset.y', getProperty(n..'.height') / 2);
				setProperty(n..'.antialiasing', false);
				addLuaSprite(n, true);
				setObjectCamera(n, 'camHUD');
				stopSound('blast_shoot');
				playSound('blast_shoot', 0.5, 'blast_shoot');

				local b = bullSpawn('blast', 0, 0, 0, 0, bProp[n..'.dmg'], 0);
				bProp[b..'.ang'] = bProp[n..'.ang'];
				bProp[n..'.blast'] = b;
				bProp[b..'.exArg'] = bProp[n..'.exArg'];

				triggerEvent('Screen Shake', '0.2,0.005', '0.2,0.005');
			end
		elseif (s == 2) then
			bProp[n..'.esp'] = bProp[n..'.esp'] + 0.3;
			bProp[n..'.hsp'] = -math.cos(math.rad(bProp[n..'.ang'])) * bProp[n..'.esp'];
			bProp[n..'.vsp'] = math.sin(math.rad(bProp[n..'.ang'])) * bProp[n..'.esp'];
			bProp[n..'.extend'] = 1 + math.sin(math.rad(t * 30)) / 20;

			local b = bProp[n..'.blast'];
			setProperty(b..'.visible', true);
			local bdis = (430 * 3 / 2 + 60);
			bProp[b..'.x'] = bProp[n..'.x'] + (math.cos(math.rad(bProp[b..'.ang'])) * bdis);
			bProp[b..'.y'] = bProp[n..'.y'] - (math.sin(math.rad(bProp[b..'.ang'])) * bdis);
		end

		setProperty(n..'.scale.y', 3 * bProp[n..'.extend'] * bProp[n..'.exArg']);
		setProperty(n..'.scale.x', 3 * (1 + (1 - bProp[n..'.extend']) / 3));

	elseif (tp == 'blast') then
		bProp[n..'.h'] = 16 * getProperty(n..'.scale.y');
		bProp[n..'.sc'] = bProp[n..'.sc'] + (bProp[n..'.exDir'] * 0.7);
		if (bProp[n..'.sc'] > 4.5) then
			bProp[n..'.exDir'] = -0.27;
		end
		if (bProp[n..'.sc'] < 3) then
			setProperty(n..'.alpha', getProperty(n..'.alpha') - 0.04);
			if (bProp[n..'.sc'] < 0.5) then
				bProp[n..'.unspawn'] = true;
			end
		end
		setProperty(n..'.scale.y', bProp[n..'.sc'] * bProp[n..'.exArg'] * 1.2);
		bProp[n..'.safe'] = false;
		
	elseif (tp == 'jkblaster') then
		local s = bProp[n..'.state'];
		if (s == 0) then
			bProp[n..'.x'] = bProp[n..'.x'] + (bProp[n..'.iniX'] - bProp[n..'.x']) / 5;
			bProp[n..'.y'] = bProp[n..'.y'] + (bProp[n..'.iniY'] - bProp[n..'.y']) / 5;
			bProp[n..'.ang'] = bProp[n..'.ang'] + (bProp[n..'.iniAng'] - bProp[n..'.ang']) / 5;

			bProp[n..'.esp'] = 0;
		end

		setProperty(n..'.scale.y', 3 * bProp[n..'.extend'] * bProp[n..'.exArg']);
		setProperty(n..'.scale.x', 3 * (1 + (1 - bProp[n..'.extend']) / 3));

		elseif (tp == 'blasterInvis') then
			local s = bProp[n..'.state'];
			if (s == 0) then
				bProp[n..'.x'] = bProp[n..'.x'] + (bProp[n..'.iniX'] - bProp[n..'.x']) / 5;
				bProp[n..'.y'] = bProp[n..'.y'] + (bProp[n..'.iniY'] - bProp[n..'.y']) / 5;
				bProp[n..'.ang'] = bProp[n..'.ang'] + (bProp[n..'.iniAng'] - bProp[n..'.ang']) / 5;
	
				bProp[n..'.esp'] = 0;
				if (t == 40) then
					bProp[n..'.state'] = 1;
				end
			elseif (s == 1) then
				bProp[n..'.esp'] = bProp[n..'.esp'] + 0.006;
				bProp[n..'.extend'] = bProp[n..'.extend'] - bProp[n..'.esp'];
	
				if (t == 48) then
					bProp[n..'.extend'] = 1.2;
					bProp[n..'.state'] = 2;
					bProp[n..'.esp'] = 0;
	
					removeLuaSprite(n, true);
					makeLuaSprite(n, 'ut/bullets/blasterInvisOpen', boxX + bProp[n..'.x'], boxY + bProp[n..'.y']);
					setProperty(n..'.offset.x', getProperty(n..'.width') / 2);
					setProperty(n..'.offset.y', getProperty(n..'.height') / 2);
					setProperty(n..'.antialiasing', false);
					addLuaSprite(n, true);
					setObjectCamera(n, 'camHUD');
					stopSound('sansattack');
					playSound('sansattack', 1, 'sansattack');
	
					local b = bullSpawn('blastInvis', 0, 0, 0, 0, bProp[n..'.dmg'], 0);
					bProp[b..'.ang'] = bProp[n..'.ang'];
					bProp[n..'.blastInvis'] = b;
					bProp[b..'.exArg'] = bProp[n..'.exArg'];
	
					triggerEvent('Screen Shake', '0.2,0.005', '0.2,0.005');
				end
			elseif (s == 2) then
				bProp[n..'.esp'] = bProp[n..'.esp'] + 0.3;
	
				local b = bProp[n..'.blastInvis'];
				setProperty(b..'.visible', true);
				local bdis = (-40 * 3 / 2 + 60);
				bProp[b..'.x'] = bProp[n..'.x'] + (math.cos(math.rad(bProp[b..'.ang'])) * bdis);
				bProp[b..'.y'] = bProp[n..'.y'] - (math.sin(math.rad(bProp[b..'.ang'])) * bdis);
			end
	
			setProperty(n..'.scale.y', 3 * bProp[n..'.extend'] * bProp[n..'.exArg']);
			setProperty(n..'.scale.x', 3 * (1 + (1 - bProp[n..'.extend']) / 3));

		elseif (tp == 'blastInvis') then
			bProp[n..'.h'] = 16 * getProperty(n..'.scale.y');
			bProp[n..'.sc'] = bProp[n..'.sc'] + (bProp[n..'.exDir'] * 0.7);
			if (bProp[n..'.sc'] > 4.5) then
				bProp[n..'.exDir'] = -0.27;
			end
			if (bProp[n..'.sc'] < 3) then
				setProperty(n..'.alpha', getProperty(n..'.alpha') - 0.02);
				if (bProp[n..'.sc'] < 0.5) then
					bProp[n..'.unspawn'] = true;
				end
			end
			setProperty(n..'.scale.x', bProp[n..'.sc'] * bProp[n..'.exArg'] * 1.2);
			bProp[n..'.safe'] = false;

		elseif (tp == 'GasterBlastBase') then
				local s = bProp[n..'.state'];
				if (s == 0) then
					bProp[n..'.x'] = bProp[n..'.x'] + (bProp[n..'.iniX'] - bProp[n..'.x']) / 5;
					bProp[n..'.y'] = bProp[n..'.y'] + (bProp[n..'.iniY'] - bProp[n..'.y']) / 5;
					bProp[n..'.ang'] = bProp[n..'.ang'] + (bProp[n..'.iniAng'] - bProp[n..'.ang']) / 5;
		
					bProp[n..'.esp'] = 0;
					if (t == 86) then
						bProp[n..'.state'] = 1;
					end
				elseif (s == 1) then
					bProp[n..'.esp'] = bProp[n..'.esp'] + 0.006;
					bProp[n..'.extend'] = bProp[n..'.extend'] - bProp[n..'.esp'];
		
					if (t == 90) then
						bProp[n..'.extend'] = 1.2;
						bProp[n..'.state'] = 2;
						bProp[n..'.esp'] = 0;
						stopSound('GasterHandShoot');
						playSound('GasterHandShoot', 0.5, 'GasterHandShoot');
		
						local b = bullSpawn('GasterBlastBlast', 0, 0, 0, 0, bProp[n..'.dmg'], 0);
						bProp[b..'.ang'] = bProp[n..'.ang'];
						bProp[n..'.GasterBlastBlast'] = b;
						bProp[b..'.exArg'] = bProp[n..'.exArg'];
		
						triggerEvent('Screen Shake', '0.2,0.01', '0.2, 0.01');
					end
				elseif (s == 2) then
					bProp[n..'.esp'] = bProp[n..'.esp'] + 0.3;
					bProp[n..'.hsp'] = -math.cos(math.rad(bProp[n..'.ang'])) * bProp[n..'.esp'];
					bProp[n..'.vsp'] = math.sin(math.rad(bProp[n..'.ang'])) * bProp[n..'.esp'];
					bProp[n..'.extend'] = 1 + math.sin(math.rad(t * 30)) / 20;
		
					local b = bProp[n..'.GasterBlastBlast'];
					setProperty(b..'.visible', true);
					local bdis = (400 * 3 / 2 + 60);
					bProp[b..'.x'] = bProp[n..'.x'] + (math.cos(math.rad(bProp[b..'.ang'])) * bdis);
					bProp[b..'.y'] = bProp[n..'.y'] - (math.sin(math.rad(bProp[b..'.ang'])) * bdis);
				end
		
				setProperty(n..'.scale.y', 3 * bProp[n..'.extend'] * bProp[n..'.exArg']);
				setProperty(n..'.scale.x', 3 * (1 + (1 - bProp[n..'.extend']) / 3));

			elseif (tp == 'GasterBlastBlast') then
				bProp[n..'.h'] = 16 * getProperty(n..'.scale.y');
				bProp[n..'.sc'] = bProp[n..'.sc'] + (bProp[n..'.exDir'] * 0.7);
				if (bProp[n..'.sc'] > 4.5) then
					bProp[n..'.exDir'] = -0.27;
				end
				if (bProp[n..'.sc'] < 3) then
					setProperty(n..'.alpha', getProperty(n..'.alpha') - 0.04);
					if (bProp[n..'.sc'] < 0.5) then
						bProp[n..'.unspawn'] = true;
					end
				end
				setProperty(n..'.scale.y', bProp[n..'.sc'] * bProp[n..'.exArg'] * 1.2);
				bProp[n..'.safe'] = false;

			elseif (tp == 'GasterWarnBase') then
				local s = bProp[n..'.state'];
				if (s == 0) then
					bProp[n..'.x'] = bProp[n..'.x'] + (bProp[n..'.iniX'] - bProp[n..'.x']) / 5;
					bProp[n..'.y'] = bProp[n..'.y'] + (bProp[n..'.iniY'] - bProp[n..'.y']) / 5;
					bProp[n..'.ang'] = bProp[n..'.ang'] + (bProp[n..'.iniAng'] - bProp[n..'.ang']) / 1;
		
					bProp[n..'.esp'] = 0;
					if (t == 20) then
						bProp[n..'.state'] = 1;
					end
				elseif (s == 1) then
					bProp[n..'.esp'] = bProp[n..'.esp'] + 0.006;
					bProp[n..'.extend'] = bProp[n..'.extend'] - bProp[n..'.esp'];
		
					if (t == 24) then
						bProp[n..'.extend'] = 1.2;
						bProp[n..'.state'] = 2;
						bProp[n..'.esp'] = 0;
						--stopSound('blast_shoot');
						--playSound('blast_shoot', 0.5, 'blast_shoot');
		
						local b = bullSpawn('GasterWarnBlast', 0, 0, 0, 0, 0, 0);
						bProp[b..'.ang'] = bProp[n..'.ang'];
						bProp[n..'.GasterWarnBlast'] = b;
						bProp[b..'.exArg'] = bProp[n..'.exArg'];

					end
				elseif (s == 2) then
		
					local b = bProp[n..'.GasterWarnBlast'];
					setProperty(b..'.visible', true);
					local bdis = (400 * 3 / 2 + 60);
					bProp[b..'.x'] = bProp[n..'.x'] + (math.cos(math.rad(bProp[b..'.ang'])) * bdis);
					bProp[b..'.y'] = bProp[n..'.y'] - (math.sin(math.rad(bProp[b..'.ang'])) * bdis);
				end
		
				setProperty(n..'.scale.y', 3 * bProp[n..'.extend'] * bProp[n..'.exArg']);
				setProperty(n..'.scale.x', 3 * (1 + (1 - bProp[n..'.extend']) / 3));

			elseif (tp == 'GasterWarnBlast') then
				if (bProp[n..'.sc'] > 4.5) then
					bProp[n..'.exDir'] = -0.27;
				end
				if (bProp[n..'.sc'] < 3) then
					setProperty(n..'.alpha', getProperty(n..'.alpha') - 0.01);
					if (bProp[n..'.sc'] < 0.5) then
						bProp[n..'.unspawn'] = true;
					end
				end;
			
	elseif (tp == 'throwBones') then
		local wt = 20;
		local st = 5;
		local un = 25;
		if (t < wt) then
			bProp[n..'.adj'] = false;
			setProperty(n..'.alpha', 0);
		end
		if (t == wt) then
			stopSound('rise');
			playSound('rise', 1, 'rise');
			local a = math.rad(bProp[n..'.ang']);
			bProp[n..'.hsp'] = math.cos(a) * 13;
			bProp[n..'.vsp'] = -math.sin(a) * 13;
			setProperty(n..'.alpha', 1);
			bProp[n..'.adj'] = true;
		elseif (t == wt + st) then
			bProp[n..'.hsp'] = 0;
			bProp[n..'.vsp'] = 0;
		elseif (t == wt + un) then
			bProp[n..'.unspawn'] = true;
			local a = math.rad(bProp[n..'.ang'] + 180);
			bProp[n..'.hsp'] = math.cos(a) * 10;
			bProp[n..'.vsp'] = -math.sin(a) * 10;
		end
		if (t >= wt + st and t <= wt + st + 4 and 0 == 1) then
			bProp[n..'.x'] = bProp[n..'.x'] + math.random(-1, 1);
			bProp[n..'.y'] = bProp[n..'.y'] + math.random(-1, 1);
		end
	elseif (tp == 'warn') then
		if (t == 1) then
			bProp[n..'.adj'] = false;
			setProperty(n..'.alpha', 1);
		elseif (t == 20) then
			setProperty(n..'.alpha', 0);
			bProp[n..'.unspawn'] = true;
		end
	elseif (tp == 'keys') then
		if (t >= 100) then
			bProp[n..'.unspawn'] = true;
		end
	elseif (tp == 'boneMini') then
		bProp[n..'.ang'] = bProp[n..'.ang'] + 7;
	elseif (tp == 'BoneBlaster') then
			bProp[n..'.ang'] = bProp[n..'.ang'] + 3.5;
		if (t == 48) then
			setProperty(n..'.alpha', 0.66);
		elseif (t == 50) then
			setProperty(n..'.alpha', 0.33);
		elseif (t == 52) then
			setProperty(n..'.alpha', 0);
			bProp[n..'.unspawn'] = true;
		end
	elseif (tp == 'GasterHand') then
	if (t == 96) then
		setProperty(n..'.alpha', 0.66);
	elseif (t == 98) then
		setProperty(n..'.alpha', 0.33);
	elseif (t == 100) then
		setProperty(n..'.alpha', 0);
		bProp[n..'.unspawn'] = true;
	end
	elseif (tp == 'GasterWarn') then
	if (t == 24) then
		setProperty(n..'.alpha', 0.66);
	elseif (t == 26) then
		setProperty(n..'.alpha', 0.33);
	elseif (t == 28) then
		setProperty(n..'.alpha', 0);
		bProp[n..'.unspawn'] = true;	
	end
	elseif (tp == 'FinalBall') then
		bProp[n..'.ang'] = bProp[n..'.ang'] + 7;
	elseif (tp == 'boneV25') then
		bProp[n..'.ang'] = bProp[n..'.ang'] + 4;
	elseif (tp == 'boneV26') then
		bProp[n..'.ang'] = bProp[n..'.ang'] - 4;
	elseif (tp == 'warnBlast') then
		if (t == 44) then
			setProperty(n..'.alpha', 0.1);
		elseif (t == 46) then
			setProperty(n..'.alpha', 0.05);
		elseif (t == 48) then
			setProperty(n..'.alpha', 0);
			bProp[n..'.unspawn'] = true;	
		end
	end
end 

function killAll()
	for i = 0, bInd - 1, 1 do
		local n = 'b'..i;
		removeLuaSprite(n, true);
	end
	bInd = 0;
	spawned = {};
	bProp = {};
end

function unspawnAll()
	for i = 0, bInd - 1, 1 do
		local n = 'b'..i;
		bProp[n..'.unspawn'] = true;
		--removeLuaSprite(n, true);
	end
end

function onCreate()
	if (middlescroll) then
		boxX = 1280 / 2;
	end
	

	makeLuaSprite('box', 'ut/box', boxX, boxY);
	setProperty('box.offset.x', 50);
	setProperty('box.offset.y', 50);
	setProperty('box.antialiasing', false);
	setObjectCamera('box', 'camHUD');

	makeLuaSprite('boxB', 'ut/boxBorder', boxX, boxY);
	setProperty('boxB.offset.x', 50);
	setProperty('boxB.offset.y', 50);
	setProperty('boxB.antialiasing', false);
	setObjectCamera('boxB', 'camHUD');

	addLuaSprite('boxB', false);
	addLuaSprite('box', false);

	makeLuaSprite('p', 'ut/soul', boxX, boxY);
	setProperty('p.offset.x', 8);
	setProperty('p.offset.y', 8);
	setProperty('p.scale.x', 2);
	setProperty('p.scale.y', 2);
	setProperty('p.antialiasing', false);

	addLuaSprite('p', false);
	setObjectCamera('p', 'camHUD');


	setTextAlignment('hitsTxt', 'center');
	if (not downscroll) then
		setProperty('hitsTxt.y', 720 - 150);
	end
	addLuaText('hitsTxt', true);
	setObjectCamera('hitsTxt', 'camHUD');
end

-- -350 + Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.5) * 12.5;
moving = false;
ground = false;
rxm = 0;
rym = 0;

dtRed = 0;
dtrMax = 10;
notice = 0;
function onUpdate(elapsed)

	
	if keyJustPressed('space') and (dogModeSwitch == true) then
		dogModesteps = dogModesteps + 1
	end

	if dogModesteps == 3 then
		dogModeactive = true
		playSound('Undertale_DogMode', 4)
		dogModesteps = 4

		makeLuaSprite('dogModeIndicator', 'dogModeIndicator', 0, -30)
		setObjectCamera('dogModeIndicator', 'other')
		scaleObject('dogModeIndicator', 0.5, 0.5);
		setProperty('dogModeIndicator.flipY', true);
		setProperty('dogModeIndicator.flipX', true);
		addLuaSprite('dogModeIndicator', true)
	end

	local toW = targetW;
	local toH = targetH;

	if (canMove == false) then
		toW = 0;
		toH = 0;
	end

	boxW = boxW + ((toW - boxW) / (10 / (elapsed * 60)));
	boxH = boxH + ((toH - boxH) / (10 / (elapsed * 60)));

	if (math.ceil(boxW) == toW or math.floor(boxW) == toW) then boxW = toW end
	if (math.ceil(boxH) == toH or math.floor(boxH) == toH) then boxH = toH end

	setProperty('box.scale.x', boxW / 100);
	setProperty('box.scale.y', boxH / 100);

	setProperty('boxB.scale.x', (boxW + 16) / 100);
	setProperty('boxB.scale.y', (boxH + 16) / 100);

	local hColor = getColorFromHex("FF0000");
	if (isBlue) then hColor = getColorFromHex("0000FF") end
	setProperty('p.color', hColor);

	local lBd = -boxW / 2 + 16;
	local rBd = boxW / 2 - 16;
	local uBd = -boxH / 2 + 16;
	local dBd = boxH / 2 - 16;

	--hRemove = true;
	moving = false;
	local lX = pX;
	local lY = pY;
	if (canMove) then

		local lxm = rxm;
		local lym = rym;

		local xmov = 0;
		local ymov = 0;

		local gp = false;
		if (getPropertyFromClass('flixel.FlxG', 'gamepads.numActiveGamepads') > 0) then
			gp = true;
		end

		keyMoveUtRight = getPropertyFromClass('flixel.FlxG', 'keys.pressed.RIGHT') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.D') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.L') or
		(gp and (getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.DPAD_RIGHT') or getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.LEFT_STICK_DIGITAL_RIGHT')));
		
		keyMoveUtLeft = getPropertyFromClass('flixel.FlxG', 'keys.pressed.LEFT') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.A') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.J') or
		(gp and (getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.DPAD_LEFT') or getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.LEFT_STICK_DIGITAL_LEFT')));
		
		keyMoveUtUp = getPropertyFromClass('flixel.FlxG', 'keys.pressed.UP') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.W') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.I') or
		(gp and (getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.DPAD_UP') or getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.LEFT_STICK_DIGITAL_UP')));
		
		keyMoveUtDown = getPropertyFromClass('flixel.FlxG', 'keys.pressed.DOWN') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.S') or getPropertyFromClass('flixel.FlxG', 'keys.pressed.K') or
		(gp and (getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.DPAD_DOWN') or getPropertyFromClass('flixel.FlxG', 'gamepads.lastActive.pressed.LEFT_STICK_DIGITAL_DOWN')));
		
		
		if (keyMoveUtRight) then
			xmov = xmov + 1;
		end

		if (keyMoveUtLeft) then
			xmov = xmov - 1;
		end

		if (keyMoveUtDown) then
			ymov = ymov + 1;
		end

		if (keyMoveUtUp) then
			ymov = ymov - 1;
		end

		rxm = xmov;
		rym = ymov;

		--if (getPropertyFromGroup('playerStrums', 3, 'animation.curAnim.name') == 'pressed') then
		local spd = 4.2 * (elapsed * 60);

		local jSpd = 10;
		if (isBlue) then
			if (ground == false) then
				vsp = vsp + grav * elapsed * 60;
			end

			if ground and ((gravDir == 0 and xmov == -1) or (gravDir == 180 and xmov == 1) or (gravDir == 90 and ymov == 1) or (gravDir == 270 and ymov == -1)) then
				vsp = -jSpd;
			end

			if (vsp < 0 and (((gravDir == 0 or gravDir == 180) and xmov == 0 and lxm ~= 0) or ((gravDir == 90 or gravDir == 270) and ymov == 0 and lym ~= 0))) then
				vsp = vsp / 4;
			end
			if (gravDir == 0 or gravDir == 180) then
				xmov = 0;
			elseif (gravDir == 90 or gravDir == 270) then
				ymov = 0;
			end

			setProperty('p.angle', -gravDir - 90);
		else
			vsp = 0;
			setProperty('p.angle', 0);
		end

		local vBy = vsp * elapsed * 60;
		pX = pX + xmov * spd + math.cos(math.rad(gravDir)) * vBy;
		pY = pY + ymov * spd - math.sin(math.rad(gravDir)) * vBy;

		if (boxA < 1) then boxA = boxA + elapsed*3 end;
	else
		if (boxA > 0) then boxA = boxA - elapsed*3 end;
	end

	ground = false;

	if (pX < lBd) then
		pX = lBd;

		if (gravDir == 180) then
			vsp = 0;
			ground = true;
		end
	elseif (pX > rBd) then
		pX = rBd;

		if (gravDir == 0) then
			vsp = 0;
			ground = true;
		end
	end

	if (pY < uBd) then
		pY = uBd;

		if (gravDir == 90) then
			vsp = 0;
			ground = true;
		elseif (gravDir == 270) then
			vsp = 0;
		end
	elseif (pY > dBd) then
		pY = dBd;

		if (gravDir == 270) then
			vsp = 0;
			ground = true;
		elseif (gravDir == 90) then
			vsp = 0;
		end
	end

	if (ground and heavy) then
		triggerEvent('Screen Shake', '0.2,0.005', '0.2,0.005');
		playSound('impact', 1);
		act = 1;
		heavy = false;
	end

	if (lX ~= pX or lY ~= pY) then
		moving = true;
	end

	if (boxW < 48 and boxH < 48) then
		pX = 0;
		pY = 0;
	end

	setProperty('box.x', boxX);
	setProperty('box.y', boxY);
	setProperty('boxB.x', boxX);
	setProperty('boxB.y', boxY);

	setProperty('p.x', boxX + pX);
	setProperty('p.y', boxY + pY);

	setProperty('p.alpha', boxA);
	setProperty('box.alpha', boxA);
	setProperty('boxB.alpha', boxA);

	if (notice > 0) then
		notice = notice - elapsed * 60;
		setProperty('p.color', getColorFromHex('FFFFFF'));
		setProperty('p.alpha', notice / 10);
	end
	--hRemove = true;
	bullUpdate(elapsed);

	if (getProperty('health') <= 0 and not practice) then
		killAll();
	end

	atkUpdate(elapsed);

	if (forceKill) then
		setProperty('health', 0);
	end
	--setProperty('health', 0);

	setTextString('hitsTxt', 'Damage: '..math.ceil(damageTaken));
	local dtcolor = 'FFFFFF';
	if (dtRed > 0) then
		if (dtRed == dtrMax) then
			dtcolor = 'FF0000';
		elseif (dtRed > dtrMax / 2) then
			dtcolor = 'FF6A00';
		else
			dtcolor = 'FFFFFF';
		end
		dtRed = dtRed - (elapsed * 60);
	end
	setTextColor('hitsTxt', dtcolor);
	--setTextSize('hitsTxt', math.floor(dtscale * 16));
end

th = 0;
spec = '';
function setAtk(atk, s)
	if (atk == '') then atk = 'none' end
	s = s or '';
	curAtk = atk;
	spec = s;
	th = 0;
	atkTimer = 0;
end

function atkUpdate(elapsed)
	if (curAtk ~= 'none') then
		th = th + elapsed * 60;
		--debugPrint(atkTimer);

		while (atkTimer < math.floor(th)) do
			atkStep();
			atkTimer = atkTimer + 1;
		end
	else
		th = 0;
		atkTimer = 0;
	end
end

function atkIni()
	local k = curAtk;
	targetW = 450;
	targetH = 300;
	finTime = 2000;
	isBlue = false;
	gravDir = 270;
	wav = 0;
	act = 0;
	vav1 = 0;
	vav2 = 0;
	vav3 = 0;

	if (k == 'twirl') then
		targetW = 300;
		targetH = 300;
	elseif (k == 'hops' or k == 'hopsRng') then
		isBlue = true;
		targetH = 200;

		if (spec == 'reset') then
			heavy = true;
			vsp = 30;
		end
	elseif (k == 'bluehops') then
		isBlue = true;
		targetH = 200;
		targetW = 550;
	elseif (k == 'leftsine') then
		targetH = 200;
		targetW = 200;
		wav = 0;
		finTime = 120;
	elseif (k == 'blasters_r') then
		targetW = 250;
		targetH = 250;
		wav = 2;
		finTime = 500;
	elseif (k == 'platformRush' or k == 'platformRushRight') then
		targetW = 530;
		targetH = 260;
		isBlue = true;
		--wav = 2;
		finTime = 500;
	elseif (k == 'keys') then
		bullSpawn('keys', 0, -15, 0, 0, 0);
	elseif (k == 'rotSingle') then
		finTime = 1000;
	end
end
function atkStep()
	local k = curAtk;

	if (atkTimer == 0) then
		atkIni();
	end

	--fucking lua doesnt have switch statement yandev code lookin ass

	--Yeah hehe, imagine using if and elseif 200 times in a script...
	-- Couldn't be me...

-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Blaster attack
-- Wasn't this an normal event in V1?
-- yes, but it's faster and requires less power than before...

	if (k == 'Blaster') then
		boxX = 1280 - 325;
		if (difficultyName == 'Easy') then
			BlasterDamageDealt = 0.5
		elseif (difficultyName == 'Normal') or (difficultyName == 'Omegaspace') then
			BlasterDamageDealt = 0.8
		elseif (difficultyName == 'Hard') then
			BlasterDamageDealt = 1
		elseif (difficultyName == 'Hell') then
			BlasterDamageDealt = 1.25
		end

		isitdownScroll = getPropertyFromClass('ClientPrefs', 'downScroll')

		if isitdownScroll then
			vav1 = -270
		else
			vav1 = 290
		end

		if (atkTimer == 1) then
			bullSpawn('blaster', -750, vav1, 0, 0, 1, 0, 1.2);
		end

		if (atkTimer == 48) then
			health = getProperty('health')
				newHealthValueStep = health - BlasterDamageDealt
				if newHealthValueStep < 0.01 then
					newHealthValueStep = 0.01
				end
			setProperty('health', newHealthValueStep)
			triggerEvent('Screen Shake', '0.2,0.05', '0.2,0.05');
		end
	
		

-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 1
	elseif (k == 'Atk1') then
		targetH = 250
		targetW = 250
		if (atkTimer == 0) then
			bullSpawn('keys', 0, -15, 0, 0, 0);		
		end
		if (atkTimer % 60 == 0 and atkTimer > 40 and atkTimer < 190) then
			bullSpawn('boneH2', -80, -380, 0, 7.1, 1.4);
			bullSpawn('boneH2', 80, 380, 0, -7.1, 1.4);
		end
		if (atkTimer == 260) then
			bullSpawn('blaster', 0, -250, 0, 0, 1, -90, 0.9);
			bullSpawn('blaster', -250, 0, 0, 0, 1, 0, 0.9);
		end

	elseif (k == 'Atk1_E') then
		targetH = 250
		targetW = 250
		if (atkTimer == 0) then
			bullSpawn('keys', 0, -15, 0, 0, 0);		
		end
		if (atkTimer % 70 == 0 and atkTimer > 20 and atkTimer < 260) then
			bullSpawn('boneH2', -80, -380, 0, 6.1, 1.4);
			bullSpawn('boneH2', 80, 380, 0, -6.1, 1.4);
		end
		if (atkTimer == 270) then
			bullSpawn('blaster', 0, -250, 0, 0, 1, -90, 0.9);
			bullSpawn('blaster', -250, 0, 0, 0, 1, 0, 0.9);
		end

	elseif (k == 'Atk1_H') then
		targetH = 250
		targetW = 250
		if (atkTimer == 0) then
			bullSpawn('keys', 0, -15, 0, 0, 0);		
		end
		if (atkTimer == 10) then
			bullSpawn('boneV3', -300, 0, 8, 0, -1.4);
			bullSpawn('boneV3', 300, 0, -8, 0, -1.4);
		end
		if (atkTimer % 50 == 0 and atkTimer > 30 and atkTimer < 220) then
			bullSpawn('boneH2', -80, -380, 0, 8.1, 1.4);
			bullSpawn('boneH2', 80, 380, 0, -8.1, 1.4);
		end
		if (atkTimer == 220) then
			bullSpawn('blaster', 0, -250, 0, 0, 1, -90, 0.9);
			bullSpawn('blaster', -250, 0, 0, 0, 1, 0, 0.9);
		end
		if (atkTimer == 270) then
			bullSpawn('blaster', 250, -250, 0, 0, 1, -135, 0.9);
			bullSpawn('blaster', -250, -250, 0, 0, 1, -45, 0.9);
		end
-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 2
		elseif (k == 'Atk2') then
			targetH = 250
			targetW = 250
			if (atkTimer == 20) then
				local XBla = 100
				local YBla = -100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 30) then
				local XBla = -100
				local YBla = -100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 40) then
				local XBla = 100
				local YBla = 100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 50) then
				local XBla = -100
				local YBla = 100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer % 50 == 0 and atkTimer > 50 and atkTimer < 220) then
				targetW = 300
				local XBla = pX + math.random(-50, 50);
				local YBla = pY + math.random(-50, 50);
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer % 5 == 0 and atkTimer > 200 and atkTimer < 280) then
					local sp = 90;
					local rn = 60;
					local side = 1;
					if (spec == 'reversed') then side = -1 end
					bullSpawn('boneV1', math.sin(math.rad(wav * 13)) * rn + sp , -600, 0, 10, 1, 90);
					bullSpawn('boneV1', math.sin(math.rad(wav * 13)) * rn - sp , -600, 0, 10, 1, 90);
					wav = wav + 1;
			end

		elseif (k == 'Atk2_E') then
			targetH = 250
			targetW = 250
			if (atkTimer == 24) then
				local XBla = 100
				local YBla = -100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 38) then
				local XBla = -100
				local YBla = -100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 52) then
				local XBla = 100
				local YBla = 100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 66) then
				local XBla = -100
				local YBla = 100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer % 60 == 0 and atkTimer > 60 and atkTimer < 200) then
				targetW = 300
				local XBla = pX + math.random(-60, 60);
				local YBla = pY + math.random(-60, 60);
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer % 5 == 0 and atkTimer > 170 and atkTimer < 280) then
					local sp = 100;
					local rn = 60;
					local side = 1;
					if (spec == 'reversed') then side = -1 end
					bullSpawn('boneV1', math.sin(math.rad(wav * 13)) * rn + sp , -600, 0, 8, 1, 90);
					bullSpawn('boneV1', math.sin(math.rad(wav * 13)) * rn - sp , -600, 0, 8, 1, 90);
					wav = wav + 1;
			end
	
		elseif (k == 'Atk2_H') then
			targetH = 250
			targetW = 250
			if (atkTimer == 15) then
				local XBla = 100
				local YBla = -100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 20) then
				local XBla = -100
				local YBla = -100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 25) then
				local XBla = 100
				local YBla = 100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 30) then
				local XBla = -100
				local YBla = 100
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer == 40) then
				local XBla = 0
				local YBla = 0
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer % 40 == 0 and atkTimer > 50 and atkTimer < 200) then
				targetW = 300
				local XBla = pX + math.random(-50, 50);
				local YBla = pY + math.random(-50, 50);
				bullSpawn('BoneBlaster', XBla, YBla, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', XBla, YBla, 0, 0, 1, 0, 0.9);
			end
			if (atkTimer % 5 == 0 and atkTimer > 200 and atkTimer < 260) then
					local sp = 80;
					local rn = 60;
					local side = 1;
					if (spec == 'reversed') then side = -1 end
					bullSpawn('boneV1', math.sin(math.rad(wav * 11)) * rn + sp , -600, 0, 11, 1, 90);
					bullSpawn('boneV1', math.sin(math.rad(wav * 11)) * rn - sp , -600, 0, 11, 1, 90);
					wav = wav + 1;
			end
			if (atkTimer == 290) then
				bullSpawn('BoneBlaster', pX+150, pY+150, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', pX+150, pY+150, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', pX+150, pY+150, 0, 0, 1, 0, 0.9);
				bullSpawn('BoneBlaster', pX+150, pY-150, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', pX+150, pY-150, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', pX+150, pY-150, 0, 0, 1, 0, 0.9);
				bullSpawn('BoneBlaster', pX-150, pY-150, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', pX-150, pY-150, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', pX-150, pY-150, 0, 0, 1, 0, 0.9);
				bullSpawn('BoneBlaster', pX-150, pY+150, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', pX-150, pY+150, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', pX-150, pY+150, 0, 0, 1, 0, 0.9);
				bullSpawn('BoneBlaster', pX, pY, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', pX, pY, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', pX, pY, 0, 0, 1, 0, 0.9);
			end
-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 3
	elseif (k == 'Atk3') then
		if (atkTimer % 35 == 0 and atkTimer < 280) then
			local rn = 300;
			local a = math.random(0, 360);
			local b = math.random(0, 360);
			local bx = math.cos(math.rad(a)) * rn;
			local by = -math.sin(math.rad(a)) * rn;
			local cx = math.cos(math.rad(b)) * rn;
			local cy = -math.sin(math.rad(b)) * rn;
			local pa = point_direction(bx, by, pX, pY);
			local pb = point_direction(cx, cy, pX, pY);
			bullSpawn('GasterHand', bx, by, 0, 0, 0, 0, 0.9);
			bullSpawn('GasterBlastBase', bx, by, 0, 0, 1.2, pa, 0.5);
			bullSpawn('GasterWarnBase', bx, by, 0, 0, 0, pa, 0.9);
			bullSpawn('GasterHand', cx, cy, 0, 0, 0, 0, 0.9);
			bullSpawn('GasterBlastBase', cx, cy, 0, 0, 1.2, pb, 0.5);
			bullSpawn('GasterWarnBase', cx, cy, 0, 0, 0, pb, 0.9);
		end

	elseif (k == 'Atk3_E') then
		if (atkTimer % 45 == 0 and atkTimer < 280) then
			local rn = 300;
			local a = math.random(0, 360);
			local b = math.random(0, 360);
			local bx = math.cos(math.rad(a)) * rn;
			local by = -math.sin(math.rad(a)) * rn;
			local cx = math.cos(math.rad(b)) * rn;
			local cy = -math.sin(math.rad(b)) * rn;
			local pa = point_direction(bx, by, pX, pY);
			local pb = point_direction(cx, cy, pX, pY);
			bullSpawn('GasterHand', bx, by, 0, 0, 0, 0, 0.9);
			bullSpawn('GasterBlastBase', bx, by, 0, 0, 1.2, pa, 0.3);
			bullSpawn('GasterWarnBase', bx, by, 0, 0, 0, pa, 0.9);
			bullSpawn('GasterHand', cx, cy, 0, 0, 0, 0, 0.9);
			bullSpawn('GasterBlastBase', cx, cy, 0, 0, 1.2, pb, 0.3);
			bullSpawn('GasterWarnBase', cx, cy, 0, 0, 0, pb, 0.9);
		end

	elseif (k == 'Atk3_H') then
		if (atkTimer % 30 == 0 and atkTimer < 280) then
			local rn = 300;
			local a = math.random(0, 360);
			local b = math.random(0, 360);
			local bx = math.cos(math.rad(a)) * rn;
			local by = -math.sin(math.rad(a)) * rn;
			local cx = math.cos(math.rad(b)) * rn;
			local cy = -math.sin(math.rad(b)) * rn;
			local pa = point_direction(bx, by, pX, pY);
			local pb = point_direction(cx, cy, pX, pY);
			bullSpawn('GasterHand', bx, by, 0, 0, 0, 0, 0.9);
			bullSpawn('GasterBlastBase', bx, by, 0, 0, 1.2, pa, 0.6);
			bullSpawn('GasterWarnBase', bx, by, 0, 0, 0, pa, 0.9);
			bullSpawn('GasterHand', cx, cy, 0, 0, 0, 0, 0.9);
			bullSpawn('GasterBlastBase', cx, cy, 0, 0, 1.2, pb, 0.6);
			bullSpawn('GasterWarnBase', cx, cy, 0, 0, 0, pb, 0.9);
		end
-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 3
	elseif (k == 'Atk4' and atkTimer < 260) then
		local rn = 300;
		local a = math.random(0, 360);
		local bx = math.cos(math.rad(a)) * rn;
		local by = -math.sin(math.rad(a)) * rn;
		local pa = point_direction(bx, by, pX, pY);
		if (atkTimer % 50 == 0) then
			wav = -30
			bullSpawn('GasterHand', bx, by, 0, 0, 0, 0, 0.9);
			vav2 = 0
		end
		if (atkTimer % 1 == 0) then
			if vav2 == 0 then
			vav1 = bx
			vav3 = by 
			act = pa
			end
			if (vav2 < 5) then
			bullSpawn('GasterBlastBase', vav1, vav3, 0, 0, 1, act + wav, 0.5);
			bullSpawn('GasterWarnBase', vav1, vav3, 0, 0, 1, act + wav, 0.5);
			wav = wav + 15
			vav2 = vav2 + 1
			end
		end

	elseif (k == 'Atk4_E' and atkTimer < 260) then
		local rn = 300;
		local a = math.random(0, 360);
		local bx = math.cos(math.rad(a)) * rn;
		local by = -math.sin(math.rad(a)) * rn;
		local pa = point_direction(bx, by, pX, pY);
		if (atkTimer % 50 == 0) then
			wav = -40
			bullSpawn('GasterHand', bx, by, 0, 0, 0, 0, 0.9);
			vav2 = 0
		end
			if (atkTimer % 1 == 0) then	
				if vav2 == 0 then
				vav1 = bx
				vav3 = by 
				act = pa
				end
				if (vav2 < 5) then
				bullSpawn('GasterBlastBase', vav1, vav3, 0, 0, 1, act + wav, 0.4);
				bullSpawn('GasterWarnBase', vav1, vav3, 0, 0, 1, act + wav, 0.4);
				wav = wav + 20
				vav2 = vav2 + 1
				end
			end

	elseif (k == 'Atk4_H' and atkTimer < 260) then
		local rn = 300;
		local a = math.random(0, 360);
		local bx = math.cos(math.rad(a)) * rn;
		local by = -math.sin(math.rad(a)) * rn;
		local pa = point_direction(bx, by, pX, pY);
		if (atkTimer % 40 == 0) then
			wav = -30
			bullSpawn('GasterHand', bx, by, 0, 0, 0, 0, 0.9);
			vav2 = 0
		end
			if (atkTimer % 1 == 0) then
				if vav2 == 0 then
				vav1 = bx
				vav3 = by 
				act = pa
				end			
				if (vav2 < 5) then
				bullSpawn('GasterBlastBase', vav1, vav3, 0, 0, 1, act + wav, 0.5);
				bullSpawn('GasterWarnBase', vav1, vav3, 0, 0, 1, act + wav, 0.5);
				wav = wav + 15
				vav2 = vav2 + 1
				end
			end
-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 5
		elseif (k == 'Atk5') then
			if (atkTimer == 1) then
				isBlue = true
			end
			if (atkTimer == 70) then
				gravDir = 90
			end
			if (atkTimer % 25 == 0 and atkTimer < 75) then
				bullSpawn('boneH2', 400, -170, -8, 0, 1, 90, 0.9);
				bullSpawn('boneH2', -400, 170, 8, 0, 1, 90, 0.9);
			end
			if (atkTimer % 25 == 0 and atkTimer > 20 and atkTimer < 160) then
				bullSpawn('boneH2', 280, -500, 0, 8, 1, 0, 0.9);
			end
			if (atkTimer % 1 == 0 and atkTimer > 105 and atkTimer < 130) then
				pX = pX + 30
				gravDir = 0
			end
			if (atkTimer % 1 == 0 and atkTimer > 145 and atkTimer < 160) then
				pX = pX - 30
				gravDir = 180
			end
			if (atkTimer % 4 == 0 and atkTimer > 155 and atkTimer < 180) then
				vav1 = vav1 + 25
				bullSpawn('BoneBlaster', 100, -250 + vav1, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', 100, -250 + vav1, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', 100, -250 + vav1, 0, 0, 1, 0, 0.9);
				bullSpawn('BoneBlaster', 100, 250 - vav1, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', 100, 250 - vav1, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', 100, 250 - vav1, 0, 0, 1, 0, 0.9);
			end		
			if (atkTimer == 160) then
				bullSpawn('blaster', -200, -250, 0, 0, 0.7, -90, 0.7);
			end
			if (atkTimer == 200) then
				bullSpawn('blaster', 250, 0, 0, 0, 0.7, 180, 0.7);
				isBlue = false
			end
			if (atkTimer % 30 == 0 and atkTimer > 230) then
				local rn = 200;
				local a = math.random(0, 360);
				local bx = math.cos(math.rad(a)) * rn;
				local by = -math.sin(math.rad(a)) * rn;	
				local pa = point_direction(bx, by, pX, pY);
				bullSpawn('blaster', bx, by, 0, 0, 1, pa, 0.6);
			end
			if (atkTimer % 30 == 0 and atkTimer > 230) then
				bullSpawn('boneH2', 400, -150, -10, 0, 1, 90, 0.9);
				bullSpawn('boneH2', -400, 150, 10, 0, 1, 90, 0.9);
			end
			if (atkTimer == 300) then
				bullSpawn('jkblaster', -300, -150, 0, 0, 0, 0, 2);
				bullSpawn('jkblaster', -300, 0, 0, 0, 0, 0, 2);
				bullSpawn('jkblaster', -300, 150, 0, 0, 0, 0, 2);
			end
			if (atkTimer % 0.1 == 0 and atkTimer > 280) then
				wav = wav + 0.02
				local rn = 400
				local a = atkTimer*wav + 90;
				local bx = math.cos(math.rad(a)) * rn;
				local by = -math.sin(math.rad(a)) * rn;
				local pa = a + 180;
				bullSpawn('jkblaster', bx, by, 0, 0, 0, pa, 0.5);
			end

		elseif (k == 'Atk5_E') then
			if (atkTimer == 1) then
				isBlue = true
			end
			if (atkTimer == 70) then
				gravDir = 90
			end		
			if (atkTimer % 35 == 0 and atkTimer < 75) then
				bullSpawn('boneH2', 400, -180, -7, 0, 1, 90, 0.9);
				bullSpawn('boneH2', -400, 180, 7, 0, 1, 90, 0.9);
			end
			if (atkTimer % 35 == 0 and atkTimer > 20 and atkTimer < 160) then
				bullSpawn('boneH2', 290, -500, 0, 7, 1, 0, 0.9);
			end
			if (atkTimer % 1 == 0 and atkTimer > 105 and atkTimer < 130) then
				pX = pX + 30
				gravDir = 0
			end
			if (atkTimer % 1 == 0 and atkTimer > 145 and atkTimer < 160) then
				pX = pX - 30
				gravDir = 180
			end
			if (atkTimer % 4 == 0 and atkTimer > 155 and atkTimer < 180) then
				vav1 = vav1 + 24
				bullSpawn('BoneBlaster', 100, -250 + vav1, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', 100, -250 + vav1, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', 100, -250 + vav1, 0, 0, 1, 0, 0.9);
				bullSpawn('BoneBlaster', 100, 250 - vav1, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', 100, 250 - vav1, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', 100, 250 - vav1, 0, 0, 1, 0, 0.9);
			end		
			if (atkTimer == 160) then
				bullSpawn('blaster', -200, -250, 0, 0, 0.7, -90, 0.5);
			end
			if (atkTimer == 200) then
				bullSpawn('blaster', 250, 0, 0, 0, 0.7, 180, 0.5);
				isBlue = false
			end
			if (atkTimer % 40 == 0 and atkTimer > 230) then
				local rn = 200;
				local a = math.random(0, 360);
				local bx = math.cos(math.rad(a)) * rn;
				local by = -math.sin(math.rad(a)) * rn;
				local pa = point_direction(bx, by, pX, pY);	
				bullSpawn('blaster', bx, by, 0, 0, 1, pa, 0.6);
			end
			if (atkTimer % 40 == 0 and atkTimer > 230) then
				bullSpawn('boneH2', 400, -150, -10, 0, 1, 90, 0.9);
				bullSpawn('boneH2', -400, 150, 10, 0, 1, 90, 0.9);
			end
			if (atkTimer == 300) then
				bullSpawn('jkblaster', -300, -150, 0, 0, 0, 0, 2);
				bullSpawn('jkblaster', -300, 0, 0, 0, 0, 0, 2);
				bullSpawn('jkblaster', -300, 150, 0, 0, 0, 0, 2);
			end
			if (atkTimer % 2 == 0 and atkTimer > 280) then
				wav = wav + 0.02
				local rn = 450
				local a = atkTimer*wav + 90;
				local bx = math.cos(math.rad(a)) * rn;
				local by = -math.sin(math.rad(a)) * rn;
				local pa = a + 180;
				bullSpawn('jkblaster', bx, by, 0, 0, 0, pa, 0.5);
			end

		elseif (k == 'Atk5_H') then
			if (atkTimer == 1) then
				isBlue = true
			end
			if (atkTimer == 70) then
				gravDir = 90
			end
			if (atkTimer % 20 == 0 and atkTimer < 75) then
				bullSpawn('boneH2', 400, -160, -8, 0, 1, 90, 0.9);
				bullSpawn('boneH2', -400, 160, 8, 0, 1, 90, 0.9);
			end
			if (atkTimer % 20 == 0 and atkTimer > 20 and atkTimer < 160) then
				bullSpawn('boneH2', 260, -500, 0, 8, 1, 0, 0.9);
			end
			if (atkTimer % 1 == 0 and atkTimer > 105 and atkTimer < 130) then
				pX = pX + 30
				gravDir = 0
			end
			if (atkTimer % 1 == 0 and atkTimer > 145 and atkTimer < 160) then
				pX = pX - 30
				gravDir = 180
			end
			if (atkTimer % 4 == 0 and atkTimer > 155 and atkTimer < 180) then
				vav1 = vav1 + 27
				bullSpawn('BoneBlaster', 100, -250 + vav1, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', 100, -250 + vav1, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', 100, -250 + vav1, 0, 0, 1, 0, 0.9);
				bullSpawn('BoneBlaster', 100, 250 - vav1, 0, 0, 0, -90, 0.9);
				bullSpawn('blasterInvis', 100, 250 - vav1, 0, 0, 1, -90, 0.9);
				bullSpawn('blasterInvis', 100, 250 - vav1, 0, 0, 1, 0, 0.9);
			end		
			if (atkTimer == 160) then
				bullSpawn('blaster', -150, -250, 0, 0, 0.7, -90, 0.7);
				bullSpawn('blaster', -200, 250, 0, 0, 0.7, 90, 0.7);
			end
			if (atkTimer == 190) then
				bullSpawn('blaster', 250, 0, 0, 0, 0.7, 180, 0.7);
				bullSpawn('blaster', 250, 0, 0, 0, 0.7, 130, 0.7);
				bullSpawn('blaster', 250, 0, 0, 0, 0.7, 220, 0.7);
				bullSpawn('blaster', 250, 0, 0, 0, 0.7, 200, 0.7);
				bullSpawn('blaster', 250, 0, 0, 0, 0.7, 160, 0.7);
				isBlue = false
			end
			if (atkTimer % 20 == 0 and atkTimer > 230) then
				local rn = 200;
				local a = math.random(0, 360);
				local bx = math.cos(math.rad(a)) * rn;
				local by = -math.sin(math.rad(a)) * rn;	
				local pa = point_direction(bx, by, pX, pY);
				bullSpawn('blaster', bx, by, 0, 0, 1, pa, 0.6);
			end
			if (atkTimer % 10 == 0 and atkTimer > 230) then
				bullSpawn('boneH2', 400, -150, -10, 0, 1, 90, 0.9);
				bullSpawn('boneH2', -400, 150, 10, 0, 1, 90, 0.9);
			end
			if (atkTimer == 300) then
				bullSpawn('jkblaster', -300, -150, 0, 0, 0, 0, 2);
				bullSpawn('jkblaster', -300, 0, 0, 0, 0, 0, 2);
				bullSpawn('jkblaster', -300, 150, 0, 0, 0, 0, 2);
			end
			if (atkTimer % 0.1 == 0 and atkTimer > 280) then
				wav = wav + 0.02
				local rn = 400
				local a = atkTimer*wav + 90;
				local bx = math.cos(math.rad(a)) * rn;
				local by = -math.sin(math.rad(a)) * rn;
				local pa = a + 180;
				bullSpawn('jkblaster', bx, by, 0, 0, 0, pa, 0.5);
			end
-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 6
elseif (k == 'Atk6') then
	targetW = 250;
	targetH = 250;
	if (atkTimer % 6 == 0 and atkTimer < 45) then
		local a = math.random(-50, 50) + pY
		bullSpawn('cupShot', -400, a, 12, 0, 1, 1);
	end
	if (atkTimer % 1 == 0 and atkTimer < 78 and atkTimer > 70) then
		isBlue = true
		heavy = true
		pY = pY + vav1
		vav1 = vav1 - 20
	end
	if (atkTimer % 25 == 0 and atkTimer < 150 and atkTimer > 40) then
		local a = math.random(-50, 50) + pY
		bullSpawn('boneV1', 500, -150, -12, 0, 1.4);
		gravDir = 90
	end
	if (atkTimer == 100) then
		bullSpawn('blaster', 300, -150, 0, 0, 1, 180);
		bullSpawn('blaster', 300, 150, 0, 0, 1, 180);
	end
	if (atkTimer == 120) then
		bullSpawn('blaster', 0, -300, 0, 0, 1, -90);
	end
	if (atkTimer == 160) then
		isBlue = false
	end
	if (atkTimer % 8 == 0 and atkTimer < 220 and atkTimer > 145) then
		local a = math.random(-250, 250) 
		local b = math.random(-250, 250) 
		local c = math.random(-250, 250) 
		bullSpawn('cupShot', -400, a, 12, 0, 1, 1);
		bullSpawn('cupShot', -400, b, 12, 0, 1, 1);
		bullSpawn('cupShot', -400, c, 12, 0, 1, 1);
	end
	if (atkTimer % 30 == 0 and atkTimer > 180) then
		bullSpawn('BoneBlaster', pX, pY, 0, 0, 0, -90, 0.9);
		bullSpawn('blasterInvis', pX, pY, 0, 0, 1, -90, 0.9);
		bullSpawn('blasterInvis', pX, pY, 0, 0, 1, 0, 0.9);
	end

	elseif (k == 'Atk6_E') then
	targetW = 250;
	targetH = 250;
	if (atkTimer % 8 == 0 and atkTimer < 45) then
		local a = math.random(-50, 50) + pY
		bullSpawn('cupShot', -400, a, 10, 0, 1, 1);
	end
	if (atkTimer % 1 == 0 and atkTimer < 78 and atkTimer > 70) then
		isBlue = true
		heavy = true
		pY = pY + vav1
		vav1 = vav1 - 20
	end
	if (atkTimer % 30 == 0 and atkTimer < 150 and atkTimer > 40) then
		local a = math.random(-50, 50) + pY
		bullSpawn('boneV1', 500, -150, -10, 0, 1.4);
		gravDir = 90
	end
	if (atkTimer == 100) then
		bullSpawn('blaster', 300, -170, 0, 0, 1, 180);
		bullSpawn('blaster', 300, 170, 0, 0, 1, 180);
	end
	if (atkTimer == 160) then
		isBlue = false
	end
	if (atkTimer % 10 == 0 and atkTimer < 220 and atkTimer > 145) then
		local a = math.random(-250, 250) 
		local b = math.random(-250, 250) 
		local c = math.random(-250, 250) 
		bullSpawn('cupShot', -400, a, 10, 0, 1, 1);
		bullSpawn('cupShot', -400, b, 10, 0, 1, 1);
		bullSpawn('cupShot', -400, c, 10, 0, 1, 1);
	end
	if (atkTimer % 35 == 0 and atkTimer > 180) then
		bullSpawn('BoneBlaster', pX, pY, 0, 0, 0, -90, 0.9);
		bullSpawn('blasterInvis', pX, pY, 0, 0, 1, -90, 0.9);
		bullSpawn('blasterInvis', pX, pY, 0, 0, 1, 0, 0.9);
	end


	elseif (k == 'Atk6_H') then
		targetW = 250;
		targetH = 250;

	if (atkTimer % 4 == 0 and atkTimer < 45) then
		local a = math.random(-50, 50) + pY
		bullSpawn('cupShot', -400, a, 12, 0, 1, 1);
	end
	if (atkTimer % 1 == 0 and atkTimer < 78 and atkTimer > 70) then
		isBlue = true
		heavy = true
		pY = pY + vav1
		vav1 = vav1 - 20
	end
	if (atkTimer % 20 == 0 and atkTimer < 150 and atkTimer > 30) then
		local a = math.random(-50, 50) + pY
		bullSpawn('boneV1', 500, -140, -12, 0, 1.4);
		gravDir = 90
	end
	if (atkTimer == 100) then
		bullSpawn('blaster', 300, -120, 0, 0, 1, 180);
		bullSpawn('blaster', 300, 120, 0, 0, 1, 180);
	end
	if (atkTimer == 120) then
		bullSpawn('blaster', -200, -300, 0, 0, 1, -90);
		bullSpawn('blaster', 0, -300, 0, 0, 1, -90);
		bullSpawn('blaster', 200, -300, 0, 0, 1, -90);
	end
	if (atkTimer == 160) then
		isBlue = false
	end
	if (atkTimer % 4 == 0 and atkTimer < 220 and atkTimer > 145) then
		local a = math.random(-250, 250) 
		local b = math.random(-250, 250) 
		local c = math.random(-250, 250) 
		bullSpawn('cupShot', -400, a, 12, 0, 1, 1);
		bullSpawn('cupShot', -400, b, 12, 0, 1, 1);
		bullSpawn('cupShot', -400, c, 12, 0, 1, 1);
	end
	if (atkTimer % 22 == 0 and atkTimer > 180) then
		bullSpawn('BoneBlaster', pX, pY, 0, 0, 0, -90, 0.9);
		bullSpawn('blasterInvis', pX, pY, 0, 0, 1, -90, 0.9);
		bullSpawn('blasterInvis', pX, pY, 0, 0, 1, 0, 0.9);
	end
-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 7
	elseif (k == 'Atk7') then
		if (atkTimer % 25 == 0 and atkTimer < 110) then
			local rn = 200;
			local a = math.random(0, 360);
			local bx = math.cos(math.rad(a)) * rn;
			local by = -math.sin(math.rad(a)) * rn;
			local pa = point_direction(bx, by, pX, pY);
			bullSpawn('blaster', bx, by, 0, 0, 1, pa, 0.6);
		end
		if (atkTimer % 4 == 0 and atkTimer > 110 and atkTimer < 220) then
			local buy = math.random(-200, 200);
			bullSpawn('inkShotDrop', -250, buy, 7, 0, 1, 90 , 0.5, 0.5);
		end
		if (atkTimer % 10 == 0 and atkTimer > 230) then
			bullSpawn('cupConverge', -300, pY, 10, -2, 1, 12);
			bullSpawn('cupConverge', -300, pY, 10, 0, 1, 0);
			bullSpawn('cupConverge', -300, pY, 10, 2, 1, -12);
		end

	elseif (k == 'Atk7_E') then
		if (atkTimer % 35 == 0 and atkTimer < 110) then
			local rn = 200;
			local a = math.random(0, 360);
			local bx = math.cos(math.rad(a)) * rn;
			local by = -math.sin(math.rad(a)) * rn;
			local pa = point_direction(bx, by, pX, pY);
			bullSpawn('blaster', bx, by, 0, 0, 1, pa, 0.6);
		end
		if (atkTimer % 6 == 0 and atkTimer > 110 and atkTimer < 220) then
			local buy = math.random(-200, 200);
			bullSpawn('inkShotDrop', -250, buy, 6, 0, 1, 90 , 0.5, 0.5);
		end
		if (atkTimer % 15 == 0 and atkTimer > 230) then
			bullSpawn('cupConverge', -300, pY, 9, -3, 1, 15);
			bullSpawn('cupConverge', -300, pY, 9, 0, 1, 0);
			bullSpawn('cupConverge', -300, pY, 9, 3, 1, -15);
		end

	elseif (k == 'Atk7_H') then
		if (atkTimer % 20 == 0 and atkTimer < 110) then
			local rn = 200;
			local a = math.random(0, 360);
			local bx = math.cos(math.rad(a)) * rn;
			local by = -math.sin(math.rad(a)) * rn;
			local pa = point_direction(bx, by, pX, pY);
			bullSpawn('blaster', bx, by, 0, 0, 1, pa, 0.6);
		end
		if (atkTimer % 3 == 0 and atkTimer > 110 and atkTimer < 220) then
			local buy = math.random(-220, 220);
			bullSpawn('inkShotDrop', -250, buy, 8, 0, 1, 90 , 0.5, 0.5);
		end
		if (atkTimer % 8 == 0 and atkTimer > 230) then
			bullSpawn('cupConverge', -300, pY, 10, -1.5, 1, 10);
			bullSpawn('cupConverge', -300, pY, 10, 0, 1, 0);
			bullSpawn('cupConverge', -300, pY, 10, 1.5, 1, -10);
		end
-- - - - - - - - - - - - - - - - - - - - -  - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - Attack 8

	elseif (k == 'Atk8') then
		targetH = 500
		targetW = 1400
		boxX = 570
		if (atkTimer == 1) then
			pX = 3000
			bullSpawn('FinalBall', -400, 0, 1, 0, 1, 0, 0.6);
			bullSpawn('FinalBallIcon', -400, 0, 1, 0, 1, 0, 0.6);
			bullSpawn('BoneV99', -1250, 0, 1, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, 30, 1, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, 60, 1, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, -30, 1, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, -60, 1, 0, 1, 90, 1);
			bullSpawn('boneV25', -400, 0, 1, 0, 1, 90, 1);
			bullSpawn('boneV26', -400, 0, 1, 0, 1, 90, 1);
		end
		if (atkTimer % 35 == 0) then
			local a = math.random(-320, 320);
			bullSpawn('warnBlast', vav1 + 250, a, 0, 0, 0, 0, 1);
			bullSpawn('blaster', vav1 - 250, a, 0, 0, 0.7, 0, 0.6);
		end
		if (atkTimer % 4 == 0) then
			local a = math.sin(math.rad(atkTimer * 10)) / 2;
			local s = 8;
			local d = 1;
			bullSpawn('cupShot', vav1 -300, 0, math.cos(a) * s, math.sin(a) * s, 0.9);
		end
		if (atkTimer % 70 == 0) then
			local a = 7
			local bX = pX + math.random(-30, 30);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 1, 0.7);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 0.9, 0.7);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 0.8, 0.7);
		end
		if (atkTimer % 25 == 0) then
			vav1 = vav1 + 30
		end

	elseif (k == 'Atk8_E') then
		targetH = 500
		targetW = 1400
		boxX = 570
		if (atkTimer == 1) then
			pX = 3000
			bullSpawn('FinalBall', -400, 0, 0.8, 0, 1, 0, 0.6);
			bullSpawn('FinalBallIcon', -400, 0, 0.8, 0, 1, 0, 0.6);
			bullSpawn('BoneV99', -1250, 0, 0.8, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, 30, 0.8, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, 60, 0.8, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, -30, 0.8, 0, 1, 90, 1);
			bullSpawn('BoneV99', -1250, -60, 0.8, 0, 1, 90, 1);
			bullSpawn('boneV25', -400, 0, 0.8, 0, 1, 90, 1);
			bullSpawn('boneV26', -400, 0, 0.8, 0, 1, 90, 1);
		end
		if (atkTimer % 20 == 0) then
			local a = math.random(-300, 300);
			bullSpawn('warnBlast', vav1 + 250, a, 0, 0, 0, 0, 1);
			bullSpawn('blaster', vav1 - 250, a, 0, 0, 0.8, 0, 0.6);
		end
		if (atkTimer % 3 == 0) then
			local a = math.sin(math.rad(atkTimer * 10)) / 2;
			local s = 10;
			local d = 1;
			bullSpawn('cupShot', vav1 -300, 0, math.cos(a) * s, math.sin(a) * s, 0.9);
		end
		if (atkTimer % 60 == 0) then
			local a = 8
			local bX = pX + math.random(-20, 20);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 1, 0.7);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 0.8, 0.7);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 0.6, 0.7);
		end
		if (atkTimer % 25 == 0) then
			vav1 = vav1 + 26
		end

	elseif (k == 'Atk8_H') then
		targetH = 500
		targetW = 1400
		boxX = 570
		if (atkTimer == 1) then
			pX = 3000
			bullSpawn('FinalBall', -400, 0, 1.5, 0, 1, 0, 0.6);
			bullSpawn('FinalBallIcon', -400, 0, 1.5, 0, 1, 0, 0.6);
			bullSpawn('final_unbekannt_hell', -820, 0, 1.5, 0, 1, -90, 1);
			bullSpawn('boneV25', -400, 0, 1.5, 0, 1, 90, 1);
			bullSpawn('boneV26', -400, 0, 1.5, 0, 1, 90, 1);
		end
		if (atkTimer % 30 == 0) then
			local a = math.random(-300, 300);
			bullSpawn('warnBlast', vav1 + 250, a, 0, 0, 0, 0, 1);
			bullSpawn('blaster', vav1 - 250, a, 0, 0, 0.8, 0, 0.6);
		end
		if (atkTimer % 3 == 0) then
			local a = math.sin(math.rad(atkTimer * 10)) / 2;
			local s = 10;
			local d = 1;
			bullSpawn('cupShot', vav1 -300, 0, math.cos(a) * s, math.sin(a) * s, 0.9);
		end
		if (atkTimer % 55 == 0) then
			local a = 8
			local bX = pX + math.random(-20, 20);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 1, 0.7);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 0.75, 0.7);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 0.5, 0.7);
			bullSpawn('inkShotDrop', bX, -500, 0, a * 0.25, 0.7);
		end
		if (atkTimer % 20 == 0) then
			vav1 = vav1 + 30
		end
	end


	--cccc5
	if (k == 'blasterleft') then
		if (atkTimer % 120 == 50) then
			local rn = 300;
			local a = math.random(0, 360);
			local bx = math.cos(math.rad(a)) * rn;
			local by = -250;--math.sin(math.rad(a)) * rn;

			local pa = point_direction(bx, by, pX, pY);

			bullSpawn('blaster', bx, by, 0, 0, -1, pa, 0.5);
		end
	end

	finTime = finTime - 1;

	if (finTime <= 0) then
		atkEnd();
	end
end

function atkEnd()
	finTime = 0;
	curAtk = 'none';
end

function onEvent(name, value1, value2)
	if (name == '3_boxOpen') then
		killAll();
		canMove = true;
		setAtk(value1, value2);
	elseif (name == '3_boxClose') then
		canMove = false;
		unspawnAll();
		atkEnd();
	elseif (name == 'Event_Blaster') then
		setAtk(value1, value2);
	elseif (name == '3_handlerUndertale') then
		if (value1 == 'balance') then
			setProperty('health', 2);
			dmgMulti = 0.3;
		end
	end
end

function onStepHit()
	for i = 0, getProperty('eventNotes.length') - 1, 1 do
		local name = getPropertyFromGroup('eventNotes', i, 1);
		local sTime = (getPropertyFromGroup('eventNotes', i, 0) - noteOffset) / stepCrochet;

		if (curStep == math.floor(sTime - 8) or curStep == math.floor(sTime - 4) or curStep == math.floor(sTime - 2)) then
			if ((name == '3_boxOpen' and canMove == false) or name == '3_boxClose') then
				--stopSound('notice');
				--playSound('notice', 1, 'notice');
				notice = 10;
			end
		end
	end
end

function onSongStart()
	dogModeSwitch = false
	dogModesteps = 0
	if dogModeactive == false then
		if keyPressed('space') then
			doTweenColor('boxB', 'boxB', 'dcff00', 0.01, 'quartIn'); 
			playSound('Undertale_EasyMode', 4)
			if (difficultyName == 'Easy') then
				dmgMulti = 0.25
			elseif (difficultyName == 'Normal') or (difficultyName == 'Omegaspace') then
				dmgMulti = 0.33
			elseif (difficultyName == 'Hard') or (difficultyName == 'Hell') then
				dmgMulti = 0.5
			end
		end
	else
		dmgMulti = 0
	end

end
