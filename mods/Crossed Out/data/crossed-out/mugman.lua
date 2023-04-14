function onCreate()


    makeAnimatedLuaSprite('ink', 'cup/rain/Cup-NewRAINLayer02',-600,-381);
	addAnimationByPrefix('ink','dance','RainFirstlayer instance 1',24,true);
	objectPlayAnimation('ink','RainFirstlayer instance 1',false)
	setLuaSpriteScrollFactor('ink', 0, 0);
	
	scaleObject('ink',1.5,1.5)
	

    
	makeAnimatedLuaSprite('Cup-NewRAINLayer01', 'cup/rain/Cup-NewRAINLayer01',-350,-191);
	addAnimationByPrefix('Cup-NewRAINLayer01','dance','RainFirstlayer instance 1',24,true);
	objectPlayAnimation('Cup-NewRAINLayer01','RainFirstlayer instance 1',false)
	setLuaSpriteScrollFactor('Cup-NewRAINLayer01', 0, 0);
	
	scaleObject('Cup-NewRAINLayer01',1.2,1.2)
	


    makeAnimatedLuaSprite('MugMan','cup/Mugman Fucking dies',2000,1300)
    addAnimationByPrefix('MugMan','Walking','Mugman instance 1',24,false)
    addAnimationByPrefix('MugMan','Dead','MUGMANDEAD YES instance 1',24,false)

    makeAnimatedLuaSprite('KnockOutText','cup/knock',125,200)
    addAnimationByPrefix('KnockOutText','Knock','A KNOCKOUT!',28,false)
    setObjectCamera('KnockOutText','hud')
    scaleObject('KnockOutText',0.9,0.9)


   

end

function onUpdate(elapsed)   
 Random = math.random(0,1)
    if getProperty('KnockOutText.animation.curAnim.finished') then
        doTweenAlpha('KnockBye','KnockOutText',0,1,'LinearOut')
    end
end

function onStepHit()
    if curStep == 513 then
        addLuaSprite('Cup-NewRAINLayer01', true);
    end
    
    
    if curStep == 744 then
        setObjectOrder('MugMan',getObjectOrder('Cup-NewRAINLayer01'))
        addLuaSprite('MugMan')
    end
    if curStep == 768 then
        objectPlayAnimation('MugMan','Dead',false)
        playSound('Cup/CupHurt')
        playSound('Cup/knockout')
        addLuaSprite('KnockOutText',true)
    end

    if curStep == 2543 then
        addLuaSprite('ink', true)
        

    end

end



