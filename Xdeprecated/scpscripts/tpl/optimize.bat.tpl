@echo off

rem USAGE: 
rem 1) mit puttygen.exe ein privates keyfile (.ppk) erstellen
rem 2) speichern und merken wo (zb: "c:\login.ppk")
rem 3) public key aus tool kopieren und am login.mat...-server in ~/.ssh/authorized_keys2 anh�ngen
rem 4) setampluser("login/gondor username","c:\xy\keyfile.ppk")
rem 5) in matlab "!optimize" im projektverzeichnis eingeben

echo.---------------------------------------------------------------
echo.---------------------------UPLOAD------------------------------
echo.---------------------------------------------------------------

".\tools\winscp\winscp.com" /script:"#{scriptdir_relative}#\data_up.txt" /privatekey="#{keyfile}#"

echo. ---------------------------------------------------------------
echo. ---------------------------EXECUTE-----------------------------
echo. ---------------------------------------------------------------

".\tools\winscp\winscp.com" /script:"#{scriptdir_relative}#\execute.txt" /privatekey="#{keyfile}#"

echo. ---------------------------------------------------------------
echo. ---------------------------DOWNLOAD----------------------------
echo. ---------------------------------------------------------------

".\tools\winscp\winscp.com" /script:"#{scriptdir_relative}#\data_down.txt" /privatekey="#{keyfile}#"