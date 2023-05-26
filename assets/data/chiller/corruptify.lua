function onStartCountdown()
    c = 'EF9EB6'
    for i = 1,7 do
	    doTweenColor('changeColor'..i,i, c, 5,'linear')
    end
    doTweenColor('changeColorDad','dad', c, 5,'linear')
    doTweenColor('changeColorWyat','Wyatt', c, 5,'linear')
end