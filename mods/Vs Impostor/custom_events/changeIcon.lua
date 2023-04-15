function onEvent(n,v1,v2)
  if n == 'changeIcon' then
    if v1 == 'dad' then
      runHaxeCode([[game.iconP2.changeIcon(']]..v2..[[');]])
    else
      runHaxeCode([[game.iconP1.changeIcon(']]..v2..[[');]])
    end
  end
end