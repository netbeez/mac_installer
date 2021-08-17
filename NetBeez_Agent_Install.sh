#!/bin/sh
cd /tmp &&
curl -L $(curl -s https://api.github.com/repos/netbeez/mac_installer/releases/latest | grep browser_download_url | awk -F "\"" '{print $4}') -o NetBeezInstaller.dmg &&
hdiutil attach NetBeezInstaller.dmg &&
/Volumes/NetBeezInstaller/NetBeezInstaller.app/Contents/MacOS/NetBeezInstaller --silent --autosetup=1 --installgroup=1 --startonboot=1 --autoupdate=1 --secretkey=PUT_YOUR_SECRET_HERE &&
hdiutil detach /Volumes/NetBeezInstaller
