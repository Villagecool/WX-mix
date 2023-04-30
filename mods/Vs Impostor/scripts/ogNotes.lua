function onCreatePost()
    bf = getProperty('boyfriend.curCharacter')
    dad = getProperty('dad.curCharacter')
    charNotes()
end

function onEvent(n, v1, v2)
    bf = getProperty('boyfriend.curCharacter')
    dad = getProperty('dad.curCharacter')
    if n == 'Change Character' then
        charNotes()
    end
end

function charNotes()
    reset()
    if bf == 'bf-defeatold' then
        setNotes('bf', 'v4UI/NOTE_assets', 'v4UI/noteSplashes')
    end
end

function setNotes(char, texture, splashes)
    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
        setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
    end
    if char == 'bf' then
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'texture', texture);
        end
        for i = 0, getProperty('unspawnNotes.length') - 1 do
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' and getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
                setPropertyFromGroup('unspawnNotes', i, 'texture', texture);
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', splashes);
            end
        end
    elseif char == 'dad' then
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'texture', texture);
        end
        for i = 0, getProperty('unspawnNotes.length') - 1 do
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' and getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
                setPropertyFromGroup('unspawnNotes', i, 'texture', texture);
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', splashes);
            end
        end
    else
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'texture', texture);
            setPropertyFromGroup('opponentStrums', i, 'texture', texture);
        end
        for i = 0, getProperty('unspawnNotes.length') - 1 do
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
                setPropertyFromGroup('unspawnNotes', i, 'texture', texture);
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', splashes);
            end
        end
    end
end
function reset()
    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
        setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
    end
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes');
        end
    end
end