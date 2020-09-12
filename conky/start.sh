#!/bin/bash

set -ex


WEATHER_API_KEY=545c874024b390a54c4ea1e29b78d82e conky -c ~/.config/conky/weather.conf -d &> /dev/null
sleep 1
cd "$(dirname "$0")"

conky -q -c ./conky/np.lua -d &>/dev/null
sleep 1
conky -q -c ./conky/npart.lua -d &> /dev/null
sleep 1
conky -q -c ./conky/bg.lua -d &> /dev/null

