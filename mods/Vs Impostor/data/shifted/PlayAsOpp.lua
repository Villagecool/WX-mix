function onCreatePost()
    setProperty('boyfriend.flipX', false)
    setProperty('dad.flipX', true)
    setProperty('boyfriend.x', 600+getProperty('boyfriend.positionArray[0]'))
    setProperty('dad.x', 1400+getProperty('dad.positionArray[0]'))
    setPropertyFromClass('GameOverSubstate', 'characterName', 'jads-death')
    setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={1500,1200},bf={1100,1200}})
end
function onUpdatePost()
    health = getProperty('health')
    bfcolor = rgbToHex({getProperty('boyfriend.healthColorArray[0]'),getProperty('boyfriend.healthColorArray[1]'),getProperty('boyfriend.healthColorArray[2]')})
    dadcolor = rgbToHex({getProperty('dad.healthColorArray[0]'),getProperty('dad.healthColorArray[1]'),getProperty('dad.healthColorArray[2]')})
    --setHealthBarColors(bfcolor, dadcolor)
    setProperty('healthBar.flipX', true)
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    x3 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (75 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    setProperty('iconP2.x', x1)
    setProperty('iconP2.flipX', true)
    setProperty('iconP1.x', x2)
    setProperty('iconP1.flipX', true)
    setProperty('iconP3.x', x3)
    setProperty('iconP3.flipX', true)
end
function rgbToHex(rgb) --https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
    return string.format("%02x%02x%02x",math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end