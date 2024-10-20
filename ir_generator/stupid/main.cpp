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

    Type *void_t = Type::getVoidTy(context);

    // ; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem:
    // readwrite) declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1
    ArrayRef<Type *> llvm_lifetime_start_types = {Type::getInt64Ty(context), builder.getPtrTy()};
    FunctionType *llvm_lifetime_start_func_type =
        FunctionType::get(void_t, llvm_lifetime_start_types, false);
    Function *llvm_lifetime_start_func = Function::Create(
        llvm_lifetime_start_func_type, Function::ExternalLinkage, "llvm.lifetime.start.p0", module);

    // ; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem:
    // readwrite) declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1
    ArrayRef<Type *> llvm_lifetime_end_types = {Type::getInt64Ty(context), builder.getPtrTy()};
    FunctionType *llvm_lifetime_end_func_type =
        FunctionType::get(void_t, llvm_lifetime_end_types, false);
    Function *llvm_lifetime_end_func = Function::Create(
        llvm_lifetime_end_func_type, Function::ExternalLinkage, "llvm.lifetime.end.p0", module);


    ArrayRef<Type *> app_argt = {};
    FunctionType *app_t =
        FunctionType::get(builder.getVoidTy(), app_argt, false);
    Function *app =
        Function::Create(app_t, Function::ExternalLinkage, "app", module);


    BasicBlock *app_bb0 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb4 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb6 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb7 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb8 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb14 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb16 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb17 = BasicBlock::Create(context, "", app);


    BasicBlock *app_bb74 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb171 = BasicBlock::Create(context, "", app);



    // #0
    builder.SetInsertPoint(app_bb0);

    ArrayType *array = ArrayType::get(IntegerType::get(context, 8), 1000);
    //   %1 = alloca [1000 x i8], align 16
    Value *val1 = builder.CreateAlloca(array);
    //   %2 = alloca [1000 x i8], align 16
    Value *val2 = builder.CreateAlloca(array);
    // call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %2) #5
    builder.CreateCall(llvm_lifetime_start_func, {builder.getInt64(1000), val2});
    //   %3 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 14
    Value *val3 = builder.CreateConstGEP2_32(ArrayType::get(IntegerType::get(context, 8), 1000), val2, 0, 14);
    //   store i8 1, ptr %3, align 2, !tbaa !3
    builder.CreateStore(builder.getInt8(1), val3);
    //   br label %4
    builder.CreateBr(app_bb4);


    // 4:
    builder.SetInsertPoint(app_bb0);
    //   %5 = phi i32 [ 0, %0 ], [ %169, %168 ]
    PHINode *val5 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   br label %171
    builder.CreateBr(app_bb4);

    // 6:
    builder.SetInsertPoint(app_bb6);
    //   call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %2) #5
    builder.CreateCall(llvm_lifetime_end_func, {builder.getInt64(1000), val2});
    //   ret void
    builder.CreateRetVoid();


    // declare void @simFlush() local_unnamed_addr #6
    FunctionType *sim_flush_t = FunctionType::get(void_t, {void_t}, false);
    FunctionCallee sim_flush = module->getOrInsertFunction("simFlush", sim_flush_t);


    // 7:
    builder.SetInsertPoint(app_bb7);
    //   tail call void (...) @simFlush() #5
    builder.CreateCall(sim_flush);  // ?????????????
    //   call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %1) #5
    builder.CreateCall(llvm_lifetime_start_func, {builder.getInt64(1000), val1});

    //   call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(1000) %1, ptr noundef nonnull align 16 dereferenceable(1000) %2, i64 1000, i1 false), !tbaa !3
    // builder.CreateMemCpy(...) // TODO

    //   br label %8
    builder.CreateBr(app_bb8);


    // 8:
    builder.SetInsertPoint(app_bb8);
    //   %9 = phi i64 [ 0, %7 ], [ %166, %153 ]
    PHINode *val9 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %10 = trunc i64 %9 to i16
    Value *val10 = builder.CreateTrunc(val9, builder.getInt16Ty());
    //   %11 = urem i16 %10, 25
    Value *val11 = builder.CreateURem(val10, builder.getInt16(25));
    //   %12 = udiv i16 %10, 25
    Value *val12 = builder.CreateUDiv(val10, builder.getInt16(25));
    //   %13 = zext nneg i16 %11 to i32
    Value *val13 = builder.CreateZExt(val11, builder.getInt32Ty());
    //   switch i16 %11, label %14 [
    //     i16 0, label %74
    //     i16 24, label %74
    //   ]

    SwitchInst *switch_inst = builder.CreateSwitch(val11, app_bb14, 2);
    switch_inst->addCase(builder.getInt16(0), app_bb74);
    switch_inst->addCase(builder.getInt16(0), app_bb74);


    // 14:
    builder.SetInsertPoint(app_bb14);
    //   %15 = add nsw i64 %9, -25
    Value *val15 = builder.CreateAdd(val9, builder.getInt64(-25));
    //   %16 = icmp ult i64 %15, 950
    Value *val16 = builder.CreateICmpULT(val15, builder.getInt64(950));
    //   br i1 %16, label %17, label %74
    builder.CreateCondBr(val16, app_bb16, app_bb17);


    // 17:
    builder.SetInsertPoint(app_bb17);
    //   %18 = udiv i16 %10, 25
    Value *val18 = builder.CreateUDiv(val10, builder.getInt16(25));
    //   %19 = getelementptr inbounds i8, ptr %1, i64 %9
    Value *val19 = builder.CreateInBoundsGEP(builder.getInt8Ty(), val1, val9);
    //   %20 = load i8, ptr %19, align 1, !tbaa !3
    Value *val20 = builder.CreateLoad(builder.getInt8Ty(), val19);
    //   %21 = add nsw i32 %13, -1
    Value *val21 = builder.CreateAdd(val13, builder.getInt32(-1));
    //   %22 = sext i32 %21 to i64
    Value *val22 = builder.CreateSExt(val21, builder.getInt64Ty());
    //   %23 = mul nuw nsw i16 %18, 40
    Value *val23 = builder.CreateMul(val18, builder.getInt16(40));
    //   %24 = zext nneg i16 %23 to i64
    Value *val24 = builder.CreateZExt(val23, builder.getInt64Ty());
    //   %25 = getelementptr i8, ptr %1, i64 %24
    Value *val25 = builder.CreateGEP(builder.getInt8Ty(), val1, val24);
    //   %26 = getelementptr i8, ptr %25, i64 -40
    Value *val26 = builder.CreateGEP(builder.getInt8Ty(), val25, builder.getInt64(-40));
    //   %27 = getelementptr i8, ptr %26, i64 %22
    Value *val27 = builder.CreateGEP(builder.getInt8Ty(), val26, val22);
    //   %28 = load i8, ptr %27, align 1, !tbaa !3
    Value *val28 = builder.CreateLoad(builder.getInt8Ty(), val27);
    //   %29 = icmp ne i8 %28, 0
    Value *val29 = builder.CreateICmpNE(val28, builder.getInt8(0));
    //   %30 = zext i1 %29 to i32
    Value *val30 = builder.CreateZExt(val29, builder.getInt32Ty());
    //   %31 = add nsw i64 %22, 1
    Value *val31 = builder.CreateAdd(val22, builder.getInt8(1));
    //   %32 = getelementptr i8, ptr %26, i64 %31
    Value *val32 = builder.CreateGEP(builder.getInt8Ty(), val26, val31);
    //   %33 = load i8, ptr %32, align 1, !tbaa !3
    Value *val33 = builder.CreateLoad(builder.getInt8Ty(), val32);
    //   %34 = icmp ne i8 %33, 0
    Value *val34 = builder.CreateICmpNE(val33, builder.getInt8(0));
    //   %35 = zext i1 %34 to i32
    Value *val35 = builder.CreateZExt(val34, builder.getInt32Ty());
    //   %36 = add nuw nsw i32 %35, %30
    Value *val36 = builder.CreateAdd(val35, val30);
    //   %37 = add nsw i64 %22, 2
    Value *val37 = builder.CreateAdd(val22, builder.getInt8(2));
    //   %38 = getelementptr i8, ptr %26, i64 %37
    Value *val38 = builder.CreateGEP(builder.getInt8Ty(), val26, val37);
    //   %39 = load i8, ptr %38, align 1, !tbaa !3
    Value *val39 = builder.CreateLoad(builder.getInt8Ty(), val38);
    //   %40 = icmp ne i8 %39, 0
    Value *val40 = builder.CreateICmpNE(val39, builder.getInt8(0));
    //   %41 = zext i1 %40 to i32
    Value *val41 = builder.CreateZExt(val40, builder.getInt32Ty());
    //   %42 = add nuw nsw i32 %36, %41
    Value *val42 = builder.CreateAdd(val36, val41);
    //   %43 = getelementptr i8, ptr %25, i64 %22
    Value *val43 = builder.CreateGEP(builder.getInt8Ty(), val25, val22);
    //   %44 = load i8, ptr %43, align 1, !tbaa !3
    Value *val44 = builder.CreateLoad(builder.getInt8Ty(), val43);
    //   %45 = icmp ne i8 %44, 0
    Value *val45 = builder.CreateICmpNE(val44, builder.getInt8(0));
    //   %46 = zext i1 %45 to i32
    Value *val46 = builder.CreateZExt(val45, builder.getInt32Ty());
    //   %47 = add nuw nsw i32 %42, %46
    Value *val47 = builder.CreateAdd(val42, val46);
    //   %48 = getelementptr i8, ptr %25, i64 %31
    Value *val48 = builder.CreateGEP(builder.getInt8Ty(), val25, val31);
    //   %49 = load i8, ptr %48, align 1, !tbaa !3
    Value *val49 = builder.CreateLoad(builder.getInt8Ty(), val48);
    //   %50 = icmp ne i8 %49, 0
    Value *val50 = builder.CreateICmpNE(val49, builder.getInt8(0));
    //   %51 = zext i1 %50 to i32
    Value *val51 = builder.CreateZExt(val50, builder.getInt32Ty());
    //   %52 = add nuw nsw i32 %47, %51
    Value *val52 = builder.CreateAdd(val47, val51);
    //   %53 = getelementptr i8, ptr %25, i64 %37
    Value *val53 = builder.CreateGEP(builder.getInt8Ty(), val25, val37);
    //   %54 = load i8, ptr %53, align 1, !tbaa !3
    Value *val54 = builder.CreateLoad(builder.getInt8Ty(), val53);
    //   %55 = icmp ne i8 %54, 0
    Value *val55 = builder.CreateICmpNE(val54, builder.getInt8(0));
    //   %56 = zext i1 %55 to i32
    Value *val56 = builder.CreateZExt(val55, builder.getInt32Ty());
    //   %57 = add nuw nsw i32 %52, %56
    Value *val57 = builder.CreateAdd(val52, val56);
    //   %58 = getelementptr i8, ptr %25, i64 40
    Value *val58 = builder.CreateGEP(builder.getInt8Ty(), val25, builder.getInt64(40));
    //   %59 = getelementptr i8, ptr %58, i64 %22
    Value *val59 = builder.CreateGEP(builder.getInt8Ty(), val58, val22);
    //   %60 = load i8, ptr %59, align 1, !tbaa !3
    Value *val60 = builder.CreateLoad(builder.getInt8Ty(), val59);
    //   %61 = icmp ne i8 %60, 0
    Value *val61 = builder.CreateICmpNE(val60, builder.getInt8(0));
    //   %62 = zext i1 %61 to i32
    Value *val62 = builder.CreateZExt(val61, builder.getInt32Ty());
    //   %63 = add nuw nsw i32 %57, %62
    Value *val63 = builder.CreateAdd(val57, val62);
    //   %64 = getelementptr i8, ptr %58, i64 %31
    Value *val64 = builder.CreateGEP(builder.getInt8Ty(), val58, val31);
    //   %65 = load i8, ptr %64, align 1, !tbaa !3
    Value *val65 = builder.CreateLoad(builder.getInt8Ty(), val64);
    //   %66 = icmp ne i8 %65, 0
    Value *val66 = builder.CreateICmpNE(val65, builder.getInt8(0));
    //   %67 = zext i1 %66 to i32
    Value *val67 = builder.CreateZExt(val66, builder.getInt32Ty());
    //   %68 = add nuw nsw i32 %63, %67
    Value *val68 = builder.CreateAdd(val63, val67);
    //   %69 = getelementptr i8, ptr %58, i64 %37
    Value *val69 = builder.CreateGEP(builder.getInt8Ty(), val58, val37);
    //   %70 = load i8, ptr %69, align 1, !tbaa !3
    Value *val70 = builder.CreateLoad(builder.getInt8Ty(), val69);
    //   %71 = icmp ne i8 %70, 0
    Value *val71 = builder.CreateICmpNE(val70, builder.getInt8(0));
    //   %72 = zext i1 %71 to i32
    Value *val72 = builder.CreateZExt(val71, builder.getInt32Ty());
    //   %73 = add nuw nsw i32 %68, %72
    Value *val73 = builder.CreateAdd(val68, val72);

    //   br label %153
    builder.CreateBr(app_bb8);

    return 0;
}
