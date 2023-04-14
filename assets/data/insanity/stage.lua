function onCreate()
	makeLuaSprite('bg', 'stages/dave', -400, 0);
    scaleObject('bg', 2,2)
	addLuaSprite('bg', false)
end
function onUpdate()
	if keyboardJustPressed('BACKSPACE') then
		loadSong('bopeedo' , -1)
	end
end