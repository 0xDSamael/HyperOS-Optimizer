@echo off
title HyperFlow-Optimizer v3.1 [0xDSamael]
mode con: cols=85 lines=58
color 0b

:START
cls
echo.
echo  HYPERFLOW-OPTIMIZER v3.1
echo =============================================================================

echo [SYSTEM] Waiting for ADB...
adb wait-for-device
echo [SYSTEM] Device connected!
echo.

echo [1/4] NUKING LIMITERS (Force Mode)
echo -----------------------------------------------------------------------------
echo [STATUS] Removing Joyose...
adb shell pm uninstall --user 0 com.xiaomi.joyose >nul 2>&1
echo [INFO] PowerKeeper/Security Center preserved for System Integrity.
echo [DONE] Joyose removed.
echo.

echo [2/4] CLEAN DEBLOAT (Safe Extended List)
echo -----------------------------------------------------------------------------
echo [PROCESS] Purging pre-installed bloatware:

:: FACEBOOK
echo [REMOVING] Facebook App Manager... & adb shell pm uninstall --user 0 com.facebook.appmanager >nul 2>&1
echo [REMOVING] Facebook Services... & adb shell pm uninstall --user 0 com.facebook.services >nul 2>&1
echo [REMOVING] Facebook System... & adb shell pm uninstall --user 0 com.facebook.system >nul 2>&1
echo [REMOVING] Facebook App... & adb shell pm uninstall --user 0 com.facebook.katana >nul 2>&1

:: GOOGLE
echo [REMOVING] Google One... & adb shell pm uninstall --user 0 com.google.android.apps.subscriptions.red >nul 2>&1
echo [REMOVING] Google TV... & adb shell pm uninstall --user 0 com.google.android.videos >nul 2>&1
echo [REMOVING] Google Meet/Duo... & adb shell pm uninstall --user 0 com.google.android.apps.tachyon >nul 2>&1
echo [REMOVING] YouTube Music... & adb shell pm uninstall --user 0 com.google.android.youtube.music >nul 2>&1
echo [REMOVING] Google News... & adb shell pm uninstall --user 0 com.google.android.apps.magazines >nul 2>&1

:: XIAOMI SYSTEM
echo [REMOVING] Xiaomi Game Center... & adb shell pm uninstall --user 0 com.xiaomi.mipicks >nul 2>&1
echo [REMOVING] ShareMe... & adb shell pm uninstall --user 0 com.xiaomi.midrop >nul 2>&1
echo [REMOVING] Mi Browser... & adb shell pm uninstall --user 0 com.mi.globalbrowser >nul 2>&1
echo [REMOVING] Mi Music... & adb shell pm uninstall --user 0 com.miui.player >nul 2>&1
echo [REMOVING] Miui Daemon... & adb shell pm uninstall --user 0 com.miui.daemon >nul 2>&1
echo [REMOVING] Miui Analytics... & adb shell pm uninstall --user 0 com.miui.analytics >nul 2>&1
echo [REMOVING] MSA (Ads)... & adb shell pm uninstall --user 0 com.miui.msa.global >nul 2>&1

:: SOCIAL & GAMES
echo [REMOVING] TikTok... & adb shell pm uninstall --user 0 com.zhiliaoapp.musically >nul 2>&1
echo [REMOVING] Shopee... & adb shell pm uninstall --user 0 com.shopee.ph >nul 2>&1
echo [REMOVING] Lazada... & adb shell pm uninstall --user 0 com.lazada.android >nul 2>&1
echo [REMOVING] Spotify... & adb shell pm uninstall --user 0 com.spotify.music >nul 2>&1
echo [REMOVING] Block Blast... & adb shell pm uninstall --user 0 com.block.juggle >nul 2>&1

echo.
echo [DONE] Safe debloat complete.
echo.

echo [3/4] GRAPHICS ENGINE SELECTION
echo -----------------------------------------------------------------------------
set /p choice="[QUESTION] Enable Vulkan UI Rendering? (y/n): "
if /i "%choice%"=="y" (
    echo [STATUS] Applying Vulkan...
    adb shell setprop debug.hwui.renderer skiavk
    adb shell setprop debug.hwc.force_gpu 1
    echo [DONE] Vulkan enabled.
) else (
    echo [STATUS] Resetting to Default Renderer...
    adb shell setprop debug.hwui.renderer ""
    adb shell setprop debug.hwc.force_gpu 0
    echo [DONE] Stability settings applied.
)
echo.

echo [4/4] SYSTEM TWEAKS
echo -----------------------------------------------------------------------------
echo [STATUS] Optimizing Multitasking (Phantom Process Killer)...
adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647" >nul 2>&1
adb shell settings put global settings_enable_monitor_phantom_procs false >nul 2>&1
echo [DONE] Multitasking optimized.
echo.


echo.
echo ======================================================
echo     OPTIMIZATION COMPLETE! 
echo     1. Restart your device to apply Graphics changes.
echo     2. Turn OFF "Memory Extension" in Settings.
echo     3. GitHub: github.com/0xDSamael/HyperFlow-Optimizer
echo ======================================================
pause
