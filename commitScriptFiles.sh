# Used by Alfred workflow to automatically commit changes in scripts directory.
#
# To run/test this script manually, copy & paste this into Terminal:
# ~/Google\ Drive/Local\ Dev/scripts/commitScriptFiles.sh

cd /Users/ldavisrobeson/Google\ Drive/Local\ Dev/scripts && git add . && git add -u . && git commit -m "Automatic snapshot by Alfred. Yay, automation!" && git push origin master