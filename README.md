# Scalable matrix matrix multiplication on Embedded FPGA Platforms

This repo is forked from [here](https://github.com/spcl/gemm_hls). Please refer to the original repo for online resources and instruction. Here I have modified the cmake configuration files and generated a setting for cross-compiling. Still, the final output needs to be verified.

## Downloading the code

This project uses the open-source Vivado HLS extension library
[hlslib](https://github.com/definelicht/hlslib) for simulation, vectorization,
finding Xilinx tools, host-side integration, and more.

Since `hlslib` is included as a submodule, make sure you clone with `--recursive`
or grab it after cloning with:

```
git submodule update --init 
```

## Prerequisites

### Vitis
To build and run kernels in hardware, Xilinx
[Vitis](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vitis.html) or SDAccel
must be installed and available on the PATH (tested with versions 2019.2).

### ZCU102 Embedded Platform

To cross-compile the gemm_hls, you need both DSA platform and its sysroot. There is an excellent explanation for doing this [here](https://github.com/Xilinx/Vitis_Embedded_Platform_Source). I synthesized the platform for `zcu102_base`. Please copy the final generated platform folder to `path_to_vitis/platforms`. Also, make sure to create the sysroot SDK based on the provided instructions.

### Configuration the environment for coss-compiling
You need to set the environment for cross-compiling and re-direct the include and library path to your generated ARM sysroot SDK. To do it, you need to source the environment setup file as follows:
```bash
source environment_setup_aarch64_xilinx_linux.sh path_to_platform_repo/sysroot/sysroots/
```


## Configuration and synthesizing

This project is configured and built using CMake. Most parameters must be set at
configuration-time, as they are used to specialize in the hardware.

An example of configuring and building the kernel and executing it in hardware
is shown below (starting from the source directory):

```bash
mkdir build
cd build
cmake ../ -DMM_DATA_TYPE=float -DMM_SIZE_N=512 -DMM_SIZE_M=512 -DMM_PARALLELISM_N=32 -DMM_PARALLELISM_M=8 -DMM_MEMORY_TILE_SIZE_N=512 -DMM_MEMORY_TILE_SIZE_M=512 -DXRT_ROOT_DIR=$XRT_ROOT_DIR -DOpenCL_LIBRARIES=$SDKTARGETSYSROOT/usr/lib/ -DOpenCL_INCLUDE_DIRS=$SDKTARGETSYSROOT/usr/include/ -DCMAKE_SYSTEM_PROCESSOR=$CMAKE_SYSTEM_PROCESSOR -DCMAKE_SYSTEM_NAME=$CMAKE_SYSTEM_NAME
make
make synthesis
make compile_hardware 
make link_hardware
```

## Running
In order to run the platform, you should copy the content of the `build/sd_card` to your SD card. When the Linux is booted up, you can SSH to the system. The root password is `root`. Then, run the GEMM as follows:
```
root@xilinx-zcu102-2019_2:~# cd /mnt/
root@xilinx-zcu102-2019_2:/mnt# ./RunHardware hw
```