function onCreatePost()
setProperty('icon3.alpha', 0)
setProperty('timeBar.color', getColorFromHex('3f921b'))
end
function onUpdate(elapsed)
if getProperty('icon3.alpha', 1) then
setHealthBarColors('3A1B4F', '31B0D0') 
end 
if getProperty('iconP2.visible', true) then 
setHealthBarColors('D1D2F8', '31B0D0')
end
if getProperty('icon4.visible', true) then 
setHealthBarColors('808080', '31B0D0')
end
if getProperty('icon3.alpha', 1) then
setProperty('scoreTxt.color', getColorFromHex('3A1B4F'))
end
if getProperty('iconP2.visible', true) then
setProperty('scoreTxt.color', getColorFromHex('D1D2F8'))
end
if getProperty('icon4.visible', true) then
setProperty('scoreTxt.color', getColorFromHex('808080'))
end
end