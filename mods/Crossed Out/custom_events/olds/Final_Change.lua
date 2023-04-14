
function onEvent(name, value1, value2)
	if name == 'Final_Change' then
		if value1 == 'c' then
			triggerEvent('Change Character', 'dad', 'final_cuphead')

			doTweenAlpha('Final_Bendy_Tween','Final_Bendy', 1, 0.01, 'linear')
			doTweenAlpha('Final_Sans_Tween','Final_Sans', 1, 0.01, 'linear')
			doTweenAlpha('Final_Cuphead_Tween','Final_Cuphead', 0, 0.01, 'linear')
			doTweenAlpha('Final_Cuphead2_Tween','Final_Cuphead_front', 0, 0.01, 'linear')
			doTweenAlpha('Final_Sans2_Tween','Final_Sans_front', 0, 0.01, 'linear')
		elseif value1 == 's' then
			triggerEvent('Change Character', 'dad', 'final_sans')

			doTweenAlpha('Final_Bendy_Tween','Final_Bendy', 1, 0.01, 'linear')
			doTweenAlpha('Final_Sans_Tween','Final_Sans', 0, 0.01, 'linear')
			doTweenAlpha('Final_Cuphead_Tween','Final_Cuphead', 0, 0.01, 'linear')
			doTweenAlpha('Final_Cuphead2_Tween','Final_Cuphead_front', 1, 0.01, 'linear')
			doTweenAlpha('Final_Sans2_Tween','Final_Sans_front', 0, 0.01, 'linear')
		elseif value1 == 'b' then
			triggerEvent('Change Character', 'dad', 'final_bendy')

			doTweenAlpha('Final_Bendy_Tween','Final_Bendy', 0, 0.01, 'linear')
			doTweenAlpha('Final_Sans_Tween','Final_Sans', 0, 0.01, 'linear')
			doTweenAlpha('Final_Cuphead_Tween','Final_Cuphead', 0, 0.01, 'linear')
			doTweenAlpha('Final_Cuphead2_Tween','Final_Cuphead_front', 1, 0.01, 'linear')
			doTweenAlpha('Final_Sans2_Tween','Final_Sans_front', 1, 0.01, 'linear')
		end
	end	
end