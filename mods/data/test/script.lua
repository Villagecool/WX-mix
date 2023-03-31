
function onCreate()
    OGX = getPropertyFromClass("openfl.Lib", "application.window.x")
    OGY = getPropertyFromClass("openfl.Lib", "application.window.y")
    makeLuaText('camWindow', ' ' ,OGX, 0, OGY);
    setProperty('camWindow.x',OGX)
    setProperty('camWindow.y',OGY)
    addLuaText('camWindow')
	setObjectCamera('camWindow', 'camOther')
end
function onUnpause()
    setProperty('camWindow.x',getPropertyFromClass("openfl.Lib", "application.window.x"))
    setProperty('camWindow.y',getPropertyFromClass("openfl.Lib", "application.window.y"))
end
fr = 0
function onUpdate(elapsed)
    --fr = fr + elapsed
    --bruhy = (70 + math.sin(fr*1.85) * 100)
    --bruhx = (OGX + math.sin(fr*0.7) * 300)
    --setPropertyFromClass("openfl.Lib", "application.window.x", bruhx)
    --setPropertyFromClass("openfl.Lib", "application.window.y", bruhy)
    --doTweenX('fake1', 'camWindow', bruhx, 0.001)
    --doTweenY('r', 'camWindow', bruhy, 0.001)
--
	--    setPropertyFromClass("openfl.Lib", "application.window.x", getProperty('camWindow.x'))
	--    setPropertyFromClass("openfl.Lib", "application.window.y", getProperty('camWindow.y'))
end

function onDestroy()
    setProperty('camWindow.x',getPropertyFromClass("openfl.Lib", "application.window.x"))
    setProperty('camWindow.y',getPropertyFromClass("openfl.Lib", "application.window.y"))
    
    setPropertyFromClass("openfl.Lib", "application.window.x", OGX)
    setPropertyFromClass("openfl.Lib", "application.window.y", OGY)
end
