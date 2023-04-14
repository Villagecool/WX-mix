doTheCamZoomThing = false
maxCamBeats = 0
ClickClack = 0

function onEvent(name, value1, value2)
	if name == 'Ambient_CamZoom' then
		if value1 == '1' then
			doTheCamZoomThing = true
			maxCamBeats = 0
			ClickClack = 1
		elseif value1 == '2' then
			doTheCamZoomThing = true
			maxCamBeats = 1
			ClickClack = 2
		elseif value1 == '3' then
			doTheCamZoomThing = true
			maxCamBeats = 3
			ClickClack = 3
		elseif value1 == 'Dont' then
			doTheCamZoomThing = false
		end	

		LazyCamBoop_Pow = value2 
	end
end

function onBeatHit()
	if doTheCamZoomThing == true then
		if ClickClack < maxCamBeats then 
			ClickClack = ClickClack + 1
		else
			triggerEvent('Add Camera Zoom', LazyCamBoop_Pow, '0');
			--triggerEvent('Add Camera Zoom', LazyCamBoop_Pow);
			ClickClack = 0
		end
	end
end
