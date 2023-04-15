function onEvent(eventName, value1, value2)
    if eventName=='flash' then

        if value1=='0' or value1=='1' then
            cameraFlash('game','FFFFFF',crochet/1000,false)
        elseif value1=='2' then
            cameraFlash('other','000000',crochet/1000,false)
        elseif value1=='3' then
            cameraFlash('other','FFFFFF',crochet/1000,false)
        end
    end
end