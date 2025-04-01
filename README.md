# noogle-magisk

Magisk modules for removing/replacing Google applications on stock Android 11-15.

## Modules

Name | Description
--- | ---
Noogle microG | Installs microG Services in place of Google Services (if present)
Noogle Debloat [WIP] | Removes other Google system apps from Android (still can be installed from store)

## Install

0. It's a good idea to enable ADB debugging
1. Download latest version from [releases](https://github.com/SelfRef/noogle-magisk/releases)
2. Install through Magisk app
3. Reboot
4. In Magisk click "Action" button next to module to grant permissions
    - Or open microG app and grant them through Self-Check

## Build

0. Use Linux, Mac or WSL on Windows
1. Install `zip`, `curl`, `jq` if not present
2. Run `./build-noogle-microg.sh`
3. Module will be created in `dist/`

## Tested on
The module was tested on:
Device | OS | Android Version
:---: | :---: | :---:
Nothing Phone (1) | NothingOS 3.0 | 15

Need more tests...

## Troubleshooting

### Bootloop
In this case if you have ADB debugging enabled just connect your phone to PC and in terminal run `adb shell magisk --remove-modules`. It will remove all modules.

If you don't have ADB enabled, you may try to restart the device a few times (holding Power + Vol-) until Magisk safe mode hits and modules will be disabled.

## QA
- Q: What is the difference between this and other microG installers?
- A: This installer aims for stock Android support with Google apps preinstalled. Should work on AOSP-based as well.