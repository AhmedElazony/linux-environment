# Arch Linux Desktop Environment
## This is based on DWM, Dmenu, ST

> Note: If you don't use arch linux, you can also use this environment, but you should edit the configurations related to Arch (such as pacman)

### Dependencies
- Xorg (for dwm)
- pipewire (if you are using pulseaudio, you can edit the configuration related to it)
- amixer (for managing audio)
- slock (for lock screen)
- xss-lock (for detecting lock screen if the screen goes off)
- clipmenu (clipboard used in dmenu)
- scrot (simple screenshot tool)
- picom (for transparency)
- Fonts Like: (Fira Code Nerd, Noto Kufi Arabic Font, Nerd Font, Font Awesome) you can download from [google fonts](https://fonts.google.com) or throw your package manager

### NOTES
- You can use <strong>one</strong> of these to configure the status bar NOT The Together:
    - [Manual Status bar Scrip](https://github.com/AhmedElazony/blob/main/dwm/scripts/dwm-status.sh)
    - [slstatus](https://github.com/AhmedElazony/blob/main/slstatus)

> To Enable the status bar using the manual script, But this line in the .xinitrc:
'''bash
.(/your/path/to)/dwm/scripts/dwm-status.sh &
'''
put this line <strong>before</strong> the '''bash exec dwm ''' line
