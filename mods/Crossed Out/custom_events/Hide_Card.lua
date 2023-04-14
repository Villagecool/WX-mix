function onEvent(name,value1,value2)
	if name == 'Hide_Card' then 

		
			setProperty('Cardcrap.visible', false)
			
		end

		if value1 == 'Normal' then
		
			setProperty('Cardcrap.visible', true)
		


		end
	end
			