#!/usr/bin/env python3

import subprocess

with open('/home/mox/.cache/current_wp', 'r') as f:
    current: str = f.read()

subprocess.run(['swaylock', '-e', '-K',
               '-i' f'{current}', '--clock', '--indicator', '--indicator-radius', '150',
                '--indicator-thickness', '2', '--effect-blur', '4x4',
                '--text-color', 'ffffff', '--ring-color', 'ffffff',
                '--key-hl-color', 'd75fff', '--line-color', '00000000',
                '--inside-color', '000000'])
