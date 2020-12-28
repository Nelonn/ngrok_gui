#NoTrayIcon

; Vars
global Version = "0.1"
global Debug = true

; System
global ConfigName = "./config.ini"
global StartName = "./start_ngrok.exe"
SetWorkingDir, "./"

IfNotExist, %ConfigName%
 {
    FileAppend,
    (
    [ngrok]
token=
port=25565
region=eu
    ), %ConfigName%
 }

IniRead, opt_Token, %ConfigName%, ngrok, token
IniRead, opt_Port, %ConfigName%, ngrok, port
IniRead, opt_Region, %ConfigName%, ngrok, region

Gui, Add, Text, x12 y9 w210 h20 , Token
Gui, Add, Edit, x12 y29 w210 h20 vToken , %opt_Token%
Gui, Add, Text, x12 y59 w210 h20 , Port
Gui, Add, Edit, x12 y79 w210 h20 Limit5 Number vPort , %opt_Port%
Gui, Add, Text, x12 y109 w210 h20 , Region
Gui, Add, Edit, x12 y129 w210 h20 Limit2 vRegion , %opt_Region%
Gui, Add, Button, x12 y159 w210 h30 gStartNgrok , Start

Gui, Show, Center h201 w234, ngrok GUI 0.1
Return

GuiClose:
  Gui, submit, NOhide
  IniWrite, %Token%, %ConfigName%, ngrok, token
  IniWrite, %Port%, %ConfigName%, ngrok, port
  IniWrite, %Region%, %ConfigName%, ngrok, region
  ExitApp
Return

StartNgrok:
  Gui, submit, NOhide
  IniWrite, %Token%, %ConfigName%, ngrok, token
  IniWrite, %Port%, %ConfigName%, ngrok, port
  IniWrite, %Region%, %ConfigName%, ngrok, region
  Run, %StartName%
Return