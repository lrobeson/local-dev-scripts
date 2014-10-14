# Used by Alfred workflow to automatically commit changes in dotfile directory.
#
# To run this script manually, copy & paste this into Terminal:
# ~/Dropbox/Local-Dev-Config/scripts/commitDotfiles.sh

cd ~/Dropbox/Local-Dev-Config/dotfiles && git add -u . && git commit -m "Automatic snapshot by Alfred. Yay, automation!" && git push origin master