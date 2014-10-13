#
# AUTOMATED SETUP ON A NEW MACHINE:
#
# This script takes care of installing local dev tools, applications, fonts,
# and copying over custom configuration.
#
# 1) Download Dropbox: https://www.dropbox.com/downloading
#
# 2) Set up Dropbox:
#     - Go to Dropbox Preferences
#     - select the Account tab
#     - select the "Change Settings" button next to "Selective Sync"
#     - select only the "Local Dev Config" folder for fastest syncing
#     - wait for sync to finish, then go on to step 3
#
# 3) Copy & paste this line into Terminal to run this script:
#    ~/Dropbox/Local-Dev-Config/scripts/installConfig.sh
#
# 4) Manual steps when script is done running:
#   - regenerate SSH keys (https://help.github.com/articles/generating-ssh-keys): update on Github, code.forumone.com, & send to Sysadmins
#   - log in to Firefox Sync to set up bookmarks, add-ons, and history
#   - install company fonts in the Local Dev Config -> fonts directory: Metric and Copernicus
#   - re-add application licenses that weren't exported (Bartender, Boom, Sublime Text, etc.)
#
# TROUBLESHOOTING:
#   In order to run this script as a program, you must change the file mode to executable by typing this command
#   in Terminal where the script is: chmod a+x installConfig.sh
#
# INSPIRED BY THESE POSTS:
#   1) https://gist.github.com/denji/92d7351151dad9c1bdc9
#   2) http://carlosbecker.com/posts/first-steps-with-mac-os-x-as-a-developer/
#   3) http://computers.tutsplus.com/tutorials/perfect-configurations-with-homebrew-and-cask--cms-20768
#   4) http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
#

# Install Xcode command line tools
echo "Installing Xcode Command Line Tools..."
xcode-select --install

# Install Homebrew
echo "Installing Homebrew..."
ruby -e "$(curl -SL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update # Update Homebrew recipes

# Update default unix tools
echo "Homebrew: updating default unix tools..."
brew install coreutils # Install GNU core utilities (those that come with OS X are outdated)
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install bash # Install Bash 4
brew tap homebrew/dupes # Install more recent versions of some OS X tools
brew install homebrew/dupes/grep
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH # update the $PATH in your ~/.bash_profile

# Install Homebrew binaries
echo "Homebrew: installing binaries..."
binaries=(
  drush
  mackup
  wget
)
brew install ${binaries[@]}
echo "Homebrew: cleaning up..."
brew cleanup

# Install fonts and applications with Homebrew Cask
echo "Homebrew: installing Homebrew Cask..."
brew install caskroom/cask/brew-cask # install Cask
brew tap caskroom/versions # install beta versions with Cask
brew tap caskroom/fonts # install fonts with Cask

# Install fonts
echo "Homebrew Cask: installing fonts..."
fonts=(
  font-source-sans-pro
  font-input
  font-roboto
)
brew cask install ${fonts[@]}

# Install applications
echo "Homebrew Cask: installing apps..."
apps=( # Apps
  acorn
  adium
  adobe-creative-cloud
  alfred
  bartender
  boom
  caffeine
  dash
  diffmerge
  disk-inventory-x
  #dropbox
  fantastical
  #filezilla
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
  mamp
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
  #virtualhostx
)
brew cask install --appdir="/Applications" ${apps[@]} # Install apps to /Applications

# Launch apps from Alfred
echo "Homebrew Cask: linking apps to Alfred..."
brew cask alfred link

# Copy application preferences & config files with Mackup
echo "Mackup: restoring application preferences..."
mackup restore

# Symlink dot files not supported by Mackup
echo "Symlinking dot files not supported by Mackup..."
ln -s ~/Dropbox/Local-Dev-Config/dot-files/.git-completion-aliases.bash .git-completion-aliases.bash && ln -s ~/Dropbox/Local-Dev-Config/dot-files/.git-completion.bash .git-completion.bash && mkdir ~/.drush && ln -s ~/Dropbox/Local-Dev-Config/dot-files/.drush/aliases.drushrc.php ~/.drush/aliases.drushrc.php

# Create Sites directory for local sites
echo "Creating Sites directory..."
mkdir ~/Sites

# Symlink Sublime Text Packages
echo "Symlinking Sublime Text Packages..."
mkdir ~/Library/Application\ Support/Sublime\ Text\ 3 && ln -s ~/Dropbox/Local-Dev-Config/Sublime\ Text/Packages  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages && ln -s ~/Dropbox/Local-Dev-Config/Sublime\ Text/Installed\ Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

echo "Done! Yay, automation!"
