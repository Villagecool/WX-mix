
function onCreate()
	addLuaScript('data/CameraMove.lua')
    setGlobalFromScript('data/CameraMove','CamNoteMove',20)
    setGlobalFromScript('data/CameraMove','CharcterMove',{dad=10,bf=10})
    setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={2100,1000},bf={2500,1000}})
    setGlobalFromScript('data/CameraMove','CharacterForce',true)

	makeLuaSprite('cargo walls', 'airship/cargowall', 50, 50);
	scaleLuaSprite('cargo walls', 1., 1.)
	addLuaSprite('cargo walls', false);

	makeLuaSprite('cargo', 'airship/cargos', -150, 50);
	scaleLuaSprite('cargo', 1., 1.)
	addLuaSprite('cargo', false);
end