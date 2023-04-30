function onEvent(eventName, value1, value2)
    if eventName=='Finale Drop2' then
        cameraFlash('game','FFFFFF', 1,false)
        setProperty('dark.visible', false)
    end
end