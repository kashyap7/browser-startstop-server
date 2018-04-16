@echo on

set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox

rmdir /Q /S "%DataDir%"

set ExtraDir=C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox

rmdir /Q /S "%ExtraDir%"
