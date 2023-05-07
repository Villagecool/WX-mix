local maxMisses = 15
function onCreate()
    setProperty('healthComments', '/'..maxMisses)
end
function onUpdate()
    if misses >= maxMisses then setProperty('health', -5) end
end