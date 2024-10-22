#!/bin/bash

xinput_devport=$(sudo xinput list | grep Finger | awk -F= '{print $2}' | awk '{print $1}')
xinput disable $xinput_devport
xinput_devport=$(sudo xinput list | grep stylus | awk -F= '{print $2}' | awk '{print $1}')
xinput disable $xinput_devport
xinput_devport=$(sudo xinput list | grep eraser | awk -F= '{print $2}' | awk '{print $1}')
xinput disable $xinput_devport
xinput_devport=$(sudo xinput list | grep TrackPoint | awk -F= '{print $2}' | awk '{print $1}')
xinput disable $xinput_devport
xinput_devport=$(sudo xinput list | grep TouchPad | awk -F= '{print $2}' | awk '{print $1}')
xinput disable $xinput_devport
