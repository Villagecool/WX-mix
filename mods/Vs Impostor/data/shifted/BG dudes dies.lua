function onCreate()

	makeAnimatedLuaSprite('dude', 'suscoderded', 1600, 1100);
	luaSpriteAddAnimationByPrefix('dude', 'idle','', 24, false);
	scaleLuaSprite('dude', 1.5, 1.5)
	addLuaSprite('dude', true);
    setProperty('dude2.alpha', 0)
    setProperty('ded.alpha', 1)
end
function onCreatePost()
noteTweenX('leaexx', 4, 412, 0.8, 'smootherStepOut')
	noteTweenX('dfxxsf', 5, 524, 0.9, 'smootherStepOut')
	noteTweenX('uvzzvv', 6, 636, 1, 'smootherStepOut')
	noteTweenX('rzxxxz', 7, 748, 1.1, 'smootherStepOut')
	noteTweenX('leftnotegone', 0, -150, 0.000000001, 'smootherStepOut')
	noteTweenX('downnotegone', 1, -150, 0.000000001, 'smootherStepOut')
	noteTweenX('upnotegone', 2, 1500, 0.000000001, 'smootherStepOut')
	noteTweenX('rightnotegone', 3, 1500, 0.000000001, 'smootherStepOut')
end