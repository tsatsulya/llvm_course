#include <memory>
#include <string>

#include "llvm/ADT/ArrayRef.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

int main() {
    LLVMContext context;
    Module *module = new Module("app.cpp", context);
    IRBuilder<> builder(context);

    ArrayRef<Type *> is_border_argt = {Type::getInt32Ty(context)};
    FunctionType *is_border_funct =
        FunctionType::get(builder.getInt8Ty(), is_border_argt, false);
    Function *is_border =
        Function::Create(is_border_funct, Function::ExternalLinkage, "is_border", module);

    Value *is_border_arg0 = is_border->getArg(0);
    
    return 0;
}