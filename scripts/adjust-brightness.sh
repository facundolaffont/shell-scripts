#!/bin/bash

xrandr | awk '/.* connected.*/{print $1}' | xargs -I xxx xrandr --output xxx --brightness $1