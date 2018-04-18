@echo on

set DataDir=C:\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1

rmdir /Q /S "%DataDir%"

set History=C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History

rmdir /Q /S "%History%"

rem set IETemp=C:\Users\%USERNAME%\AppData\Local\Temp

rem rmdir /Q /S "%IETemp%"

set Cookies=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies

rmdir /Q /S "%Cookies%"

reg delete "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs" /f
