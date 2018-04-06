
#!/bin/bash -x
echo "BLAH"
rm -Rf ~/Library/Application\ Support/Firefox
rm -Rf ~/Library/Caches/Firefox
rm -Rf ~/Library/Preferences/org.mozilla.firefox.plist
./common-clean.sh
# [user data dir] ~/Library/Application Support/Google/Chrome
# [profile dir] ~/Library/Application Support/Google/Chrome/Default
# [user cache dir] ~/Library/Caches/Google/Chrome/Default
