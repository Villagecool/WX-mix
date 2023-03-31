function onCreatePost()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'joe-death'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'joe_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end