function onEvent(n,v1,v2)
  if n == 'changeIcon' then
    if v1 == 'dad' then
      runHaxeCode([[game.iconP2.changeIcon(']]..v2..[[');]])
      --colors
      if v2 == 'pink' then
        setHealthBarColors('F995AB', rgbToHex(getProperty('boyfriend.healthColorArray')))
      elseif v2 == 'green' then
        setHealthBarColors('4EDA60', rgbToHex(getProperty('boyfriend.healthColorArray')))
      end
    else
      runHaxeCode([[game.iconP1.changeIcon(']]..v2..[[');]])
    end
  end
end
function rgbToHex(rgb) --https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
    return string.format("%02x%02x%02x",math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end