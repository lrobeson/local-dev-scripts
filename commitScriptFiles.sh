# Used by Alfred workflow to automatically commit changes in scripts directory.
#
# To run this script manually, copy & paste this into Terminal:
# ~/Dropbox/Local-Dev-Config/scripts/commitScriptFiles.sh

cd ~/Dropbox/Local-Dev-Config/scripts && git add . && git add -u . && git commit -m "Automatic snapshot by Alfred. Yay, automation!" && git push origin master