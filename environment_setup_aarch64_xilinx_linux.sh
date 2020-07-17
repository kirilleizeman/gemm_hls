export SDKTARGETSYSROOT=$1/aarch64-xilinx-linux
export PATH=$1/x86_64-petalinux-linux/usr/bin:$1/x86_64-petalinux-linux/usr/sbin:$1/x86_64-petalinux-linux/bin:$1/x86_64-petalinux-linux/sbin:$1/x86_64-petalinux-linux/usr/bin/../x86_64-petalinux-linux/bin:$1/x86_64-petalinux-linux/usr/bin/aarch64-xilinx-linux:$1/x86_64-petalinux-linux/usr/bin/aarch64-xilinx-linux-musl:$PATH
export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT
export PKG_CONFIG_PATH=$SDKTARGETSYSROOT/usr/lib/pkgconfig:$SDKTARGETSYSROOT/usr/share/pkgconfig
export CONFIG_SITE=/mnt/2TB/WorkingDir/FPGA/Vitis_Embedded_Platform_Source/Xilinx_Official_Platforms/zcu102_base/platform_repo/sysroot/site-config-aarch64-xilinx-linux
export OECORE_NATIVE_SYSROOT="$1/x86_64-petalinux-linux"
export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"
export OECORE_ACLOCAL_OPTS="-I $1/x86_64-petalinux-linux/usr/share/aclocal"
export OECORE_BASELIB="lib"
export OECORE_TARGET_ARCH="aarch64"
export OECORE_TARGET_OS="linux"
unset command_not_found_handle
export CC="aarch64-xilinx-linux-gcc  --sysroot=$SDKTARGETSYSROOT"
export CXX="aarch64-xilinx-linux-g++  --sysroot=$SDKTARGETSYSROOT"
export CPP="aarch64-xilinx-linux-gcc -E  --sysroot=$SDKTARGETSYSROOT"
export AS="aarch64-xilinx-linux-as "
export LD="aarch64-xilinx-linux-ld  --sysroot=$SDKTARGETSYSROOT"
export CMAKE_SYSTEM_PROCESSOR="aarch64"
export GDB=aarch64-xilinx-linux-gdb
export STRIP=aarch64-xilinx-linux-strip
export RANLIB=aarch64-xilinx-linux-ranlib
export OBJCOPY=aarch64-xilinx-linux-objcopy
export OBJDUMP=aarch64-xilinx-linux-objdump
export AR=aarch64-xilinx-linux-ar
export NM=aarch64-xilinx-linux-nm
export M4=m4
export TARGET_PREFIX=aarch64-xilinx-linux-
export CONFIGURE_FLAGS="--target=aarch64-xilinx-linux --host=aarch64-xilinx-linux --build=x86_64-linux --with-libtool-sysroot=$SDKTARGETSYSROOT"
export CFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types "
export CXXFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types "
export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
export CPPFLAGS=""
export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"
export OECORE_DISTRO_VERSION="2019.2"
export OECORE_SDK_VERSION="2019.2"
export ARCH=arm64
export CROSS_COMPILE=aarch64-xilinx-linux-
export XRT_ROOT_DIR=$SDKTARGETSYSROOT/usr/
export XILINX_XRT=$SDKTARGETSYSROOT/usr/
export OpenCL_LIBRARIES=$SDKTARGETSYSROOT/usr/lib/
export OpenCL_INCLUDE_DIRS=$SDKTARGETSYSROOT/usr/include/
export CMAKE_SYSTEM_NAME="Linux"
#Only for xclbinutil
export PATH=$PATH:/opt/xilinx/xrt/bin/