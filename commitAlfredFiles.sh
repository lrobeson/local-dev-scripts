# Used by Alfred workflow to automatically commit changes in Alfred directory.
#
# To run this script manually, copy & paste this into Terminal:
# ~/Dropbox/Local-Dev-Config/scripts/commitAlfredFiles.sh

cd ~/Dropbox/Local-Dev-Config/Alfred && git add . && git add -u . && git commit -m "Automatic snapshot by Alfred. Yay, automation!" && git push origin master