### Manual generating llvm ir:
```
cd /path/to/repo/sdl
clang app.c sim.c main.c -o llvm_task_app -lSDL2 -lSDL2main
clang app.c -emit-llvm -S -O2 -o app.ll
cd /path/to/repo/ir_generator
clang++ $(llvm-config --cppflags --ldflags --libs) ../SDL/sim.cpp ir_gen.cpp -lSDL2
```
