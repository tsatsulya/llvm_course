#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <iostream>
#include <llvm/IR/Instructions.h>

using namespace llvm;

struct custom_pass : public PassInfoMixin<custom_pass> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        LLVMContext &ctx = M.getContext();
        IRBuilder<> builder(ctx);

        Type *ret_t = Type::getVoidTy(ctx);
        ArrayRef<Type *> call_args_t = {builder.getInt8Ty()->getPointerTo(),
                                           builder.getInt8Ty()->getPointerTo()};
        FunctionType *log_func_t = FunctionType::get(ret_t, call_args_t, false);
        FunctionCallee log_func = M.getOrInsertFunction("call_logger", log_func_t);

        // std::ofstream pass_log("pass_log.txt");
        // pass_log << "Trace of  " << M.getName().str() << "\n";
        for (auto &F : M) {
            if (F.getName() == "call_logger")
            continue;

            // pass_log << "\n\n[Function] " << F.getName().str() << " (arg_size: " << F.arg_size() << ")\n\n";
            for (auto &B : F) {
                for (auto &I : B) {
                    if (dyn_cast<PHINode>(&I))
                        continue;
                    builder.SetInsertPoint(&I);
                    Value *inst_name = builder.CreateGlobalStringPtr(I.getOpcodeName());

                    for (auto &U : I.uses()) {
                        Instruction *user = dyn_cast<Instruction>(U.getUser());
                        Value *user_name = builder.CreateGlobalStringPtr(user->getOpcodeName());
                        Value *call_args[] = {inst_name, user_name};
                        builder.CreateCall(log_func, call_args);
                        // pass_log << user_instr->getOpcodeName() << "<-" << I.getOpcodeName() << "\n";
                    }
                }
            }
        }
        // pass_log.close();
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