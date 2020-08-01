dunst &                                           # notifications
(feh --bg-scale ~/dots/art/3440x1440/green.jpg) & # wallpaper
xrdb -merge ~/.Xresources &                       # apply configuration
xset +fp /home/ben/.local/share/fonts &           # user fonts
~/bin/dwmbar &                                    # set status bar
exec dwm                                          # spark up dwm

