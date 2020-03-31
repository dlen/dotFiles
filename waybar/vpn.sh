#!/usr/bin/env bash

set -euo pipefail

location=''

check_vpn_up() {
  if ip a show tun0 > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

mullvad_random_location() {
  local locations=( at be bg cz dk fi fr de gr hu  ie it lv lu md nl no pl pt ro rs es se ch gb )
  local rand="$((RANDOM % $((${#locations[@]}))))"
  location="${locations[$rand]}"

  mullvad relay set location "$location"
  mullvad connect
  echo "$location"
}

waybar_output() {
  local percentage="$1"

  echo "{\"text\": \"$location \", \"class\": \"active\", \"percentage\": \"$percentage\"}"
}

toggle_vpn() {
  if check_vpn_up; then
    mullvad disconnect
    waybar_output "0"
  else
    mullvad_random_location
    waybar_output "90"
  fi
}

params="${1:-''}"

if [ "$params" == 'status' ]; then
  if check_vpn_up; then
    location="$(mullvad relay get | awk '{print $NF}')"
    waybar_output "100"
  else
    waybar_output "0"
  fi
else
  toggle_vpn
fi
