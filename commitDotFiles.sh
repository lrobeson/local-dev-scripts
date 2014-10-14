# Used by Alfred to automatically commit changes in important local dev files
#
# Copy & paste this into Terminal to set required permissions and run the script:
# ~/Dropbox/Local-Dev-Config/scripts/commitDotfiles.sh

cd ~/Dropbox/Local-Dev-Config/dotfiles && git add -u . && git commit -m "Automatic snapshot by Alfred. Yay, automation!" && git push origin master