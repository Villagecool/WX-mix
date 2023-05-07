function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.2 and noteType == 'GF Sing' then
        setProperty('health', getProperty('health')-0.01)
    end
end