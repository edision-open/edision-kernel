#!/bin/sh

edisionkernelversion="$(git ls-remote --tags https://github.com/edision-open/edision-kernel | grep -o '[^\/v]*$' | sort -rV | head -n 1)"
edisionkernelpatch="https://github.com/edision-open/edision-kernel/releases/download/v${edisionkernelversion}/edision-kernel-${edisionkernelversion}.patch.xz"
edisionkernelconfig="https://raw.githubusercontent.com/edision-open/meta-edision/master/recipes-kernel/linux/linux-edision/osmio4k/defconfig"

wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${edisionkernelversion}.tar.xz -O - | tar -xJ
cd linux-${edisionkernelversion}
wget ${edisionkernelpatch} -O - | xzcat | patch -p1
wget ${edisionkernelconfig} -O .config
