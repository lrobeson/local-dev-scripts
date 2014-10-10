# FRESH SETUP ON A NEW MACHINE:
#
# This script takes care of installing local dev tools, applications,
# and copying over custom configuration.
#
# 1) Download Dropbox: https://www.dropbox.com/downloading
#
# 2) Dropbox setup:
#     - Go to Dropbox Preferences
#     - select the Account tab
#     - select the "Change Settings" button next to "Selective Sync"
#     - select only the "Local Dev Config" folder for fastest syncing
#     - while files are syncing, feel free to move on to step 3
#
# 3) Download XCode (huge download: ~2.5GB) from the App Store:
#    https://itunes.apple.com/us/app/xcode/id497799835?mt=12
#
# 4) Finalize XCode setup by running this in Terminal:
#    sudo xcodebuild -license
#
# 5) Copy & paste this into Terminal to set required permissions and run the script:
#    chmod a+x ~/Dropbox/Local\ Dev\ Config/installConfig.sh && ~/Dropbox/Local\ Dev\ Config/installConfig.sh
#
# 6) Manual steps when script is done running:
#   - import config file from within the Terminal application:
#     ~/Dropbox/Local\ Dev\ Config/application\ preferences/Terminal.terminal
#   - regenerate SSH key(s) and update on Github, code.forumone.com, and send to Sysadmins
#     - https://help.github.com/articles/generating-ssh-keys
#   - clone specific project repos into the ~/Sites directory
#   - add each project to VirtualHostX
#   - import project database(s) and set up local_dev user in Sequel Pro
#   - copy applications from the ~/Dropbox/Local\ Dev\ Config/non-Cask\ applications folder to Applications
#   - log in to Firefox and run sync to set up bookmarks, add-ons, and history
#   - add custom fonts: F1 (), Input (http://input.fontbureau.com/download)
#   - re-add any application licenses that weren't exported (Bartender, Boom, Sublime Text, etc.)
#
#
# TROUBLESHOOTING:
# In order to run this script as a program, you must change the file mode to executable by typing this command
# in Terminal where the script is: chmod a+x installConfig.sh
#
# INSPIRATION:
# 1) https://gist.github.com/denji/92d7351151dad9c1bdc9
# 2) http://carlosbecker.com/posts/first-steps-with-mac-os-x-as-a-developer/
# 3) http://computers.tutsplus.com/tutorials/perfect-configurations-with-homebrew-and-cask--cms-20768

# install Homebrew
ruby -e "$(curl -SL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# Install essential Homebrew packages
#
brew doctor
brew install wget
brew install drush
brew install git
brew install caskroom/cask/brew-cask # install Cask
brew tap caskroom/versions

#
# Install MAMP (easiest way to run PHP & MySQL locally)
#

ruby -e "$(curl -SL http://downloads2.mamp.info/MAMP-PRO/releases/3.0.6/MAMP_MAMP_PRO_3.0.6.pkg)"


# PHP and MySQL now handled by MAMP
#
# OLD, NO LONGER USED: PHP and Apache setup
#
# sudo ln -s ~/Dropbox/Local\ Dev\ Config/Apache/httpd.conf /private/etc/apache2/httpd.conf && launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php54.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php54.plist && sudo apachectl restart
# OLD, NO LONGER USED: MySQL setup
#
#mkdir -p ~/Library/LaunchAgents
#ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents # launch at login
#launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist # run at startup
#mysql.server start # start service now
#brew postinstall mysql

#
# Install applications using Cask
#
brew cask install acorn
adium
adobe-creative-cloud
alfred
bartender
boom
caffeine
clipmenu
diffmerge
disk-inventory-x
# dropbox # step 1 involves downloading this manually, leaving here in case process changes
fantastical
filezilla
firefox
flash
flash-player
flux
gisto
google-chrome
google-drive
hipchat
iterm2
lastpass-universal
phantomjs
prey
sequel-pro
skype
sourcetree
spotify
stay
sublime-text3
tagspaces
thunderbird
vagrant
virtualbox
virtualhostx

#
# Symlink dot files
#
ln -s ~/Dropbox/Local\ Dev\ Config/dot\ files/.bash_profile .bash_profile && ln -s ~/Dropbox/Local\ Dev\ Config/dot\ files/.git-completion-aliases.bash .git-completion-aliases.bash && ln -s ~/Dropbox/Local\ Dev\ Config/dot\ files/.git-completion.bash .git-completion.bash && ln -s ~/Dropbox/Local\ Dev\ Config/dot\ files/.gitconfig .gitconfig && ln -s ~/Dropbox/Local\ Dev\ Config/dot\ files/.gitignore_global .gitignore_global

#
# Symlink Drush files
#
&& mkdir ~/.drush && ln -s ~/Dropbox/Local\ Dev\ Config/dot\ files/.drush/aliases.drushrc.php ~/.drush/aliases.drushrc.php

#
# Copy application preferences
#
&& cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.adiumX.adiumX.plist ~/Library/Preferences/com.adiumX.adiumX.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.apple.dock.plist ~/Library/Preferences/com.apple.dock.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.apple.finder.plist ~/Library/Preferences/com.apple.finder.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.surteesstudios.Bartender.plist ~/Library/Preferences/com.surteesstudios.Bartender.plist  && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.cordlessdog.Stay.plist ~/Library/Preferences/com.cordlessdog.Stay.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.flexibits.fantastical.plist ~/Library/Preferences/com.flexibits.fantastical.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.sublimetext.3.plist ~/Library/Preferences/com.sublimetext.3.plist && cp ~/Dropbox/Local\ Dev\ Config/application\ preferences/com.clickontyler.virtualhostx.plist ~/Library/Preferences/com.clickontyler.virtualhostx.plist


#
# Make Sites directory for local sites
#
&& sudo mkdir ~/Sites && sudo chown ldavis-robeson ~/Sites


#
# Symlink Sublime Text Packages folder
#
&& mkdir ~/Library/Application\ Support/Sublime\ Text\ 3 && ln -s ~/Dropbox/Local\ Dev\ Config/Sublime\ Text/Packages  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages && ln -s ~/Dropbox/Local\ Dev\ Config/Sublime\ Text/Installed\ Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

