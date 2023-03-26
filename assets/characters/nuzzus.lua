function opponentNoteHit()
    if getProperty('health') > 0.2 then
        setProperty('health', getProperty('health')-0.02)
    end
end