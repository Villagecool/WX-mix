function onCreatePost()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'vc-call'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'Vc_Death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end