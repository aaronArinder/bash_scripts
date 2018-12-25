#!/bin/bash

# headers via read line
i3status | (read line && echo "$line" && read line && echo "$line" && read line && echo "$line" && while :
do
  read line
  # get pid from last line of file
  pomo_pid=$(tail -1 /tmp/pomo-pid.pid)
  # get time elapsed from `pomo` script; remove everything but `dd:dd`
  time=$(ps -q $pomo_pid -eo etime | sed -e 's/[A-Z]//g' | tr -d '\n' | tr -d '[:space:]')
  # funky formatting for i3
  echo ",[{\"full_text\":\"pomo: ${time}\"},${line#,\[}"
done)

