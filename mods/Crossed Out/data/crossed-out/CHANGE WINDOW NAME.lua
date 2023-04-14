function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'CROSSED OUT+')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'L bozo')
    end
end
