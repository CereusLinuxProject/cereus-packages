LibreWolf has succesfully been removed from glibc container.
Please note that the fonts and GTK themes will not be removed, as you can need them later.

If you will not longer need them, run:
# voidnsrun -r /glibc xbps-remove -Rfy freetype fontconfig libXft xorg-fonts fonts-roboto-ttf Graphite-gtk-theme-black
