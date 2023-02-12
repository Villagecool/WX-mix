
function loadPopup(tag,path,x,y,sound)
    makeLuaSprite('sizeObject', path, 0, 0)
    setProperty('sizeObject.alpha', 0)
    addLuaSprite('sizeObject', false)
            runHaxeCode([[
                var window = Lib.application.createWindow({
                    x: 5,
                    y: 2,
                    width: ]]..getProperty('sizeObject.width')..[[,
                    height: ]]..getProperty('sizeObject.height')..[[,
                    title:']]..tag..[[',
                    borderless: false,
                    alwaysOnTop: true,
    
    
                });
    
                var bg = Paths.image("]]..path..[[").bitmap;
                var sprite = new Sprite();
    
                var m = new Matrix();
    
                sprite.graphics.beginBitmapFill(bg, m);
                sprite.graphics.drawRect(0, 0, bg.width, bg.height);
                sprite.graphics.endFill();
                FlxG.mouse.useSystemCursor = true; 
                window.stage.addChild(sprite);
                window.x = ]]..x..[[;
                window.y = ]]..y..[[
            ]])
            removeLuaSprite('sizeObject', false)
                playSound(sound, 1)
end
function loadPopup2(tag, path, x, y, border)
    makeLuaSprite('sizeObject', path, 0, 0)
    setProperty('sizeObject.alpha', 0)
    addLuaSprite('sizeObject', false)
    ffi = require('ffi')    
    ffi.cdef[[
        typedef int BOOL;
        typedef int BYTE;
        typedef int LONG;
        typedef LONG DWORD;
        typedef DWORD COLORREF;
        typedef unsigned long HANDLE;
        typedef HANDLE HWND;
        typedef int bInvert;

        HWND GetActiveWindow(void);

        LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);

        HWND SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);

        DWORD GetLastError();
    ]]
		addHaxeLibrary('Lib', 'openfl')
		addHaxeLibrary('Paths')
		addHaxeLibrary('Matrix', 'openfl.geom')
		addHaxeLibrary('Rectangle', 'openfl.geom')
		addHaxeLibrary('Sprite', 'openfl.display')

--The script lol

		runHaxeCode([[
			FlxG.mouse.useSystemCursor = true;
			windowPopup = Application.current.createWindow({
				x: ]]..x..[[,
				y: ]]..y..[[,
				width: ]]..getProperty('sizeObject.width')..[[,
				height: ]]..getProperty('sizeObject.height')..[[,
				title: ]]..tag..[[,
				borderless: false,
				alwaysOnTop: false,
	
	
			});
	
			var bg = Paths.image(]]..path..[[).bitmap;
            var sprite = new Sprite();

            var m = new Matrix();

            sprite.graphics.beginBitmapFill(bg, m);
            sprite.graphics.drawRect(0, 0, bg.width, bg.height);
            sprite.graphics.beginFill(0x010101, 1);
            sprite.graphics.endFill();
            windowPopup.x: ]]..x..[[,
            windowPopup.y: ]]..y..[[,
            FlxG.mouse.useSystemCursor = true; 
            windowPopup.stage.addChild(sprite);
		]])
        if border then
		    setTransparency(0x00010101)
        end
		--runHaxeCode("Application.current.window.focus();")
        removeLuaSprite('sizeObject', false)
end
function setTransparency(color)
	local win = ffi.C.GetActiveWindow()
	if win == nil then
		debugPrint('Error finding window!!! idiot!!!!')
		debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
	end
	if ffi.C.SetWindowLongA(win, -20, 0x00080000) == 0 then
		debugPrint('error setting window to be layed WTF DFOES THAT EVBEN MEAN LMAOOO!!! IM NOT NO NERD!')
		debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
	end
	if ffi.C.SetLayeredWindowAttributes(win, color, 0, 0x00000001) == 0 then
		debugPrint('error setting color key or whatever')
		debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
	end
end
function onEvent(t,v1,v2)
    if t == 'popups' then
    loadPopup('Your Running out of Time!', "popups/countdown", math.random(0,1500), math.random(0,500), nil)
    ezTimer('popup1', 2, function() loadPopup('Wait!', "popups/survey", math.random(0,1500), math.random(0,500), nil) end)
    ezTimer('popup2', 3, function() loadPopup('Final Offer!', "popups/cupon", math.random(0,1500), math.random(0,500), nil) end)
    ezTimer('popup3', 3.5, function() loadPopup('Your Running out of Time!', "popups/countdown", math.random(0,1500), math.random(0,500), nil)end)
    ezTimer('popup4', 4, function() loadPopup('Wait!', "popups/survey",math.random(0,1500), math.random(0,500), nil) end)
    ezTimer('popup5', 4.2, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup6', 5.3, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup7', 5.5, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup8', 5.6, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup9', 5.8, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup10', 5.9, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup15', 6.2, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup16', 6.3, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup17', 6.5, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup18', 6.6, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('popup19', 6.8, function() loadPopup('ERROR!', "popups/error", math.random(0,1500), math.random(0,500), 'blue-screen') end)
    ezTimer('bluescreen', 7, function() blue() end)
    end
end
function onCreatePost()
    addHaxeLibrary('Lib', 'openfl')
    addHaxeLibrary('Application', 'openfl.display')
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('FlxG', 'flixel')
    addHaxeLibrary('Matrix', 'openfl.geom')
    addHaxeLibrary('Rectangle', 'openfl.geom')
    addHaxeLibrary('Sprite', 'openfl.display')
    runHaxeCode([[
        Application.current.window.focus();
        FlxG.mouse.useSystemCursor = true;
        FlxG.autoPause = false;
    ]])
end


timers = {}
function ezTimer(tag, timer, callback) -- Better
     table.insert(timers,{tag, callback})
     runTimer(tag, timer)
end

function onTimerCompleted(tag)
     for k,v in pairs(timers) do
          if v[1] == tag then
               v[2]()
          end
     end
end
function goodNoteHit()
end
function blue()
    runHaxeCode('windowPopup.close();')
	makeLuaSprite('bluescreen', 'bluescreen', 0, 0)
	addLuaSprite('bluescreen', true)
	setObjectCamera('bluescreen', 'camOther')
    setPropertyFromClass("openfl.Lib", "application.window.fullscreen", true)
    setProperty('vocals.volume', 0)
    runHaxeCode('Application.current.window.alwaysOnTop = true;')
    setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
end