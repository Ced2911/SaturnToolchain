# Sega saturn toolchain
## Toolchain
+ gcc 8.3.0
+ binutils 2.32
+ newlib 3.1.0


## How to use
### With docker 
```
docker run -it --rm --name saturn_toolchain -v ${PWD}:/workspace ced2911/saturntoolchain:latest
```

## How to build
See DockerFile
```
docker build --rm -f DockerFile -t saturntoolchain:latest .
```

##### Based on https://github.com/FreddieChopin/bleeding-edge-toolchain

