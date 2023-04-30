function onCreatePost()
    setProperty('timeBarBG.visible', false);
    setProperty('timeTxt.x', 42 + (screenWidth / 2) - 585);
    setProperty('timeTxt.y', 20);
    setTextSize('timeTxt', 14);
    setTextBorder('timeTxt', 1, '000000');
    setTextAlignment('timeTxt', 'left');
    if getPropertyFromClass('ClientPrefs', 'downScroll') then
        setProperty('timeTxt.y', screenHeight - 25);
    end

    makeLuaSprite('timeBarBGS', 'timeBar', getProperty('timeTxt.x') - 4, getProperty('timeTxt.y') - 4 + (getProperty('timeTxt.height') / 4));
    setObjectCamera('timeBarBGS', 'camHUD');
    setProperty('timeBarBGS.antialiasing', false);
    addLuaSprite('timeBarBGS');

    setProperty('timeBar.x', getProperty('timeBarBGS.x') + 4);
    setProperty('timeBar.y', 24);
    if getPropertyFromClass('ClientPrefs', 'downScroll') then
        setProperty('timeBar.y', screenHeight - 25 + 4);
    end
    setTimeBarColors('44d844', '2e412e');
    setTextColor('scoreTxt', getHealthColor('dad'));
    setTextColor('botplayTxt', getHealthColor('dad'));
end
function onUpdatePost(e)

	setProperty('botplayTxt.visible', 0)

    setTextString('timeTxt', songName);
    setProperty('timeBarBGS.alpha', getProperty('timeBar.alpha'));
end
function onEndSong()
    setProperty('timeBarBGS.visible', false);
end
function getHealthColor(char)
    return string.format('%02x%02x%02x', getProperty(char..'.healthColorArray[0]'), getProperty(char..'.healthColorArray[1]'), getProperty(char..'.healthColorArray[2]'))
end

function lerp(a,b,t) return a * (1-t) + b * t end --https://love2d.org/forums/viewtopic.php?t=83180

function onEvent(n)
    if n == 'Change Character' then
        setTextColor('scoreTxt', getHealthColor('dad'));
        setTextColor('botplayTxt', getHealthColor('dad'));
    end
end