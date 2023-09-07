#!/system/bin/sh
MODDIR=${0%/*}
write /proc/sys/vm/page-cluster 0
write /sys/block/zram0/max_comp_streams 4

# Set zram configurations
resetprop ro.vendor.qti.config.zram true
