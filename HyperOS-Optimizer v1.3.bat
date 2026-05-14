@echo off
title HyperOS-Optimizer v1.3 [0xDSamael]
mode con: cols=85 lines=50
color 0b

:START
cls
echo.
echo  ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ███████╗██╗      ██████╗ ██╗    ██╗
echo  ██║  ██║╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔════╝██║     ██╔═══██╗██║    ██║
echo  ███████║ ╚████╔╝ ██████╔╝█████╗  ██████╔╝█████╗  ██║     ██║   ██║██║ █╗ ██║
echo  ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝  ██║     ██║   ██║██║███╗██║
echo  ██║  ██║   ██║   ██║     ███████╗██║  ██║██║     ███████╗╚██████╔╝╚███╔███╔╝
echo  ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝  ╚══╝╚══╝ 
echo =============================================================================
echo               HYPEROS-OPTIMIZER: DEBLOAT + PERFORMANCE + FPS
echo                            Dev: @0xDSamael (v1.3)
echo =============================================================================
echo.
echo [SYSTEM] Checking for connected devices...
echo [SYSTEM] Waiting for ADB...
adb wait-for-device
echo [SYSTEM] Device connected!
echo.
adb devices
echo.
timeout /t 2 >nul

echo [1/3] NUKING LIMITERS (Joyose Only)
echo -----------------------------------------------------------------------------
echo [STATUS] Disabling Joyose (Frame-rate governor)...
adb shell pm disable-user --user 0 com.xiaomi.joyose
:: PowerKeeper removed from list to maintain system integrity and reset logic
echo [INFO] PowerKeeper/Security Center preserved for System Integrity.
echo [DONE] Performance limiters modified.
echo.

echo [2/3] CLEAN DEBLOAT
echo -----------------------------------------------------------------------------
:: Removed -k flag to ensure clean uninstalls and prevent factory reset issues

:: 1. SOCIAL & COMMUNICATION
echo [REMOVING] Facebook... & adb shell pm uninstall --user 0 com.facebook.katana
echo [REMOVING] Messenger... & adb shell pm uninstall --user 0 com.facebook.orca
echo [REMOVING] TikTok (Global)... & adb shell pm uninstall --user 0 com.zhiliaoapp.musically
echo [REMOVING] TikTok (Asia)... & adb shell pm uninstall --user 0 com.ss.android.ugc.trill
echo [REMOVING] TikTok Lite... & adb shell pm uninstall --user 0 com.ss.android.ugc.tiktok.lite
echo [REMOVING] Twitter/X... & adb shell pm uninstall --user 0 com.twitter.android

:: 2. SHOPPING & COMMERCE
echo [REMOVING] Shopee... & adb shell pm uninstall --user 0 com.shopee.ph
echo [REMOVING] Lazada... & adb shell pm uninstall --user 0 com.lazada.android
echo [REMOVING] Amazon Shopping... & adb shell pm uninstall --user 0 com.amazon.mShop.android.shopping
echo [REMOVING] AliExpress... & adb shell pm uninstall --user 0 com.alibaba.aliexpresshd

:: 3. GAMES & GAMING TOOLS
echo [REMOVING] PUBG Mobile... & adb shell pm uninstall --user 0 com.tencent.ig
echo [REMOVING] Block Blast... & adb shell pm uninstall --user 0 com.block.juggle
echo [REMOVING] Game Service... & adb shell pm uninstall --user 0 com.enhance.gameservice

:: 4. XIAOMI ECOSYSTEM & TOOLS
echo [REMOVING] Xiaomi Home... & adb shell pm uninstall --user 0 com.xiaomi.smarthome
echo [REMOVING] Xiaomi Community... & adb shell pm uninstall --user 0 com.miui.enbbs
echo [REMOVING] Mi Store... & adb shell pm uninstall --user 0 com.mi.global.shop
echo [REMOVING] Mi Doc Viewer... & adb shell pm uninstall --user 0 com.ltsoft.ltdocsviewer
echo [REMOVING] Mi Browser... & adb shell pm uninstall --user 0 com.mi.globalbrowser

:: 5. GOOGLE & PRODUCTIVITY
echo [REMOVING] Google Photos... & adb shell pm uninstall --user 0 com.google.android.apps.photos
echo [REMOVING] OneDrive... & adb shell pm uninstall --user 0 com.microsoft.skydrive
echo [REMOVING] Google News... & adb shell pm uninstall --user 0 com.google.android.apps.magazines
echo [REMOVING] Spotify... & adb shell pm uninstall --user 0 com.spotify.music

:: 6. TELEMETRY & SYSTEM ADS
echo [REMOVING] MSA (Ads)... & adb shell pm uninstall --user 0 com.miui.msa.global
echo [REMOVING] Analytics... & adb shell pm uninstall --user 0 com.miui.analytics
echo [REMOVING] Miui Daemon... & adb shell pm uninstall --user 0 com.miui.daemon
echo [REMOVING] GetApps... & adb shell pm uninstall --user 0 com.xiaomi.mipicks
echo [REMOVING] Mi Yellow Pages... & adb shell pm uninstall --user 0 com.miui.yellowpage

echo [DONE] Bloatware removal finished.
echo.

echo [3/3] GRAPHICS ENGINE (STABILITY MODE)
echo -----------------------------------------------------------------------------
echo  [WARNING] Vulkan is EXPERIMENTAL. If you have bootloops, stay with Default.
echo.
set /p choice="[QUESTION] Enable Vulkan UI Rendering? (y/n): "

if /i "%choice%"=="y" (
    echo [STATUS] Switching UI Renderer to Vulkan (SkiaVK)...
    adb shell setprop debug.hwui.renderer skiavk
    echo [STATUS] Forcing GPU Composition...
    adb shell setprop debug.hwc.force_gpu 1
    echo [DONE] Vulkan enabled.
) else (
    echo [STATUS] Reverting/Staying on Default Renderer (OpenGL)...
    adb shell setprop debug.hwui.renderer ""
    adb shell setprop debug.hwc.force_gpu 0
    echo [DONE] Stability settings applied.
)
echo.

echo.
echo [3/3] EXPERIMENTAL: VULKAN & GRAPHICS
echo [STATUS] Switching UI Renderer to Vulkan (SkiaVK)...
adb shell setprop debug.hwui.renderer skiavk
echo [STATUS] Forcing GPU Composition...
adb shell setprop debug.hwc.force_gpu 1
echo Done.


echo.
echo ======================================================
echo     OPTIMIZATION COMPLETE! 
echo     1. Restart your device to apply Graphics changes.
echo     2. Turn OFF "Memory Extension" in Settings.
echo     3. GitHub: github.com/0xDSamael/HyperFlow-Optimizer
echo ======================================================
pause
