# ReVanced Magisk
[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/revanced_kingsmanvn)
[![CI](https://github.com/king1x32/ReVanced-Magisk/actions/workflows/ci.yml/badge.svg?event=schedule)](https://github.com/king1x32/ReVanced-Magisk/actions/workflows/ci.yml)
[![Latest release](https://img.shields.io/github/v/release/king1x32/ReVanced-Magisk?style=flat-square)](https://github.com/king1x32/ReVanced-Magisk/releases/latest)

Extensive ReVanced builder

 * Install [ReVanced Microg](https://github.com/ReVanced/GmsCore/releases) for non-root YouTube and YT Music APKs
 * Use [**zygisk-detach**](https://github.com/j-hc/zygisk-detach) to detach YouTube and YT Music from Play Store if you are using magisk modules.

<details><summary><big>Features</big></summary>
<ul>
 <li>Support all present and future ReVanced and <a href="https://github.com/inotia00/revanced-patches">ReVanced Extended</a> apps</li>
 <li> Can build Magisk modules and non-root APKs</li>
 <li> Updated daily with the latest versions of apps and patches</li>
 <li> Optimize APKs and modules for size</li>
 <li> Modules</li>
    <ul>
     <li> recompile invalidated odex for faster usage</li>
     <li> receive updates from Magisk app</li>
     <li> do not break safetynet or trigger root detections</li>
     <li> handle installation of the correct version of the stock app and all that</li>
     <li> support Magisk and KernelSU</li>
    </ul>
</ul>
Note that the <a href="../../actions/workflows/ci.yml">CI workflow</a> is scheduled to build the modules and APKs everyday using GitHub Actions if there is a change in ReVanced patches. You may want to disable it.
</details>

## To include/exclude patches or patch other apps

 * Star the repo :eyes:
 * [Fork the repo](https://github.com/king1x32/ReVanced-Magisk/fork) or use it as a template
 * Customize [`config.toml`](./config.toml) using [rvmm-config-gen](https://j-hc.github.io/rvmm-config-gen/)
 * Run the build [workflow](../../actions/workflows/build.yml)
 * Grab your modules and APKs from [releases](../../releases)

also see here [`CONFIG.md`](./CONFIG.md)

## If you are having trouble with the classic mount method of the modules
such as,
- **"Reflash needed"** error after reboots
- **"Suspicious mount detected"** warnings from root detector apps

You can consider using [rvmm-zygisk-mount](https://github.com/j-hc/rvmm-zygisk-mount)

## Building Locally
### On Termux
```console
bash <(curl -sSf https://raw.githubusercontent.com/king1x32/ReVanced-Magisk/main/build-termux.sh)
```

### On Desktop
```console
$ git clone https://github.com/king1x32/ReVanced-Magisk
$ cd ReVanced-Magisk
$ ./build.sh
```

## Credits to our upstream repository
[revanced-magisk-module](https://github.com/j-hc/revanced-magisk-module)
