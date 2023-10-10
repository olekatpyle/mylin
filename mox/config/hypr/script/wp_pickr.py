#!/usr/bin/env python3

import subprocess
from random import randrange

# list of all wallpapers pickr can choose from
wps: list[str] = ["~/.local/assets/wallpapers/calm1.jpg", "~/.local/assets/wallpapers/calm2.jpg",
                  "~/.local/assets/wallpapers/calm3.jpg", "~/.local/assets/wallpapers/calm4.jpg"]

dps: list[str] = ["eDP-1", "DP-2", "HDMI-1-A"]


def main():
    rdm: int = randrange(len(wps))
    wp: str = wps[rdm]

    for dp in dps:
        subprocess.run(['hyprctl', 'hyprpaper', 'wallpaper', f'{dp},{wp}'])

    exit()


if __name__ == "__main__":
    main()
