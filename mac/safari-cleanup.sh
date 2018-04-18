
#!/bin/bash -x
mv ~/Library/Safari ~/Desktop/Safari-`date +%Y%m%d%H%M%S`
rm -Rf ~/Library/Caches/Apple\ -\ Safari\ -\ Safari\ Extensions\ Gallery
rm -Rf ~/Library/Caches/Metadata/Safari
rm -Rf ~/Library/Caches/com.apple.Safari
rm -Rf ~/Library/Caches/com.apple.WebKit.PluginProcess
rm -Rf ~/Library/Caches/com.apple.appstore
rm -Rf ~/Library/Caches/com.apple.parsecd
rm -Rf ~/Library/Preferences/Apple\ -\ Safari\ -\ Safari\ Extensions\ Gallery
rm -Rf ~/Library/Preferences/com.apple.Safari.SafeBrowsing
rm -Rf ~/Library/Preferences/com.apple.Safari.LSSharedFileList.plist
rm -Rf ~/Library/Preferences/com.apple.Safari.RSS.plist
rm -Rf ~/Library/Preferences/com.apple.Safari.plist
rm -Rf ~/Library/Preferences/com.apple.WebFoundation.plist
rm -Rf ~/Library/Preferences/com.apple.WebKit.PluginHost.plist
rm -Rf ~/Library/Preferences/com.apple.WebKit.PluginProcess.plist
rm -Rf ~/Library/PubSub/Database
rm -Rf ~/Library/Cookies/Cookies.binarycookies
./common-clean.sh
