
local pcname = os.getenv('USERNAME')
if pcname == 'gloga' then
     pcname = 'villagecool'
end
local command = ''
local usedcommand = ''
function onCreate()
     makeLuaSprite('screen', ' ', 0, 0)
     makeGraphic('screen',1920,1080,'000000')
     scaleObject('screen', 1, 1)
     setObjectCamera('screen', 'other')
     addLuaSprite('screen')
     
     makeLuaText('commands', 'PS C:\\Users\\'..pcname..'>', nil, 10, 10)
     setTextColor('commands', 'FFFFFF')
     setTextBorder('commands', 10)
     setTextSize('commands', 30)
     setObjectCamera('commands', 'other')
     addLuaText('commands')

end
     local allowCountdown = false;
     function onStartCountdown()
          if not allowCountdown then -- Block the first countdown
               allowCountdown = true;    
               --playMusic('codesIdle', 1, true)
               return Function_Stop
          end
          return Function_Continue
     end
     
digs = { 'A', 'B', 'C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', '1','2','3','4','5','6','7','8','9','10' }
function onUpdate(elapsed)
     setTextAlignment('commands', 'left')
     setTextString('commands', 'welcome to developer\'s console 1.3.2\n\nPress Shift To Reset\n\nPS C:\\Users\\'..pcname..'>'.. usedcommand.. command)
     if keyboardJustPressed('SHIFT') then
          resetCon()
     end
     if keyboardJustPressed('ESCAPE') then
          exitSong()
     end
     if keyboardJustPressed('BACKSPACE') then
          command = ''
     end
     if keyboardJustPressed('ENTER') then
          enter(command)
          command = ''
     end
     if keyboardJustPressed('SPACE') then
          command = command..' '
     end
     for i = 1,26 do
          if keyboardJustPressed(digs[i]) then
               command = command..digs[i]
          end
     end
end
function resetCon()
     usedcommand = ''
     command = ''
end
function enter(com)
     if com == 'ACCESS IMAGE' then
          loadSong('dad-battle', 2)
     elseif com == 'HELP' then
          usedcommand = usedcommand..command..'\nShift to Reset\nESC to Go Back\nBackspace to reset line\n\nPS C:\\Users\\'..pcname..'>'
     else
          if com == '' then
               usedcommand = usedcommand..command..'\nPS C:\\Users\\'..pcname..'>'
          else
               usedcommand = usedcommand..command..'\n\nError: Command Not Found\n\nPS C:\\Users\\'..pcname..'>'
          end
     end
end