# Used by Alfred to automatically commit changes in important local dev files
#
# Copy & paste this into Terminal to set required permissions and run the script:
# ~/Dropbox/Local-Dev-Config/scripts/commitChangedFiles.sh

cd ~/Dropbox/Local-Dev-Config/scripts && git add -u . && git commit -m "Automatic snapshot by Alfred. Yay, automation!" && git push origin master