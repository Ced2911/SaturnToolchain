# Sega saturn toolchain
## Toolchain
+ gcc 8.1.0
+ binutils 2.30
+ newlib 3.0.0
## How to build
See build/DockerFile
```
docker build --rm -f DockerFile -t saturn:latest .
```
It will generate 2 artifacts:
+ sh-elf-gcc-8.1.0-[date].tar.xz
+ sh-elf-gcc-8.1.0-[date].win64.7z
## How to use
### With docker 
see main DockerFile
```
docker run -it --rm --name saturn_toolchain -v d:/saturn/workspace/:/workspace saturn:latest
```
### On Windows
Use sh-elf-gcc-8.1.0-[date].win64.7z, and add bin directory to your %PATH%

##### Based on https://github.com/FreddieChopin/bleeding-edge-toolchain