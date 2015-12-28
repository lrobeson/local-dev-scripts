# Used by Alfred workflow to automatically commit changes in Sublime Text directory.
#
# To run/test this script manually, copy & paste this into Terminal:
# ~/Google\ Drive/Local\ Dev/scripts/commitSublimeTextConfig.sh

cd /Users/ldavis-robeson/Google\ Drive/Local\ Dev/Sublime\ Text && git add . && git add -u . && git commit -m "Automatic snapshot by Alfred. Yay, automation!" && git push origin master