#!/bin/bash

set -ex

cd "$(dirname "$0")"


WEATHER_API_KEY=545c874024b390a54c4ea1e29b78d82e conky -c ~/.config/conky/weather.conf &
sleep 1
conky -q -c ./conky/np.lua -d &>/dev/null
sleep 1
conky -q -c ./conky/npart.lua -d &> /dev/null
sleep 1
conky -q -c ./conky/bg.lua -d &> /dev/null

