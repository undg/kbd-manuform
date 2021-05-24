#!/bin/bash

read -p 'File name for keymaps(no ectension): ' file
qmk json2c $file.json > ~/qmk_firmware/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/keymap.c

read -p 'flashing right side.'
qmk flash -bl avrdude-split-right

read -p 'flashing left side.'
qmk flash -bl avrdude-split-left

