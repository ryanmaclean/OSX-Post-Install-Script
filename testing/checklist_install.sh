# Cribbed from http://stackoverflow.com/questions/4984288/bash-shell-script-to-prompt-user-for-input-with-a-cli-gui-dialog-box
#!/bin/bash

result() {
i=0
echo there are ${#arrayName[@]} options selected
while (( i < ${#arrayName[@]} ))
do
  echo $i ${arrayName[$i]} 
  i=$(( $i + 1 ))
done
}

cmd=(dialog --separate-output --keep-tite --checklist "Select options:" 22 76 4)
options=(1 "Johnny" off
         2 "Ben" off
         3 "Hillary" off
         4 "User Input" off
)

choice=$("${cmd[@]}" "${options[@]}" 2>&1 > /dev/tty )

for answer in $choice
do
# make decsion 
case $answer in
    1) 
       arrayNum=${#arrayName[@]}  # arrayNum is the amount of items in arrayName 
       arrayName[$arrayNum]="Johnny" # if selected put Johnny in arrayName
       ;;
    2) 
       arrayNum=${#arrayName[@]}  # If johnny is selected ${#arrayName[@]} outputs 1 if not selected 0 
       arrayName[$arrayNum]="Ben" # If selected add to array
       ;;
    3) 
       arrayNum=${#arrayName[@]}
       arrayName[$arrayNum]="Hillary"
       ;;
    4) # If User Input is selected create an new dialog inputbox 

    user_input=$(\
    dialog --keep-tite --title "Enter Your Name" \
        --inputbox "Enter name:" 8 40 \
    3>&1 1>&2 2>&3 3>&- \
    )
       arrayNum=${#arrayName[@]}
       arrayName[$arrayNum]="$user_input"
       ;;
esac
done
result

#!/bin/bash
## START OF OLD MENU 
# title="THIS SCRIPT ASSUMES YOU'VE COPIED YOUR OLD PROFILE AND LOADED IT ALREADY ON THE NEW SYSTEM"
# prompt="Type the number of the command you would like to run and press enter."
# options=( 
# 	"Allow press and hold keys" #1
# 	"SET HOSTNAME IN ALL THE RIGHT PLACES" #2 
# 	"TURN OFF SCREENSAVER PASSWORD DELAY" #3
# 	"AUTOMATICALLY QUIT PRINTER APP ONCE THE PRINT JOBS COMPLETE" #4
# 	"DISABLE THE \"ARE YOU SURE YOU WANT TO OPEN THIS APPLICATION?\" DIALOG" #5
# 	"TRACKPAD: MAP BOTTOM RIGHT CORNER TO RIGHT-CLICK" #6
# 	"SHOW PERCENTAGE IN BATTERY STATUS" #7
# 	"DISABLE NATURAL SCROLLING" #8
# 	"ENABLE TAB IN MODAL DIALOGS" #9
# 	"SCROLL WITH CTRL TO ZOOM" #10
# 	"DISABLE AUTO-CORRECT" #11
# 	"ENABLE HIDPI DISPLAY MODES (REQUIRES RESTART)" #12
# 	"FINDER: SHOW HIDDEN FILES BY DEFAULT" #13
# 	"FINDER: SHOW ALL FILENAME EXTENSIONS" #14
# 	"FINDER: SHOW STATUS BAR" #15
# 	"FINDER: ALLOW TEXT SELECTION IN QUICK LOOK" #16
# 	"FINDER: DISPLAY FULL POSIX PATH AS FINDER WINDOW TITLE" #17
# 	"FINDER: DISABLE THE WARNING WHEN CHANGING A FILE EXTENSION" #18
# 	"FINDER: AVOID CREATING .DS_STORE FILES ON NETWORK VOLUMES" #19
# 	"FINDER: AUTOMATICALLY OPEN A NEW FINDER WINDOW WHEN A VOLUME IS MOUNTED" #20
# 	"FINDER: USE LIST VIEW IN ALL WINDOWS BY DEFAULT" #21 - YOU CAN SET THE OTHER VIEW MODES BY USING ONE OF THESE FOUR-LETTER CODES: ICNV, CLMV, FLWV
# 	"FINDER: DISABLE THE WARNING BEFORE EMPTYING THE TRASH" #22
# 	"FINDER: EMPTY TRASH SECURELY BY DEFAULT" #23
# 	"FINDER: ENABLE AIRDROP OVER ETHERNET AND ON UNSUPPORTED MACS" #24
# 	"DOCK: ENABLE HIGHLIGHT HOVER EFFECT FOR THE GRID VIEW OF A STACK" #25
# 	"DOCK: SET THE ICON SIZE OF ICONS TO 36 PIXELS" #26
# 	"DOCK: SPRING LOADING ALL ITEMS" #27
# 	"DOCK: SHOW INDICATOR LIGHTS FOR OPEN APPLICATIONS" #28
# 	"DOCK: DON’T ANIMATE APPLICATION LAUNCH" #29
# 	"SPEED UP MISSION CONTROL ANIMATIONS" #30
# 	"DON’T GROUP WINDOWS BY APPLICATION IN MISSION CONTROL" #31 USE THE OLD EXPOSÉ BEHAVIOR INSTEAD
# 	"DON’T SHOW DASHBOARD AS A SPACE" #32 
# 	"DOCK: REMOVE DELAY WHEN HIDING" #33
# 	"DOCK: REMOVE THE ANIMATION WHEN HIDING/SHOWING THE DOCK" #34
# 	"ENABLE THE 2D DOCK" #35
# 	"AUTOMATICALLY HIDE AND SHOW THE DOCK" #36
# 	"MAKE DOCK ICONS OF HIDDEN APPLICATIONS TRANSLUCENT" #37
# 	"RESET LAUNCHPAD AFTER MAKING CHANGES" #38 
# 	"ADD IOS SIMULATOR TO LAUNCHPAD" #39
# 	"ADD A SPACER TO THE LEFT SIDE OF THE DOCK WHERE THE APPLICATIONS ARE" #40
# 	"ADD A SPACER TO THE RIGHT SIDE OF THE DOCK (WHERE THE TRASH IS)" #41
# 	)

# #Define our colors
# txtblk='\e[0;30m' # Black - Regular
# txtred='\e[0;31m' # Red
# txtgrn='\e[0;32m' # Green
# txtylw='\e[0;33m' # Yellow
# txtblu='\e[0;34m' # Blue
# txtpur='\e[0;35m' # Purple
# txtcyn='\e[0;36m' # Cyan
# txtwht='\e[0;37m' # White
# Color_Off='\e[0m' # Text Reset

# echo -e "${txtblu}$title$Color_Off"
# PS3="$prompt "
# select opt in "${options[@]}" "Quit"; do 

#     case "$REPLY" in

#     1 ) sudo defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false;;
#     2 ) sudo scutil --set ComputerName "STRING" && sudo scutil --set HostName "STRING" && sudo scutil --set LocalHostName "STRING" && sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "STRING";;
#     3 ) defaults write com.apple.screensaver askForPassword -int 1 && defaults write com.apple.screensaver askForPasswordDelay -int 0;;
# 	4 ) defaults write com.apple.print.PrintingPrefs “Quit When Finished” -bool true;;
# 	5 ) defaults write com.apple.LaunchServices LSQuarantine -bool false;;
# 	6 ) defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 && defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1 && defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true;;
# 	7 ) defaults write com.apple.menuextra.battery ShowPercent -string "YES" && defaults write com.apple.menuextra.battery ShowTime -string "NO";;
# 	8 ) defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false;;
# 	9 ) defaults write NSGlobalDomain AppleKeyboardUIMode -int 3;;
# 	10 ) defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true && defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144;;
# 	11 ) defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false;;
# 	12 ) sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true;;
# 	13 ) defaults write com.apple.finder AppleShowAllFiles -bool true;;
# 	14 ) defaults write NSGlobalDomain AppleShowAllExtensions -bool true;;
# 	15 ) defaults write com.apple.finder ShowStatusBar -bool true;;
# 	16 ) defaults write com.apple.finder QLEnableTextSelection -bool true;;
# 	17 ) defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;;
# 	18 ) defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false;;
# 	19 ) defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true;;
# 	20 ) defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true;;
# 	21 ) defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”;;
# 	22 ) defaults write com.apple.finder WarnOnEmptyTrash -bool false;;
# 	23 ) defaults write com.apple.finder EmptyTrashSecurely -bool true;;
# 	24 ) defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true;;
# 	25 ) defaults write com.apple.dock mouse-over-hilte-stack -bool true;;
# 	26 ) defaults write com.apple.dock tilesize -int 36;;
# 	27 ) defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true;;
# 	28 ) defaults write com.apple.dock show-process-indicators -bool true;;
# 	29 ) defaults write com.apple.dock launchanim -bool false;;
# 	30 ) defaults write com.apple.dock expose-animation-duration -float 0.1;;
# 	31 ) defaults write com.apple.dock expose-group-by-app -bool false;;
# 	32 ) defaults write com.apple.dock dashboard-in-overlay -bool true;;
# 	33 ) defaults write com.apple.Dock autohide-delay -float 0;;
# 	34 ) defaults write com.apple.dock autohide-time-modifier -float 0;;
# 	35 ) defaults write com.apple.dock no-glass -bool true;;
# 	36 ) defaults write com.apple.dock autohide -bool true;;
# 	37 ) defaults write com.apple.dock showhidden -bool true;;
# 	38 ) find ~/Library/Application Support/Dock -name “*.db” -maxdepth 1 -delete;;
# 	39 ) ln -s /Applications/Xcode.app/Contents/Applications/iPhone Simulator.app /Applications/iOS Simulator.app;; #This should be done AFTER the XCode install
# 	40 ) defaults write com.apple.dock persistent-apps -array-add ‘{tile-data={}; tile-type=“spacer-tile”;}’;;
# 	41 ) defaults write com.apple.dock persistent-others -array-add ‘{tile-data={}; tile-type=“spacer-tile”;}’;;
## WORK COMPLETED UNTIL HERE

# ## HOT CORNERS
# ## TOP LEFT SCREEN CORNER → MISSION CONTROL
# #defaults write com.apple.dock wvous-tl-corner -int 2
# #defaults write com.apple.dock wvous-tl-modifier -int 0
# ## TOP RIGHT SCREEN CORNER → DESKTOP
# #defaults write com.apple.dock wvous-tr-corner -int 4
# #defaults write com.apple.dock wvous-tr-modifier -int 0
# ## BOTTOM LEFT SCREEN CORNER → START SCREEN SAVER
# #defaults write com.apple.dock wvous-bl-corner -int 5
# #defaults write com.apple.dock wvous-bl-modifier -int 0

# ## SHOW ICONS FOR HARD DRIVES, SERVERS, AND REMOVABLE MEDIA ON THE DESKTOP
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# ## TURN OFF DISK IMAGE VERIFICATION - POSSIBLE SECURITY PROBLEM - UNCOMMENT IF YOU WANT THIS
# #defaults write com.apple.frameworks.diskimages skip-verify -bool true
# #defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# #defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# #defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# ## SET EXPOSE ANIMATION TO BE FASTEST AND GROUP BY APP
# defaults write com.apple.dock expose-animation-duration -float 0.1
# defaults write com.apple.dock "expose-group-by-app" -bool true

# ## TURN OF MATCHES ON PREFIX-ONLY IN SAFARI
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# ## REMOVE UN-NEEDED LINKS IN SAFARI
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# ## TURN ON BACKSPACE KEY TO GO BACK - COMMENTED OUT FOR PEOPLE WHO HATE THIS
# #defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# ##DISABLE SAFARI’S THUMBNAIL CACHE FOR HISTORY AND TOP SITES
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# ## SET TERMINAL TO HOMEBREW THEME, OPTIONS ARE "Pro", "Homebrew", "Man Page", "Novel", "Ocean", "Red Sands", "Silver Aerogel", "Solid Colors"
# defaults write com.apple.terminal StringEncodings -array 4
# defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
# defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
# defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"

# ## TURN OFF SMART-QUOTES AS IT INTERFERES WITH CODE SNIPPETS
# defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# ## TURN OFF SUDDEN MOTION SENSOR FOR SSD, SET STAND-BY DELAY TO 1 DAY
# ## COMMENTED OUT, UNCOMMENT TO TAKE EFFECT
# #sudo pmset -a sms 0
# #sudo pmset -a standbydelay 86400

# ## SORT ACTIVITY MONITOR RESULTS BY CPU USAGE
# defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
# defaults write com.apple.ActivityMonitor SortDirection -int 0

# ## SET SUPER FAST KEY REPEAT, SMALL DELAY
# defaults write NSGlobalDomain KeyRepeat -int 0
# defaults write NSGlobalDomain InitialKeyRepeat -int 10

# ## EXPAND SAVE PANEL BY DEFAULT
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# ## TURN OFF ITUNES DEVICE BACKUP - USE ICLOUD BACKUPS INSTEAD
# defaults write com.apple.iTunes AutomaticDeviceBackupsDisabled -bool true

# ## TURN OFF SIDEBAR ON SAFARI TOPSITES
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# ## SET SAFARI HOMEPAGE TO BLANK
# defaults write com.apple.Safari HomePage -string "about:blank"

# ## TURN OFF DASHBOARD
# defaults write com.apple.dashboard mcx-disabled -boolean YES

# ## UNHIDE YOUR USER LIBRARY
# chflags nohidden ~/Library

# ## SET DEFAULT SEARCH TO CURRENT FOLDER
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# ## TURN OFF ANIMATIONS
# defaults write com.apple.finder DisableAllAnimations -bool true

# ## SET REASONABLE SCREEN CAPTURE DEFAULTS
# defaults write com.apple.screencapture location -string "$HOME/Desktop"
# defaults write com.apple.screencapture type -string "png"

# ## SET FINDER TO DEFAULT TO $HOME
# defaults write com.apple.finder NewWindowTarget -string "PfLo"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# ## RESTART SYSTEM WHEN FROZEN/HUNG
# sudo systemsetup -setrestartfreeze on

# ## TURN OFF FAST USER SWITCHING
# sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool false

# ## TURN OFF AMBIENT LIGHT SENSOR
# sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false

# ## REST FROM WEB

# # Enable Safari’s debug menu
# # defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# # Make Safari’s search banners default to Contains instead of Starts With
# # defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# # Enable the Develop menu and the Web Inspector in Safari
# # defaults write com.apple.Safari IncludeDevelopMenu -bool true
# # defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# # defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# # Add a context menu item for showing the Web Inspector in web views
# # defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# # Enable the WebKit Developer Tools in the Mac App Store
# # defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# # iTunes
# # Disable the iTunes store link arrows
# # defaults write com.apple.iTunes show-store-link-arrows -bool false
# # Disable the Genius sidebar in iTunes
# # defaults write com.apple.iTunes disableGeniusSidebar -bool true
# # Disable radio stations in iTunes
# # defaults write com.apple.iTunes disableRadio -bool true
# # Make ⌘ + F focus the search input in iTunes
# # defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add “Target Search Field” “@F”

# # Mail
# # DISABLE SEND AND REPLY ANIMATIONS IN MAIL.APP
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true
# # COPY EMAIL ADDRESSES AS FOO@EXAMPLE.COM INSTEAD OF FOO BAR <FOO@EXAMPLE.COM> IN MAIL.APP
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# # ADD THE KEYBOARD SHORTCUT ⌘ + ENTER TO SEND AN EMAIL IN MAIL.APP
# defaults write com.apple.mail NSUserKeyEquivalents -dict-add “Send” “@U21a9”

# # Terminal
# # Enable “focus follows mouse” for Terminal.app and all X11 apps i.e. hover over a window and start typing in it without clicking first
# # defaults write com.apple.terminal FocusFollowsMouse -bool true
# # defaults write org.x.X11 wm_ffm -bool true

# # Time Machine
# # Prevent Time Machine from prompting to use new hard drives as backup volume
# # defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# # Address Book, Dashboard, iCal, TextEdit, and Disk Utility
# # Enable the debug menu in Address Book
# # defaults write com.apple.addressbook ABShowDebugMenu -bool true

# # Enable Dashboard dev mode (allows keeping widgets on the desktop)
# # defaults write com.apple.dashboard devmode -bool true

# ## Remove items from dock that you won't use
# ##
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Mail/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Contacts/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Calendar/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Reminders/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Maps/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Facetime/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/iTunes/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/iBooks/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock
# dloc=$(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | awk '/Notes/ {print NR}') && /usr/libexec/PlistBuddy -c "Delete persistent-apps:$dloc" ~/Library/Preferences/com.apple.dock.plist && killall Dock


# ## USE PLAIN TEXT MODE FOR NEW TEXTEDIT DOCUMENTS
# defaults write com.apple.TextEdit RichText -int 0

# # Open and save files as UTF–8 in TextEdit
# defaults write com.apple.TextEdit PlainTextEncoding -int 4
# defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# ## Enable the debug menu in Disk Utility
# defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
# defaults write com.apple.DiskUtility advanced-image-options -bool true

# ## INSTALL HOMEBREW AND COMMANDLINE TOOLS MISSING IN OSX, ALONG WITH SOME PRETTINESS
# xcode-select --install
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew install wget cmake watch gnu-sed coreutils psutils tmux tmux-mem-cpu-load git zsh mc wget vim

# ## INSTALL OH MY ZSH AND SET ZSH AS DEFAULT SHELL
# sudo curl -L http://install.ohmyz.sh | sh
# chsh -s /bin/zsh
# git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# ## INSTALL CASKROOM AND ALL APPLICATIONS
# brew install caskroom/cask/brew-cask
 
# ## CODING TOOLS
# brew cask install bee iterm2 sourcetree github chefdk

# ## PICK AN EDITOR
# brew cask install sublime-text
# defaults write com.apple.LaunchServices LSHandlers -array-add "{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.2;}"
# ## SUBLIME 3 VERSION
# #defaults write com.apple.LaunchServices LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.3;}'

# ## GET A YOSEMITE ICON FOR SUBLIME
# wget -O /Applications/Sublime\ Text\ 2.app/Contents/Resources/Sublime\ Text\ 2.icns https://dribbble.com/shots/1678555-Sublime-Text-3-Replacement-Icon/attachments/265398

# ## INSTALL SUBLIME PACKAGE MANAGEMENT
# wget https://sublime.wbond.net/Package%20Control.sublime-package
# mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/
# ## SUBLIME 3 VERSION
# #mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
# ## GET YOUR HIPSTER ON!
# git clone https://github.com/phyllisstein/HipsterIpsum.git ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/Hipster\ Ipsum


# #brew cask install textmate
# #defaults write com.apple.LaunchServices LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.macromates.textmate;}'

# #brew cask install atom
# #brew cask install textwrangler 

# ## PICK A MOCKUP APP
# brew cask install balsamiq
# #brew cask install pencil

# ## SYSTEM UTILITIES 
# brew cask install disk-inventory-x moom unetbootin istat-menus alfred caffeine keepassx rescuetime the-unarchiver logmein-client royal-tsx jdownloader lastfm 

# ## VIRTUALIZATION / CONTAINERS
# brew cask install boot2docker vagrant vmware-fusion virtualbox

# ## GRAPHICS APPS
# ## Set "wacom-tablet" to "wacom-bamboo-tablet" for bamboo users
# brew cask install google-nik-collection wacom-tablet adobe-creative-cloud 

# ## BROWSERS - UNCOMMENT YOUR FAVOURITE AND/OR INSTALL THEM ALL #################################################
# ## INSTALL CHROME, REMOTE DESKTOP, CHROMECAST AND TURN OFF ANNOYING SWIPE LEFT RIGHT BEHAVIOUR
# brew cask install chromecast chrome-remote-desktop-host google-chrome && defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# ## INSTALL FIREFOX
# #brew cask install firefox

# ## INSTALL OPERA
# #brew cask install opera
# ###############################################################################################################

# ## INSTALL DB TOOLS
# brew cask install navicat-for-postgresql toad
# ## INSTANT MESSAGING
# brew cask install adium colloquy slack

# ## INSTALL BACKUP APPS
# brew cask install backblaze carbon-copy-cloner

# ## BROWSER PLUGINS
# brew cask install lastpass-universal silverlight flash-player

# ## SPOTIFY
# brew cask install spotify spotify-menubar spotify-notifications

# ## CONFIGURE ITERM TO NOT PROMPT ON QUIT
# defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# ## INSTALL AWS CLI
# wget https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py && sudo pip install awscli

# ## WARN USER
# sleep 30
# echo About to close many apps - shutdown the following, or have them cycled for you: 
# echo Address Book, Calendar, Contacts, Dashboard, Dock, Finder, Mail, Safari, SystemUIServer, Terminal, iCal, iTunes
# ## CLOSE ALL APPS THAT NEED TO BE REFRESHED FOR SETTINGS TO TAKE
# for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" "Mail" "Safari" "SystemUIServer" "Terminal" "iCal" "iTunes"; do killall "$app" > /dev/null 2>&1 done

# ## ADD CYBERDOCK TO DOCK
# defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Cyberduck.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# ## ADD SPOTIFY TO DOCK
# defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# ## ADD SPOTIFY TO DOCK
# defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Sublime Text 2.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# ## RUN A MACOS UPDATE
# sudo softwareupdate --install -all

#######################################
# END OF OLD MENU
#######################################

#     $(( ${#options[@]}+1 )) ) echo "Good luck!"; break;;
#     *) echo "Invalid option seclected. Try another one.";continue;;

#     esac

# done
