function onCreate()

	makeLuaSprite('walls', 'O2Background', 200, 600);
	scaleLuaSprite('walls', 0.8, 0.8)
	addLuaSprite('walls', false);

	makeAnimatedLuaSprite('Fans', 'fansss', 470, 800);
	luaSpriteAddAnimationByPrefix('Fans', 'Fans','fansss instance', 24, true);
	addLuaSprite('Fans', false);

	makeLuaSprite('switch', 'switch', 270, 1050);
	scaleLuaSprite('switch', 1, 1)
	addLuaSprite('switch', false);
end
