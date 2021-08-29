#!/usr/bin/env python3
from pulsectl import Pulse, PulseLoopStop
import sys


def get_active_sink(sinks, default_sink_name):
  return [sink for sink in sinks if sink.name == default_sink_name][0]


def get_volume_value(pulse):
  server_info = pulse.server_info()
  sinks = pulse.sink_list()
  active_sink = get_active_sink(sinks, server_info.default_sink_name)
  return active_sink, round(active_sink.volume.value_flat * 100)


def main():
  with Pulse() as pulse:
    sink = None
    def callback(ev):
      if ev.index == sink.index:
        raise PulseLoopStop
    try:
      pulse.event_mask_set('sink')
      pulse.event_callback_set(callback)
      sink, last_value = get_volume_value(pulse)
      while True:
        pulse.event_listen()
        sink, value = get_volume_value(pulse)
        if value != last_value:
          print(value)
          last_value = value
        sys.stdout.flush()
    except:
      pass


if __name__ == "__main__":
  main()
