#!/bin/bash

# Detect two workspaces with lowest min focusHistoryID
WS=$(hyprctl clients -j \
  | jq -r '
      group_by(.workspace.id)
      | map({
          ws: .[0].workspace.id,
          minFocus: (map(.focusHistoryID) | min)
        })
      | sort_by(.minFocus)
      | .[:2]
      | map(.ws)
      | @sh
    ')

# Convert jq output into bash array
eval "WS_ARR=($WS)"

WS1="${WS_ARR[0]}"
WS2="${WS_ARR[1]}"

echo "Swapping workspaces $WS1 and $WS2"

# Get windows
WS1_WINDOWS=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $WS1) | .address")
WS2_WINDOWS=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $WS2) | .address")

# Move WS1 → WS2
for win in $WS1_WINDOWS; do
    hyprctl dispatch movetoworkspace "$WS2",address:"$win"
done

# Move WS2 → WS1
for win in $WS2_WINDOWS; do
    hyprctl dispatch movetoworkspace "$WS1",address:"$win"
done
