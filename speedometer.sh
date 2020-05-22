#!/bin/bash

diskutil list

dd count=4k bs=1024k if=/dev/zero of=/Volumes/Untitled/write.img
# example output
# 4096+0 records in
# 4096+0 records out
# 4294967296 bytes transferred in 336.226841 secs (12774017 bytes/sec)

dd count=4k bs=1024k if=/Volumes/Untitled/write.img of=/dev/null
# example output
# 4096+0 records in
# 4096+0 records out
# 4294967296 bytes transferred in 230.024234 secs (18671803 bytes/sec)

rm /Volumes/Untitled/write.img
