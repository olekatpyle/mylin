#!/usr/bin/env python3

import subprocess
from random import randrange
from os import listdir
from os.path import isfile, join

# list of all wallpapers pickr can choose from
path: str = '/home/mox/.local/assets/wallpapers/pickr'
tmp: list = [wp for wp in listdir(
    path) if isfile(join(path, wp))]

wps: list = []

for f in tmp:
    f = f'{path}/{f}'
    wps.append(f)

print(wps)

dps: list[str] = ["eDP-1", "DP-2", "HDMI-A-1"]


def main():
    rdm: int = randrange(len(wps))
    wp: str = wps[rdm]

    for dp in dps:
        subprocess.run(['hyprctl', 'hyprpaper', 'wallpaper', f'{dp},{wp}'])

    with open('/home/mox/.cache/current_wp', 'w') as f:
        f.write(wp)

    exit()


if __name__ == "__main__":
    main()
