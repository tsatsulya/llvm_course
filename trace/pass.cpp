#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <iostream>

using namespace llvm;

struct custom_pass : public PassInfoMixin<custom_pass> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        std::ofstream pass_log("pass_log.txt");
        pass_log << "Trace of  " << M.getName().str() << "\n";
        for (auto &F : M) {
            pass_log << "\n\n[Function] " << F.getName().str() << " (arg_size: " << F.arg_size() << ")\n\n";
            for (auto &B : F) {
                for (auto &I : B) {
                    for (auto &U : I.uses()) {
                        Instruction *user_instr = dyn_cast<Instruction>(U.getUser());
                        pass_log << user_instr->getOpcodeName() << "<-" << I.getOpcodeName() << "\n";
                    }
                }
            }
        }
        pass_log.close();
        return PreservedAnalyses::all();
    }
};

// applying pass
PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerPipelineStartEPCallback([&](ModulePassManager &MPM, auto) {
      MPM.addPass(custom_pass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
};

// entry point for compiler
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}