#!/bin/bash

# Path to the tlp configuration file
TLP_CONF="/etc/tlp.conf"

# Battery charge thresholds (in percentage)
STOP_CHARGING=70
START_CHARGING=40

# Check battery percentage
BATTERY_PERCENTAGE=$(cat /sys/class/power_supply/BAT0/capacity)

# Check if tlp is installed
if ! command -v tlp &>/dev/null; then
    echo "TLP is not installed. Please install TLP first."
    exit 1
fi

# Check if the TLP configuration file exists
if [ ! -f "$TLP_CONF" ]; then
    echo "TLP configuration file not found at $TLP_CONF"
    exit 1
fi

# Check if the battery percentage is above the stop charging threshold
if [ $BATTERY_PERCENTAGE -ge $STOP_CHARGING ]; then
    sudo sed -i "s/^START_CHARGE_THRESH_BAT0.*/START_CHARGE_THRESH_BAT0=$STOP_CHARGING/" "$TLP_CONF"
    sudo tlp start
    echo "Charging is stopped. Battery at $BATTERY_PERCENTAGE%."
else
    # Check if the battery percentage is below the start charging threshold
    if [ $BATTERY_PERCENTAGE -le $START_CHARGING ]; then
        sudo sed -i "s/^START_CHARGE_THRESH_BAT0.*/START_CHARGE_THRESH_BAT0=$START_CHARGING/" "$TLP_CONF"
        sudo tlp start
        echo "Charging is started. Battery at $BATTERY_PERCENTAGE%."
    else
        echo "Battery level is within the acceptable range. No changes made."
    fi
fi
