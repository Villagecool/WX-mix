
local pcname = os.getenv('USERNAME')
local ffi = require("ffi")
-- replace 0x00000000 with whatever color i dont care
--02FF02
--0C0C0C
--0D0A0D
ffi.cdef([[
	enum{
		COLOR_REF = 0xFF0D0A0D
	};

	typedef void* HWND;

	typedef int BOOL;

	typedef unsigned char BYTE;
	typedef unsigned long DWORD;
	typedef DWORD COLORREF;

	HWND GetActiveWindow();

	long SetWindowLongA(HWND hWnd, int nIndex, long dwNewLong);

	BOOL SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
]])

function transWindow()
    makeLuaText('camWindow', ' ' ,OGX, 0, OGY);
    setProperty('camWindow.x',OGX)
    setProperty('camWindow.y',OGY)
    addLuaText('camWindow')
	setObjectCamera('camWindow', 'camOther')
    makeLuaSprite('greenscreen', 'greenscreen', -300, -300);
    setScrollFactor('greenscreen', 0, 0);
    scaleObject('greenscreen', 30, 30);
    screenCenter('greenscreen', 'xy');
    addLuaSprite('greenscreen', false);
	makeLuaSprite('stage2', 'stage-but-bad', -600, -140);
	setScrollFactor('stage2', 1, 1);
	addLuaSprite('stage2', false);
	makeLuaSprite('stage2-p', 'stage-but-bad-pixel', -600, -140);
	setScrollFactor('stage2-p', 1, 1);
	addLuaSprite('stage2-p', false);
	makeLuaSprite('blue', 'blue thingy', 0, 0);
	setScrollFactor('blue', 1, 1);
	scaleObject('blue', 0.2, 0.2);
	addLuaSprite('blue', false);
    screenCenter('blue', 'xy');

    setProperty("defaultCamZoom",0.7)
    doTweenZoom('camz','camGame',0.7,0.4,'sineInOut')
    
    local hwnd = ffi.C.GetActiveWindow()
        
    if ffi.C.SetWindowLongA(hwnd, -20, 0x00080000) ~= 0 then
        ffi.C.SetLayeredWindowAttributes(hwnd, ffi.C.COLOR_REF, 0, 0x00000001) 
    end
	setPropertyFromClass("openfl.Lib", "application.window.borderless",true)
	setPropertyFromClass("openfl.Lib", "application.window.alwaysOnTop",true)
	setPropertyFromClass("openfl.Lib", "application.window.borderless",true)
	setPropertyFromClass("openfl.Lib", "application.window.alwaysOnTop",true)
end
function onCreate()
    --setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Your Screwedin\': Good luck '.. pcname..'!')
    OGX = getPropertyFromClass("openfl.Lib", "application.window.x")
    OGY = getPropertyFromClass("openfl.Lib", "application.window.y")
end
function onUnpause()
    setProperty('camWindow.x',getPropertyFromClass("openfl.Lib", "application.window.x"))
    setProperty('camWindow.y',getPropertyFromClass("openfl.Lib", "application.window.y"))
end
function onSongStart()
    transWindow()
end
function onDestroy()
    
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
	setPropertyFromClass("openfl.Lib", "application.window.borderless",false)
	setPropertyFromClass("openfl.Lib", "application.window.alwaysOnTop",false)
    setPropertyFromClass("openfl.Lib", "application.window.x", OGX)
    setPropertyFromClass("openfl.Lib", "application.window.y", OGY)
end
function onTweenCompleted(name)
    if name == 'camz' then
      	 setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
    end
end