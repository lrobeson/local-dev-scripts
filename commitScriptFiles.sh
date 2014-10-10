# Used by Alfred to automatically commit changes in important local dev files
#
# Copy & paste this into Terminal to set required permissions and run the script:
# chmod a+x ~/Dropbox/Local\ Dev\ Config/scripts/commitChangedFiles.sh && ~/Dropbox/Local\ Dev\ Config/scripts/commitChangedFiles.sh

cd ~/Dropbox/Local\ Dev\ Config/scripts && git add . && git commit -m "Automatic snapshot" && git push origin master