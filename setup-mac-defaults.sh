###############################################################################
# General UI/UX                                                               #
###############################################################################

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

################################################################################
# System Settings > Appearance
################################################################################

# Appearance: Dark
defaults write -globalDomain AppleInterfaceStyle -string "Dark"

# Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain AppleScrollerPagingBehavior -bool true


################################################################################
# System Settings > Control Center
################################################################################

# Control Center Modules > Bluetooth > Show in Menu Bar
defaults write "com.apple.controlcenter" "NSStatusItem Visible Bluetooth" -bool true

# Control Center Modules > Screen Mirroring > Don't Show in Menu Bar
defaults write "com.apple.airplay" showInMenuBarIfPresent -bool false

# Control Center Modules > Sound > Always Show in Menu Bar
defaults write "com.apple.controlcenter" "NSStatusItem Visible Sound" -bool true

# Control Center Modules > Now Playing > Don't Show in Menu Bar
defaults write "com.apple.airplay" "NSStatusItem Visible NowPlaying" -bool true

# Menu Bar Only > Spotlight > Don't Show in Menu Bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1


################################################################################
# System Settings > Siri & Spotlight
################################################################################

#Ask Siri
defaults write com.apple.Siri SiriPrefStashedStatusMenuVisible -bool false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false


################################################################################
# System Settings > Desktop & Dock
################################################################################

# Dock > Size:
defaults write com.apple.dock tilesize -int 42

# Dock > Magnification
defaults write com.apple.dock largesize -int 54

# Dock > Magnification
defaults write com.apple.dock magnification -bool true

# Dock > Minimize windows using: Scale effect
defaults write com.apple.dock mineffect -string "genie"

# Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Dock > Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show recent applications in Dock
defaults write com.apple.dock "show-recents"  -bool false

# Windows & Apps > Prefer tabs when opening documents
defaults write -globalDomain AppleWindowTabbingMode -string "always"

# Mission Controll > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false


################################################################################
# System Settings > Lock Screen
################################################################################

# Start Screen Saver when inactive: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0


################################################################################
# System Settings > Keyboard
################################################################################

# Key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Delay until repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Txt Input > Show Input menu in menu bar
defaults write com.apple.TextInputMenu visible -bool false

# Txt Input > Correct spelling automatically
defaults write -globalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Txt Input > Capitalise words automatically
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false

# Txt Input > Add full stop with double-space
defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false


################################################################################
# System Settings > Trackpad
################################################################################

# Point & Click > Tap to click (enable)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Scroll & Zoom > Natural scrolling (disable) 
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

################################################################################
# System Settings > Bluetooth
################################################################################

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

################################################################################
# Finder > Preferences
################################################################################

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show warning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true


# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
