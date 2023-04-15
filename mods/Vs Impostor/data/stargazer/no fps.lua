-- Kade Engine UI
-- Script by Fus10n

local wonky = true
local keVersion = "1.4.2"

local function lerp(a, b, t)
    return a * (1 - t) + b * t
end

local fpsEnabled = false

local ratingOffsetY = 0
local numberOffsetY = 0

function onCreate()
end

function onCreatePost()
    luaDebugMode = true

    fpsEnabled = getPropertyFromClass("Main", "fpsVar.visible");
    setPropertyFromClass("Main", "fpsVar.visible", false);
end

function onDestroy()
    setPropertyFromClass("Main", "fpsVar.visible", fpsEnabled);
end
