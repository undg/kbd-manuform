#!/bin/bash

qmk json2c b.json > ~/qmk_firmware/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/keymap.c

qmk flash -bl avrdude-split-left

