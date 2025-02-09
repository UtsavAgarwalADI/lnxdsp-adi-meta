#!/bin/sh

#If not already loaded at boot, then load the firmware:

#echo "echo_core1.ldr" > /sys/class/remoteproc/remoteproc0/firmware
#echo "start" > /sys/class/remoteproc/remoteproc0/state

#sleep 2

#echo "echo_core2.ldr" > /sys/class/remoteproc/remoteproc1/firmware
#echo "start" > /sys/class/remoteproc/remoteproc1/state

#sleep 2

RPMSG_EP=$(basename $(ls -d /sys/bus/rpmsg/devices/*.sharc-echo.-1.151))
rpmsg-bind-chardev -d ${RPMSG_EP} -a 50
echo hello | rpmsg-xmit -n 5 /dev/rpmsg0
RPMSG_EP=$(basename $(ls -d /sys/bus/rpmsg/devices/*.sharc-echo-cap.-1.161))
rpmsg-bind-chardev -d ${RPMSG_EP} -a 61
echo hello | rpmsg-xmit -n 5 /dev/rpmsg1
