#!/system/bin/sh
MODDIR=${0%/*}

# Resetprop
A_API=$(getprop ro.build.version.sdk)
if [[ $A_API -ge 31 ]]; then
  # GPU Turbo Boost
  resetprop debug.composition.type auto
  resetprop hwui.disable_vsync false
  resetprop persist.sys.composition.type auto
  resetprop debug.sf.enable_gl_backpressure 0
elif [[ $A_API -le 30 ]]; then
  # GPU Turbo Boost
  resetprop debug.composition.type c2d
  resetprop debug.composition.type gpu
  resetprop hwui.disable_vsync true
  resetprop persist.sys.composition.type c2d
  resetprop persist.sys.composition.type gpu
  resetprop debug.sf.enable_gl_backpressure 1
fi
# Reset SurfaceFlinger
service call SurfaceFlinger 1008

# GPU Turbo Boost late_start service mode
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor performance
write /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor performance
write /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor performance
write /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor performance
write /sys/devices/system/cpu/cpufreq/policy0/scaling_governor performance
write /sys/devices/system/cpu/cpufreq/policy4/scaling_governor performance
write /sys/devices/system/cpu/cpufreq/performance/above_hispeed_delay 0
write /sys/devices/system/cpu/cpufreq/performance/boost 1
write /sys/devices/system/cpu/cpufreq/performance/go_hispeed_load 75
write /sys/devices/system/cpu/cpufreq/performance/max_freq_hysteresis 1
write /sys/devices/system/cpu/cpufreq/performance/align_windows 1
write /sys/kernel/gpu/gpu_governor performance
write /sys/module/adreno_idler/parameters/adreno_idler_active 0
write /sys/module/lazyplug/parameters/nr_possible_cores 8
write /sys/module/msm_performance/parameters/touchboost 1
write /dev/cpuset/foreground/boost/cpus 4-7
write /dev/cpuset/foreground/cpus 0-3,4-7
write /dev/cpuset/top-app/cpus 0-7
