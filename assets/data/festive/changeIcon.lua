function onUpdatePost()
  setProperty('iconP3.visible', false)
    runHaxeCode([[
		game.iconP1.changeIcon('mns');
    ]])
end
function onStartCountdown()
  triggerEvent('Change Character', 'bf', 'bf-')
  return Function_Continue
end