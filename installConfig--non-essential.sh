#
# AUTOMATED SETUP ON A NEW MACHINE:
#
# This script takes care of installing local dev tools, applications, fonts,
# and copying over custom configuration.
#
# 1) Download Google Drive:
#     - https://tools.google.com/dlpage/drive/index.html?hl=en
#
# 2) Set up Google Drive:
#     - Go to Preferences
#     - select the "Sync Options" tab
#     - select the "Only sync some folders to this computer" box
#     - select ONLY the "Local Dev" folder for fastest syncing
#     - click "Apply changes" and wait for sync to finish
#
# 3) Copy & paste this line into Terminal to run this script:
#   cd ~/Google\ Drive/Local\ Dev/scripts/;chmod a+x installConfig.sh;./installConfig.sh
#
# 4) Manual steps when script is done running:
#   - copy SSH keys from previous machine or generate new ones (https://help.github.com/articles/generating-ssh-keys): update on Github, send to Sysadmins
#   - open Firefox or Chrome to sync and import bookmarks, add-ons, and history
#   - install company fonts in the Local Dev -> fonts directory: Metric and Copernicus
#   - re-add application licenses that weren't exported (Bartender, Boom, Sublime Text, etc.)
#   - install non-cask applications in ~/Google\ Drive/Local\ Dev/non-cask\ Applications
#
#
# INSPIRED BY THESE POSTS:
#   1) https://gist.github.com/denji/92d7351151dad9c1bdc9
#   2) http://carlosbecker.com/posts/first-steps-with-mac-os-x-as-a-developer/
#   3) http://computers.tutsplus.com/tutorials/perfect-configurations-with-homebrew-and-cask--cms-20768
#   4) http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
#

# Install applications
echo "Homebrew Cask: installing non-essential apps..."
apps=( # Apps
  #adium
  #acquia-dev-desktop
  avocode
  #blink1control
  #cheatsheet
  #disk-inventory-x
  #firefox # Cask version doesn't keep up
  #flash
  #flash-player
  fluid
  #mamp
  #mightytext
  #silverlight
  #skype
  #spideroakone
  spotify
  #telegram-desktop
  thunderbird
)
brew cask install --appdir="/Applications" ${apps[@]} # Install apps to /Applications

echo "Done! Yay, automation!"
