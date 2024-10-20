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


// 17:                                               ; preds = %14
//   %18 = udiv i16 %10, 25
//   %19 = getelementptr inbounds i8, ptr %1, i64 %9
//   %20 = load i8, ptr %19, align 1, !tbaa !3
//   %21 = add nsw i32 %13, -1
//   %22 = sext i32 %21 to i64
//   %23 = mul nuw nsw i16 %18, 40
//   %24 = zext nneg i16 %23 to i64
//   %25 = getelementptr i8, ptr %1, i64 %24
//   %26 = getelementptr i8, ptr %25, i64 -40
//   %27 = getelementptr i8, ptr %26, i64 %22
//   %28 = load i8, ptr %27, align 1, !tbaa !3
//   %29 = icmp ne i8 %28, 0
//   %30 = zext i1 %29 to i32
//   %31 = add nsw i64 %22, 1
//   %32 = getelementptr i8, ptr %26, i64 %31
//   %33 = load i8, ptr %32, align 1, !tbaa !3
//   %34 = icmp ne i8 %33, 0
//   %35 = zext i1 %34 to i32
//   %36 = add nuw nsw i32 %35, %30
//   %37 = add nsw i64 %22, 2
//   %38 = getelementptr i8, ptr %26, i64 %37
//   %39 = load i8, ptr %38, align 1, !tbaa !3
//   %40 = icmp ne i8 %39, 0
//   %41 = zext i1 %40 to i32
//   %42 = add nuw nsw i32 %36, %41
//   %43 = getelementptr i8, ptr %25, i64 %22
//   %44 = load i8, ptr %43, align 1, !tbaa !3
//   %45 = icmp ne i8 %44, 0
//   %46 = zext i1 %45 to i32
//   %47 = add nuw nsw i32 %42, %46
//   %48 = getelementptr i8, ptr %25, i64 %31
//   %49 = load i8, ptr %48, align 1, !tbaa !3
//   %50 = icmp ne i8 %49, 0
//   %51 = zext i1 %50 to i32
//   %52 = add nuw nsw i32 %47, %51
//   %53 = getelementptr i8, ptr %25, i64 %37
//   %54 = load i8, ptr %53, align 1, !tbaa !3
//   %55 = icmp ne i8 %54, 0
//   %56 = zext i1 %55 to i32
//   %57 = add nuw nsw i32 %52, %56
//   %58 = getelementptr i8, ptr %25, i64 40
//   %59 = getelementptr i8, ptr %58, i64 %22
//   %60 = load i8, ptr %59, align 1, !tbaa !3
//   %61 = icmp ne i8 %60, 0
//   %62 = zext i1 %61 to i32
//   %63 = add nuw nsw i32 %57, %62
//   %64 = getelementptr i8, ptr %58, i64 %31
//   %65 = load i8, ptr %64, align 1, !tbaa !3
//   %66 = icmp ne i8 %65, 0
//   %67 = zext i1 %66 to i32
//   %68 = add nuw nsw i32 %63, %67
//   %69 = getelementptr i8, ptr %58, i64 %37
//   %70 = load i8, ptr %69, align 1, !tbaa !3
//   %71 = icmp ne i8 %70, 0
//   %72 = zext i1 %71 to i32
//   %73 = add nuw nsw i32 %68, %72
//   br label %153

    return 0;
}
