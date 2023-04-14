function onEvent(name, value1, value2)
	if name == 'Event_Jumpscare' then
		if not lowQuality then
			if value1 == 'Do' then
				addLuaSprite('PiperJumpscare', true)
				playSound('Boo', 1)
			elseif value1 == 'Remove' then
				removeLuaSprite('PiperJumpscare', true)
			end
		end
	end	
end

function onCreate()
	if not lowQuality then
		makeAnimatedLuaSprite('PiperJumpscare','PiperJumpscare', 00, 00)
		addAnimationByPrefix('PiperJumpscare','Fuck uuuu instance ','Fuck uuuu instance ',24, false)
		objectPlayAnimation('PiperJumpscare','Fuck uuuu instance ',true)
		setObjectCamera('PiperJumpscare', 'camHUD');
	end
end