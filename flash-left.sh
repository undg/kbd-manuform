#!/bin/bash

# FIX: Compile Error: "No rule to make target 'drivers/avr/i2c_master.c'" for dactyl_manuform #15476
# https://github.com/qmk/qmk_firmware/issues/15476
qmk clean -a

qmk json2c b.json >~/qmk_firmware/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/keymap.c

qmk flash -bl avrdude-split-left
