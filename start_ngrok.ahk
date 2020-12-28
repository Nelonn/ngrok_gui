#NoTrayIcon

global ConfigName = "./config.ini"
global NgrokName = "./ngrok.exe"
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

Run, %NgrokName% authtoken %opt_Token%
Sleep, 500
Run, %NgrokName% tcp -region %opt_Region% %opt_Port%

ExitApp