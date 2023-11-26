#!/bin/bash
THUND=$(hyprctl clients | grep thunderbird)

thundr(){

if [[ "$THUND" != *"thunderbird"* ]]; then
            thunderbird
fi


}
thundr
