#!/usr/bin/env sh

nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits | awk '{ print ""$1"","%"}'
