function onCreatePost()
    setProperty('boyfriend.flipX', false)
    setProperty('dad.flipX', true)
    setProperty('boyfriend.x', 600+getProperty('boyfriend.positionArray[0]'))
    setProperty('dad.x', 1400+getProperty('dad.positionArray[0]'))
    setPropertyFromClass('GameOverSubstate', 'characterName', 'jads-death')
end
function onUpdatePost()
    health = getProperty('health')
    bfcolor = rgbToHex({getProperty('boyfriend.healthColorArray[0]'),getProperty('boyfriend.healthColorArray[1]'),getProperty('boyfriend.healthColorArray[2]')})
    dadcolor = rgbToHex({getProperty('dad.healthColorArray[0]'),getProperty('dad.healthColorArray[1]'),getProperty('dad.healthColorArray[2]')})
    setHealthBarColors(bfcolor, dadcolor)
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    x3 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (75 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    setProperty('iconP1.x', x1)
    setProperty('iconP2.x', x2)
    setProperty('iconP3.x', x3)
    if health > 1.6 then
        setProperty('iconP1.animation.curAnim.curFrame', 1)
    elseif health < 0.4 then
        setProperty('iconP1.animation.curAnim.curFrame', 2)
    else
        setProperty('iconP1.animation.curAnim.curFrame', 0)
    end
    if health < 0.4 then
        setProperty('iconP2.animation.curAnim.curFrame', 1)
    elseif health > 1.6 then
        setProperty('iconP2.animation.curAnim.curFrame', 2)
    else
        setProperty('iconP2.animation.curAnim.curFrame', 0)
    end
end