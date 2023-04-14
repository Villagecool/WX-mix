
local dady = 0
local bfy = 0
local gfy = 0
function onCreate()
	makeLuaSprite('bg', 'stages/Halo', -500, 0);
    scaleObject('bg', 2,2)
	addLuaSprite('bg', false)
    setSpriteShader("bg", 'wavy')
	wavytime(4,5,5,3)
end
function wavytime(xwave,ywave,xtime,ytime)
	setShaderFloat('bg','xwave',xwave)
	setShaderFloat('bg','ywave',ywave)
	setShaderFloat('bg','xtime',xtime)
	setShaderFloat('bg','ytime',ytime)
end
function onCreatePost()
	doTweenColor('rrr', 'boyfriend', 'B353BC', 0.1, 'linear')
	doTweenColor('rr5r', 'gf', 'B353BC', 0.1, 'linear')
	doTweenColor('rr52r', 'dad', 'B353BC', 0.1, 'linear')
    dady = getProperty('dad.y')
    bfy = getProperty('boyfriend.y')
    gfy = getProperty('gf.y')
end
function onUpdatePost(elapsed)
    setShaderFloat("bg", "iTime", os.clock())
    songPos = getSongPosition()

    local currentBeat = (songPos/5000)*(curBpm/60)
    doTweenY('opponentmove', 'dad', dady - 120*math.sin((currentBeat+12*12)*math.pi), 0.2)
    doTweenY('bfmove', 'boyfriend', bfy - -100*math.sin((currentBeat+12*12)*math.pi), 0.2)
    doTweenY('gfmove', 'gf', gfy - 50*math.sin((currentBeat+12*12)*math.pi), 0.2)
end