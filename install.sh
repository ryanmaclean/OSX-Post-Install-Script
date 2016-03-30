## THIS SCRIPT ASSUMES YOU'VE COPIED YOUR OLD PROFILE
## AND LOADED IT ALREADY ON THE NEW SYSTEM

## Allow press and hold keys
sudo defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

## SET HOSTNAME IN ALL THE RIGHT PLACES
sudo scutil --set ComputerName "STRING"
sudo scutil --set HostName "STRING"
sudo scutil --set LocalHostName "STRING"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "STRING"

## TURN OFF SCREENSAVER PASSWORD DELAY
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

## AUTOMATICALLY QUIT PRINTER APP ONCE THE PRINT JOBS COMPLETE
defaults write com.apple.print.PrintingPrefs “Quit When Finished” -bool true

## DISABLE THE “ARE YOU SURE YOU WANT TO OPEN THIS APPLICATION?” DIALOG
#defaults write com.apple.LaunchServices LSQuarantine -bool false

## TRACKPAD: MAP BOTTOM RIGHT CORNER TO RIGHT-CLICK
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

## SHOW PERCENTAGE IN BATTERY STATUS
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

## DISABLE NATURAL SCROLLING
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

## ENABLE TAB IN MODAL DIALOGS
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

## SCROLL WITH CTRL TO ZOOM
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

## DISABLE AUTO-CORRECT
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

## ENABLE HIDPI DISPLAY MODES (REQUIRES RESTART)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

##FINDER: SHOW HIDDEN FILES BY DEFAULT
#defaults write com.apple.finder AppleShowAllFiles -bool true

##FINDER: SHOW ALL FILENAME EXTENSIONS
#defaults write NSGlobalDomain AppleShowAllExtensions -bool true

##FINDER: SHOW STATUS BAR
#defaults write com.apple.finder ShowStatusBar -bool true

##FINDER: ALLOW TEXT SELECTION IN QUICK LOOK
#defaults write com.apple.finder QLEnableTextSelection -bool true

##DISPLAY FULL POSIX PATH AS FINDER WINDOW TITLE
#defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

##DISABLE THE WARNING WHEN CHANGING A FILE EXTENSION
#defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
##AVOID CREATING .DS_STORE FILES ON NETWORK VOLUMES
#defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

##AUTOMATICALLY OPEN A NEW FINDER WINDOW WHEN A VOLUME IS MOUNTED
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

##USE LIST VIEW IN ALL FINDER WINDOWS BY DEFAULT
##YOU CAN SET THE OTHER VIEW MODES BY USING ONE OF THESE FOUR-LETTER CODES: ICNV, CLMV, FLWV
defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”

##DISABLE THE WARNING BEFORE EMPTYING THE TRASH
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# EMPTY TRASH SECURELY BY DEFAULT
# defaults write com.apple.finder EmptyTrashSecurely -bool true
# ENABLE AIRDROP OVER ETHERNET AND ON UNSUPPORTED MACS
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# ENABLE HIGHLIGHT HOVER EFFECT FOR THE GRID VIEW OF A STACK (DOCK)
# defaults write com.apple.dock mouse-over-hilte-stack -bool true

# SET THE ICON SIZE OF DOCK ITEMS TO 36 PIXELS
# defaults write com.apple.dock tilesize -int 36

# ENABLE SPRING LOADING FOR ALL DOCK ITEMS
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# SHOW INDICATOR LIGHTS FOR OPEN APPLICATIONS IN THE DOCK
# defaults write com.apple.dock show-process-indicators -bool true

# DON’T ANIMATE OPENING APPLICATIONS FROM THE DOCK
# defaults write com.apple.dock launchanim -bool false

# SPEED UP MISSION CONTROL ANIMATIONS
defaults write com.apple.dock expose-animation-duration -float 0.1

# DON’T GROUP WINDOWS BY APPLICATION IN MISSION CONTROL (I.E. USE THE OLD EXPOSÉ BEHAVIOR INSTEAD)
# defaults write com.apple.dock expose-group-by-app -bool false

# DON’T SHOW DASHBOARD AS A SPACE
# defaults write com.apple.dock dashboard-in-overlay -bool true

# REMOVE THE AUTO-HIDING DOCK DELAY
# defaults write com.apple.Dock autohide-delay -float 0

# REMOVE THE ANIMATION WHEN HIDING/SHOWING THE DOCK
defaults write com.apple.dock autohide-time-modifier -float 0

# ENABLE THE 2D DOCK
# defaults write com.apple.dock no-glass -bool true

# AUTOMATICALLY HIDE AND SHOW THE DOCK
# defaults write com.apple.dock autohide -bool true

# MAKE DOCK ICONS OF HIDDEN APPLICATIONS TRANSLUCENT
# defaults write com.apple.dock showhidden -bool true

# RESET LAUNCHPAD
# find ~/Library/Application Support/Dock -name “*.db” -maxdepth 1 -delete

# ADD IOS SIMULATOR TO LAUNCHPAD
# ln -s /Applications/Xcode.app/Contents/Applications/iPhone Simulator.app /Applications/iOS Simulator.app

# ADD A SPACER TO THE LEFT SIDE OF THE DOCK (WHERE THE APPLICATIONS ARE)
# defaults write com.apple.dock persistent-apps -array-add ‘{tile-data={}; tile-type=“spacer-tile”;}’

# ADD A SPACER TO THE RIGHT SIDE OF THE DOCK (WHERE THE TRASH IS)
# defaults write com.apple.dock persistent-others -array-add ‘{tile-data={}; tile-type=“spacer-tile”;}’

## HOT CORNERS
## TOP LEFT SCREEN CORNER → MISSION CONTROL
#defaults write com.apple.dock wvous-tl-corner -int 2
#defaults write com.apple.dock wvous-tl-modifier -int 0
## TOP RIGHT SCREEN CORNER → DESKTOP
#defaults write com.apple.dock wvous-tr-corner -int 4
#defaults write com.apple.dock wvous-tr-modifier -int 0
## BOTTOM LEFT SCREEN CORNER → START SCREEN SAVER
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0

## SHOW ICONS FOR HARD DRIVES, SERVERS, AND REMOVABLE MEDIA ON THE DESKTOP
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

## TURN OFF DISK IMAGE VERIFICATION - POSSIBLE SECURITY PROBLEM - UNCOMMENT IF YOU WANT THIS
#defaults write com.apple.frameworks.diskimages skip-verify -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

## SET EXPOSE ANIMATION TO BE FASTEST AND GROUP BY APP
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

## TURN OF MATCHES ON PREFIX-ONLY IN SAFARI
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

## REMOVE UN-NEEDED LINKS IN SAFARI
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

## TURN ON BACKSPACE KEY TO GO BACK - COMMENTED OUT FOR PEOPLE WHO HATE THIS
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

##DISABLE SAFARI’S THUMBNAIL CACHE FOR HISTORY AND TOP SITES
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

## SET TERMINAL TO HOMEBREW THEME, OPTIONS ARE "Pro", "Homebrew", "Man Page", "Novel", "Ocean", "Red Sands", "Silver Aerogel", "Solid Colors"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"

## TURN OFF SMART-QUOTES AS IT INTERFERES WITH CODE SNIPPETS
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

## TURN OFF SUDDEN MOTION SENSOR FOR SSD, SET STAND-BY DELAY TO 1 DAY
## COMMENTED OUT, UNCOMMENT TO TAKE EFFECT
#sudo pmset -a sms 0
#sudo pmset -a standbydelay 86400

## SORT ACTIVITY MONITOR RESULTS BY CPU USAGE
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

## SET SUPER FAST KEY REPEAT, SMALL DELAY
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 10

## EXPAND SAVE PANEL BY DEFAULT
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

## TURN OFF ITUNES DEVICE BACKUP - USE ICLOUD BACKUPS INSTEAD
defaults write com.apple.iTunes AutomaticDeviceBackupsDisabled -bool true

## TURN OFF SIDEBAR ON SAFARI TOPSITES
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

## SET SAFARI HOMEPAGE TO BLANK
defaults write com.apple.Safari HomePage -string "about:blank"

## TURN OFF DASHBOARD
defaults write com.apple.dashboard mcx-disabled -boolean YES

## UNHIDE YOUR USER LIBRARY
chflags nohidden ~/Library

## SET DEFAULT SEARCH TO CURRENT FOLDER
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## TURN OFF ANIMATIONS
defaults write com.apple.finder DisableAllAnimations -bool true

## SET REASONABLE SCREEN CAPTURE DEFAULTS
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"

## SET FINDER TO DEFAULT TO $HOME
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

## RESTART SYSTEM WHEN FROZEN/HUNG
sudo systemsetup -setrestartfreeze on

## TURN OFF FAST USER SWITCHING
sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool false

## TURN OFF AMBIENT LIGHT SENSOR
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false

## REST FROM WEB

# Enable Safari’s debug menu
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable the WebKit Developer Tools in the Mac App Store
# defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# iTunes
# Disable the iTunes store link arrows
# defaults write com.apple.iTunes show-store-link-arrows -bool false
# Disable the Genius sidebar in iTunes
# defaults write com.apple.iTunes disableGeniusSidebar -bool true
# Disable radio stations in iTunes
# defaults write com.apple.iTunes disableRadio -bool true
# Make ⌘ + F focus the search input in iTunes
# defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add “Target Search Field” “@F”

# Mail
# DISABLE SEND AND REPLY ANIMATIONS IN MAIL.APP
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
# COPY EMAIL ADDRESSES AS FOO@EXAMPLE.COM INSTEAD OF FOO BAR <FOO@EXAMPLE.COM> IN MAIL.APP
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# ADD THE KEYBOARD SHORTCUT ⌘ + ENTER TO SEND AN EMAIL IN MAIL.APP
defaults write com.apple.mail NSUserKeyEquivalents -dict-add “Send” “@U21a9”

# Terminal
# Enable “focus follows mouse” for Terminal.app and all X11 apps i.e. hover over a window and start typing in it without clicking first
# defaults write com.apple.terminal FocusFollowsMouse -bool true
# defaults write org.x.X11 wm_ffm -bool true

# Time Machine
# Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Address Book, Dashboard, iCal, TextEdit, and Disk Utility
# Enable the debug menu in Address Book
# defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
# defaults write com.apple.dashboard devmode -bool true

## Remove items from dock that you won't use
##
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Mail/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Contacts/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Calendar/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Reminders/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Maps/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Facetime/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/iTunes/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/iBooks/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Notes/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock


## USE PLAIN TEXT MODE FOR NEW TEXTEDIT DOCUMENTS
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF–8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
## Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

## INSTALL HOMEBREW AND COMMANDLINE TOOLS MISSING IN OSX, ALONG WITH SOME PRETTINESS
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget cmake watch gnu-sed coreutils psutils tmux tmux-mem-cpu-load git zsh mc wget vim

## INSTALL OH MY ZSH AND SET ZSH AS DEFAULT SHELL
sudo curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

## INSTALL CASKROOM AND ALL APPLICATIONS
brew install caskroom/cask/brew-cask
 
## CODING TOOLS
brew cask install bee iterm2 sourcetree github-desktop chefdk

## PICK AN EDITOR
#brew cask install sublime-text
#defaults write com.apple.LaunchServices LSHandlers -array-add "{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.2;}"
## SUBLIME 3 VERSION
#defaults write com.apple.LaunchServices LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.3;}'

## GET A YOSEMITE ICON FOR SUBLIME
#wget -O /Applications/Sublime\ Text\ 2.app/Contents/Resources/Sublime\ Text\ 2.icns https://dribbble.com/shots/1678555-Sublime-Text-3-Replacement-Icon/attachments/265398

## INSTALL SUBLIME PACKAGE MANAGEMENT
#wget https://sublime.wbond.net/Package%20Control.sublime-package
#mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/
## SUBLIME 3 VERSION
#mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
## GET YOUR HIPSTER ON!
#git clone https://github.com/phyllisstein/HipsterIpsum.git ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/Hipster\ Ipsum

#brew cask install textmate
#defaults write com.apple.LaunchServices LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.macromates.textmate;}'

## Now Defaults to Atom from GitHub (Using /Applications for .app)
brew cask install atom --appdir=/Applications

#brew cask install textwrangler 

## PICK A MOCKUP APP
brew cask install balsamiq-mockups --appdir=/Applications
#brew cask install pencil

## SYSTEM UTILITIES 
brew cask install disk-inventory-x moom unetbootin istat-menus alfred caffeine keepassx cyberduck rescuetime the-unarchiver logmein-client royal-tsx jdownloader lastfm --appdir=/Applications

## VIRTUALIZATION / CONTAINERS
###Removed these by default in case you're deploying a VM
#brew cask install vmware-fusion virtualbox
###Removed the following in favour of new flavours
#brew cask install boot2docker vagrant
###Docker Toolbox
brew cask install dockertoolbox
#wget https://github.com/docker/toolbox/releases/download/v1.8.3/DockerToolbox-1.8.3.pkg
#sudo installer -pkg DockerToolbox-1.8.3.pkg -target /
###Otto from Hashicorp (Replacing Vagrant brew cask)
brew cask install otto

## GRAPHICS APPS
## Set "wacom-tablet" to "wacom-bamboo-tablet" for bamboo users
brew cask install google-nik-collection wacom-tablet adobe-creative-cloud --appdir=/Applications

## BROWSERS - UNCOMMENT YOUR FAVOURITE AND/OR INSTALL THEM ALL #################################################
## INSTALL CHROME, REMOTE DESKTOP, CHROMECAST AND TURN OFF ANNOYING SWIPE LEFT RIGHT BEHAVIOUR
brew cask install chromecast chrome-remote-desktop-host google-chrome --appdir=/Applications && defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

## INSTALL FIREFOX
#brew cask install firefox --appdir=/Applications

## INSTALL OPERA
#brew cask install opera --appdir=/Applications
###############################################################################################################

## INSTALL DB TOOLS
brew cask install navicat-for-postgresql --appdir=/Applications
#This appears to have been removed :(
#brew cask install toad --appdir=/Applications

## INSTANT MESSAGING
brew cask install colloquy slack --appdir=/Applications
#removed adium
#brew cask install adium --appdir=/Applications

## INSTALL BACKUP APPS
brew cask install backblaze carbon-copy-cloner --appdir=/Applications

## BROWSER PLUGINS
brew cask install silverlight flash-player --appdir=/Applications
###Lastpass Universal removed :(
#brew cask install lastpass-universal --appdir=/Applications
## SPOTIFY
brew cask install spotify spotify-notifications --appdir=/Applications
###removed spotify menubar
#brew cask install spotify-menubar --appdir=/Applications

## CONFIGURE ITERM TO NOT PROMPT ON QUIT
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

## INSTALL AWS CLI
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install awscli

## WARN USER
###RUB SOME SLEEP ON IT!
sleep 30
echo "About to close many apps - shutdown the following, or have them cycled for you:"
echo "Address Book, Calendar, Contacts, Dashboard, Dock, Finder, Mail, Safari, SystemUIServer, Terminal, iCal, iTunes"
## CLOSE ALL APPS THAT NEED TO BE REFRESHED FOR SETTINGS TO TAKE
#for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" "Mail" "Safari" "SystemUIServer" "Terminal" "iCal" "iTunes"; do killall "$app" > /dev/null 2>&1 done

## ADD CYBERDOCK TO DOCK
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Cyberduck.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

## ADD SPOTIFY TO DOCK
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

## ADD Sublime TO DOCK
#defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Sublime Text 2.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

## ADD ATOM TO DOCK
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Atom.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
##Restart Dock
killall Dock

## RUN A MACOS UPDATE
sudo softwareupdate --install -all
