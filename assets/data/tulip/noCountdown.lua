function onCreate()
    setProperty('skipCountdown',true)
end
function onGameOver()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'air');
    setProperty('boyfriend.alpha', 0)
    return Function_Continue
end