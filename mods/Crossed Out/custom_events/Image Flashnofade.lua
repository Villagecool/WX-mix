function onEvent(name, value1, value2)
	if name == "Image Flashnofade" then
		makeLuaSprite('image', value1, 0, 0);
		addLuaSprite('image', true);
		setObjectCamera('image', 'other');
		runTimer('wait', value2);
	end
end



function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
end