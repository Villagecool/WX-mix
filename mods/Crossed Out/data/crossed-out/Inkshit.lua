

local InkedEffect = 0
local RemoveInkEffect = false
local EnableInkedEffect = true

function onUpdate()
 

        if EnableInkedEffect and InkedEffect < 0.5 then
            InkedEffect = InkedEffect + 0.02
        end
        if (curStep > 2545 and InkedEffect < 0.5 and curStep < 2809) then
            RemoveInkEffect = false
            EnableInkedEffect = true
           
        elseif (curStep > 2545 and getProperty('health') > 0.05 and curStep < 2809) then
            setProperty('health',getProperty('health') - 0.005)
        end
    
        if (RemoveInkEffect and not lowQuality) then
            if InkedEffect > 0 then
                InkedEffect = InkedEffect - 0.02
            end
    
            
        end
end


function opponentNoteHit()
    if getProperty('dad.curCharacter') == 'Bendy_IC' or getProperty('dad.curCharacter') == 'Bendy_Dark' or getProperty('dad.curCharacter') == 'Nightmare-Cuphead' or getProperty('dad.curCharacter') == 'Nightmare-Cupheadmid' or getProperty('dad.curCharacter') == 'Nightmare-Cupheadsanscam'  and getProperty('health') >= 0.04 then
  
      cameraShake('camGame', 0.005, 0.5);
        cameraShake('camHud', 0.0005, 0.01);
    end
  end
