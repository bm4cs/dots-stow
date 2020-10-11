dunst &                                           # notifications
(feh --bg-scale ~/dots/art/mountains.jpg) & # wallpaper
xrdb -merge ~/.Xresources &                       # apply configuration
xset +fp /home/ben/.local/share/fonts &           # user fonts
~/bin/dwmbar &                                    # set status bar
exec dwm                                          # spark up dwm

