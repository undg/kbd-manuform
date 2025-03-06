#!/bin/bash

# FIX: Compile Error: "No rule to make target 'drivers/avr/i2c_master.c'" for dactyl_manuform #15476
# https://github.com/qmk/qmk_firmware/issues/15476
qmk clean -a

qmk json2c b.json >~/qmk_firmware/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/keymap.c

# read -p 'File name for keymaps(no ectension): ' file
# qmk json2c $file.json > ~/qmk_firmware/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/keymap.c

# read -p 'flashing right side.'
qmk flash -bl avrdude-split-right

# read -p 'flashing left side.'
# qmk flash -bl avrdude-split-left
