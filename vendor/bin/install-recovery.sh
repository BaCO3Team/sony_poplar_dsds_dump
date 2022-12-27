#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/FOTAKernel$(getprop ro.boot.slot_suffix):23957504:5249f5eff969437473a9c7b5feee3f7bef5ae5cc; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot$(getprop ro.boot.slot_suffix):16138240:6da44b4a85239c47481603f790473a6e4ec084f4 \
          --target EMMC:/dev/block/bootdevice/by-name/FOTAKernel$(getprop ro.boot.slot_suffix):23957504:5249f5eff969437473a9c7b5feee3f7bef5ae5cc && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
