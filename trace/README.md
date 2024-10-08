Here is the task2 for the course on LLVM :\
\
Use the LLVM Pass to collect a trace of the instructions utilized by a graphical application at the optimization level -O2\

Build:
```shell
cd *path/to/repo/trace*
mkdir build
cd build
cmake -GNinja .. -DAPP_SRC_DIR=*path/to/graphical/app*
ninja run_llvm_pass
```

The instruction trace will be recorded in  statistics/pass_log.txt

In the folder **statistics** you will find:
- A route of instructions collected during the execution of the graphic application in **pass_log.txt**
- Graph of instruction call frequency statistics in *opcodes_statistics*
- Graph of main instruction combinations with the length < 5>

*0:
	icmp<-srem
	br<-icmp

*1:
	br<-icmp
	icmp<-sdiv

*2:
	br<-icmp
	br<-icmp

*3:
	getelementptr<-sext
	br<-icmp

*4:
	getelementptr<-sext
	getelementptr<-sext

*5:
	getelementptr<-alloca
	getelementptr<-alloca

*6:
	getelementptr<-alloca
	br<-icmp

*7:
	br<-icmp
	icmp<-sdiv
	br<-icmp

*8:
	br<-icmp
	br<-icmp
	br<-icmp

*9:
	getelementptr<-sext
	br<-icmp
	br<-icmp

*10:
	br<-icmp
	getelementptr<-sext
	getelementptr<-sext

*11:
	getelementptr<-alloca
	getelementptr<-alloca
	br<-icmp

*12:
	getelementptr<-sext
	br<-icmp
	br<-icmp
	br<-icmp

*13:
	br<-icmp
	br<-icmp
	br<-icmp
	br<-icmp

*14:
	getelementptr<-sext
	br<-icmp
	br<-icmp
	br<-icmp
	br<-icmp

*15:
	br<-icmp
	br<-icmp
	br<-icmp
	br<-icmp
	br<-icmp
