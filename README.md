# TWRP device tree for Xiaomi 15

Xiaomi 15 (codenamed _"dada"_) is a high-end smartphone from Xiaomi.

It was announced & released on October 2024.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Snapdragon® 8 Elite (SM8750)
CPU     | 2x 4.32GHz Prime core & 6x 3.53GHz Performance cores
GPU     | Qualcomm® Adreno™ 830
Memory  | 12/16GB RAM (LPDDR5X)
Shipped Android Version | 15.0 with HyperOS 2
Storage | 256/512/1024GB
Battery | 5400mAh(typ)/5260mAh(min), non-removable
Display | 1200x2670, 6.36", AMOLED, 1-120Hz dynamic, 3200nits peak brightness
Camera  | 50MP (main), 50MP (floating telephoto), 50MP (ultra-wide), 32MP (front)

## Build by yourself?
1. Fix wrong screen colors -> [commit](https://github.com/YuKongA/android_bootable_recovery/commit/7b630af24cf4849fae6115f1cc15c527b3197f0c)

2. Fix `E: Unknown File System: mifs` -> [commit](https://github.com/YuKongA/android_bootable_recovery/commit/983ee200761b0196a928506ab37f1d75fa369347)

## Features
Not works:
- [ ] Decryption

Works:
- [X] ADB
- [X] Display
- [X] Fasbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [X] Vibrator
- [X] Mount /data

## To use it:

```
fastboot flash recovery_ab out/target/product/dada/recovery.img
```

## Device picture

![Xiaomi 15](https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1730124041.20684102.png)
