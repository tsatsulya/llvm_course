This is the another first assignment variant. in this case the graphics library SDL is used and the project does not contain the CMakeLists file

### Main dependencies
- SDL
- clang


### Manual build and run
```
cd /path/to/repo/dir/sdl
clang app.c sim.c main.c -o llvm_task_app -lSDL2 -lSDL2main
./llvm_task_app
```
### Manual generating llvm ir:
```
cd /path/to/repo/dir/sdl
clang app.c sim.c main.c -o llvm_task_app -lSDL2 -lSDL2main
clang app.c -emit-llvm -S -O2 -o app.ll
```