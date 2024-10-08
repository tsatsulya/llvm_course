#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <iostream>

using namespace llvm;

struct MyPass : public PassInfoMixin<MyPass> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        std::ofstream pass_log("pass_log.txt");
        // outs() << "Trace of  " << M.getName() << "\n";
        pass_log << "Trace of  " << M.getName().str() << "\n";
        for (auto &F : M) {
            // outs() << "[Function] " << F.getName() << " (arg_size: " << F.arg_size() << ")\n";
            pass_log << "\n\n[Function] " << F.getName().str() << " (arg_size: " << F.arg_size() << ")\n\n";
            for (auto &B : F) {
                for (auto &I : B) {
                    // Dump Instructions with users
                    for (auto &U : I.uses()) {
                        Instruction *user_instr = dyn_cast<Instruction>(U.getUser());
                        // outs() << user_instr->getOpcodeName() << "<-" << I.getOpcodeName() << "\n";
                        pass_log << user_instr->getOpcodeName() << "<-" << I.getOpcodeName() << "\n";
                    }
                }
            }
        }
        // outs() << "\n\n";
        pass_log.close();
        return PreservedAnalyses::all();
    }
};

// applying pass
PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerPipelineStartEPCallback([&](ModulePassManager &MPM, auto) {
      MPM.addPass(MyPass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
};

// entry point for compiler when applying my pass
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}