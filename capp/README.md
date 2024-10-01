This is the first assignment for the course on LLMs. In this implementation, the SFML library is used for the graphical demonstration of the algorithm's operation.

### Main dependencies
- SFML-devel libs
- cmake
- ninja
- clang

### Build and run:

*/path/to/repo/dir/* :
``` shell
mkdir build
cd build
cmake -GNinja ../capp
ninja
./llvm_task
```

Generated llvm ir for app.cpp wil be placed near to app.cpp itself:
*/path/to/repo/dir/capp/app.ll*

### Manual generating llvm ir
*/path/to/repo/dir/capp :*
```
clang app.cpp -emit-llvm -Ipaint/include -S -O2 -o app.ll
```