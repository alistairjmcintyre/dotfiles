#!/usr/bin/env python3
from pulsectl import Pulse, PulseLoopStop
import sys

DEFAULT_SINK=0
sink_id = DEFAULT_SINK

def get_active_sink(sinks):
  for index, sink in enumerate(sinks, start=0):
    if sink.state == 'running':
      return index
  return DEFAULT_SINK

with Pulse() as pulse:
  def callback(ev):
    if ev.index == sink_id:
        raise PulseLoopStop
  try:
    pulse.event_mask_set('sink')
    pulse.event_callback_set(callback)
    sink_id = get_active_sink(pulse.sink_list())
    sink = pulse.sink_list()[sink_id]
    last_value = round(sink.volume.value_flat * 100)
    last_mute = sink.mute == 1
    while True:
      pulse.event_listen()
      sink_id = get_active_sink(pulse.sink_list())
      sink = pulse.sink_list()[sink_id]
      value = round(sink.volume.value_flat * 100)
      mute = sink.mute == 1
      if value != last_value or mute != last_mute:
        print(value, end='')
        if mute:
            print('!')
        else:
            print('')
        last_value = value
        last_mute = mute
      sys.stdout.flush()
  except:
    pass
