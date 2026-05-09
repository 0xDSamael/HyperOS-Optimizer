@echo off
title HyperOS-Optimizer v1.2 [0xDSamael]
color 0b
echo ======================================================
echo     HYPEROS-OPTIMIZER: DEBLOAT + PERFORMANCE + FPS
echo ======================================================
echo Checking for connected devices...
echo Waiting for device...
adb wait-for-device
echo Device connected!
adb devices
echo.

echo [1/5] NUKING LIMITERS (Joyose & PowerKeeper)
echo [STATUS] Disabling Joyose (Frame-rate governor)...
adb shell pm disable-user --user 0 com.xiaomi.joyose
echo [STATUS] Restricting PowerKeeper (Background killer)...
adb shell appops set com.miui.powerkeeper WRITE_SETTINGS deny
adb shell appops set com.miui.powerkeeper GET_USAGE_STATS deny
adb shell appops set com.miui.powerkeeper RUN_IN_BACKGROUND deny
echo Done.

echo.
echo [2/5] REMOVING BLOATWARE (Categorized Deep Clean)

:: 1. SOCIAL & COMMUNICATION
echo [REMOVING] Facebook App Manager... & adb shell pm uninstall -k --user 0 com.facebook.appmanager
echo [REMOVING] Facebook... & adb shell pm uninstall -k --user 0 com.facebook.katana
echo [REMOVING] Messenger... & adb shell pm uninstall -k --user 0 com.facebook.orca
echo [REMOVING] Facebook Services... & adb shell pm uninstall -k --user 0 com.facebook.services
echo [REMOVING] Facebook System... & adb shell pm uninstall -k --user 0 com.facebook.system
echo [REMOVING] LinkedIn... & adb shell pm uninstall -k --user 0 com.linkedin.android
echo [REMOVING] Skype... & adb shell pm uninstall -k --user 0 com.skype.raider
echo [REMOVING] TikTok... & adb shell pm uninstall -k --user 0 com.zhiliaoapp.musically
echo [REMOVING] Google Duo/Meet... & adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon

:: 2. SHOPPING & TRAVEL
echo [REMOVING] AliExpress... & adb shell pm uninstall -k --user 0 com.alibaba.aliexpresshd
echo [REMOVING] Amazon Shopping... & adb shell pm uninstall -k --user 0 com.amazon.mshop.android
echo [REMOVING] Booking.com... & adb shell pm uninstall -k --user 0 com.booking
echo [REMOVING] Temu... & adb shell pm uninstall -k --user 0 com.einnovation.temu
echo [REMOVING] CapCut... & adb shell pm uninstall -k --user 0 com.lemon.lvoverseas

:: 3. PRE-INSTALLED GAMES
echo [REMOVING] Game Service... & adb shell pm uninstall -k --user 0 com.enhance.gameservice
echo [REMOVING] Raid Legends... & adb shell pm uninstall -k --user 0 com.plarium.raidlegends
echo [REMOVING] Bubble Shooter... & adb shell pm uninstall -k --user 0 com.soulcompany.bubbleshooter.relaxing
echo [REMOVING] Solitaire... & adb shell pm uninstall -k --user 0 com.tripledot.solitaire

:: 4. ENTERTAINMENT & MEDIA
echo [REMOVING] YT Music... & adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music
echo [REMOVING] YT Kids... & adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.kids
echo [REMOVING] Google TV... & adb shell pm uninstall -k --user 0 com.google.android.videos
echo [REMOVING] Netflix... & adb shell pm uninstall -k --user 0 com.netflix.mediaclient
echo [REMOVING] Netflix Activation... & adb shell pm uninstall -k --user 0 com.netflix.partner.activation

:: 5. PRODUCTIVITY & GOOGLE TOOLS
echo [REMOVING] WPS Office... & adb shell pm uninstall -k --user 0 cn.wps.moffice_eng
echo [REMOVING] Google Drive... & adb shell pm uninstall -k --user 0 com.google.android.apps.docs
echo [REMOVING] Google Keep... & adb shell pm uninstall -k --user 0 com.google.android.keep
echo [REMOVING] Google One... & adb shell pm uninstall -k --user 0 com.google.android.apps.subscriptions.red
echo [REMOVING] Google Lens... & adb shell pm uninstall -k --user 0 com.google.ar.lens
echo [REMOVING] Android Auto... & adb shell pm uninstall -k --user 0 com.google.android.projection.gearhead

:: 6. XIAOMI TOOLS & OEM JUNK
echo [REMOVING] Mi Browser... & adb shell pm uninstall -k --user 0 com.mi.globalbrowser
echo [REMOVING] Mi Music... & adb shell pm uninstall -k --user 0 com.miui.player
echo [REMOVING] Mi Notes... & adb shell pm uninstall -k --user 0 com.miui.notes
echo [REMOVING] Mi Scanner... & adb shell pm uninstall -k --user 0 com.xiaomi.scanner
echo [REMOVING] Mi Remote... & adb shell pm uninstall -k --user 0 com.duokan.phone.remotecontroller
echo [REMOVING] Weather... & adb shell pm uninstall -k --user 0 com.miui.weather2

:: 7. CORE TELEMETRY, ADS & TRACKING
echo [REMOVING] MSA (Ads)... & adb shell pm uninstall -k --user 0 com.miui.msa.global
echo [REMOVING] Analytics... & adb shell pm uninstall -k --user 0 com.miui.analytics
echo [REMOVING] Miui Daemon... & adb shell pm uninstall -k --user 0 com.miui.daemon
echo [REMOVING] System Ad Solution... & adb shell pm uninstall -k --user 0 com.miui.systemAdSolution
echo [REMOVING] GetApps... & adb shell pm uninstall -k --user 0 com.xiaomi.mipicks
echo [REMOVING] Mab (Xiaomi Ads)... & adb shell pm uninstall -k --user 0 com.xiaomi.ab
echo [REMOVING] Mi Bug Report... & adb shell pm uninstall -k --user 0 com.miui.bugreport
echo [REMOVING] Mi Yellow Pages... & adb shell pm uninstall -k --user 0 com.miui.yellowpage

echo Done.

echo.
echo [3/5] EXPERIMENTAL: VULKAN & GRAPHICS
echo [STATUS] Switching UI Renderer to Vulkan (SkiaVK)...
adb shell setprop debug.hwui.renderer skiavk
echo [STATUS] Forcing GPU Composition...
adb shell setprop debug.hwc.force_gpu 1
echo Done.

echo.
echo [4/5] SYSTEM TWEAKS (Multitasking)
echo [STATUS] Adjusting Phantom Process Killer...
adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
adb shell settings put global settings_enable_monitor_phantom_procs false
echo Done.

echo.
echo [5/5] CACHE CLEANUP
echo [STATUS] Clearing Security Center Cache...
adb shell pm clear com.miui.securitycenter
echo Done.

echo.
echo ======================================================
echo     OPTIMIZATION COMPLETE! 
echo     1. Restart your device to apply Graphics changes.
echo     2. Turn OFF "Memory Extension" in Settings.
echo     3. GitHub: github.com/0xDSamael/HyperFlow-Optimizer
echo ======================================================
pause
