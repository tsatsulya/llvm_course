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
#include <llvm/IR/Instructions.h>
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"


#include "../../sdl/sim.h"

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

    // ; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
    // declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3
    ArrayRef<Type *> llvm_memcpy_p0_p0_i64_types = {builder.getPtrTy(), builder.getPtrTy(),
                                                 Type::getInt64Ty(context),
                                                 Type::getInt1Ty(context)};
    FunctionType *llvm_memcpy_p0_p0_i64_t =
        FunctionType::get(void_t, llvm_memcpy_p0_p0_i64_types, false);
    Function *llvm_memcpy_p0_p0_i64 = Function::Create(
        llvm_memcpy_p0_p0_i64_t, Function::ExternalLinkage, "llvm.memset.p0.i64", module);

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
    BasicBlock *app_bb13 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb19 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb23 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb34 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb39 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb42 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb52 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb58 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb59 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb60 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb69 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb75 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb78 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb81 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb86 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb97 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb112 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb115 = BasicBlock::Create(context, "", app);


    // #0
    builder.SetInsertPoint(app_bb0);
    ArrayType *array_t = ArrayType::get(IntegerType::get(context, 8), 1000);
    //   %1 = alloca [1000 x i8], align 16
    Value *val1 = builder.CreateAlloca(array_t);
    //   %2 = alloca [1000 x i8], align 16
    Value *val2 = builder.CreateAlloca(array_t);
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
    //   %5 = phi i32 [ 0, %0 ], [ %113, %112 ]
    PHINode *val5 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   br label %115
    builder.CreateBr(app_bb115);

    // 6:
    builder.SetInsertPoint(app_bb6);
    //   call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %2) #5
    builder.CreateCall(llvm_lifetime_end_func, {builder.getInt64(1000), val2});
    //   ret void
    builder.CreateRetVoid();


    // declare void @simFlush() local_unnamed_addr #6
    FunctionType *sim_flush_t = FunctionType::get(void_t, {void_t}, false);
    FunctionCallee sim_flush = module->getOrInsertFunction("simFlush", sim_flush_t);

    // declare void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef)
    // local_unnamed_addr #6
    FunctionType *sim_put_display_pixel_t = FunctionType::get(void_t, {Type::getInt32Ty(context), Type::getInt32Ty(context),
                           Type::getInt32Ty(context), Type::getInt32Ty(context)}, false);
    FunctionCallee sim_put_display_pixel =
        module->getOrInsertFunction("simPutDisplayPixel", sim_put_display_pixel_t);

    // 7:
    builder.SetInsertPoint(app_bb7);
    //   tail call void (...) @simFlush() #4
    builder.CreateCall(sim_flush);  // ?????????????
    //   call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %1) #4
    builder.CreateCall(llvm_lifetime_start_func, {builder.getInt64(1000), val1});
    //   call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(1000) %1, ptr noundef nonnull align 16 dereferenceable(1000) %2, i64 1000, i1 false), !tbaa !3
    builder.CreateCall(llvm_memcpy_p0_p0_i64,
                       {val1, val2, builder.getInt64(1000), builder.getInt1(0)});
    //   br label %8
    builder.CreateBr(app_bb8);


    // 8:
    builder.SetInsertPoint(app_bb8);
    //   %9 = phi i64 [ 0, %7 ], [ %166, %153 ]
    PHINode *val9 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %10 = trunc i64 %9 to i32
    Value *val10 = builder.CreateTrunc(val9, builder.getInt32Ty());
    //   %11 = urem i16 %10, 25
    Value *val11 = builder.CreateURem(val10, builder.getInt32(25));
    //   %12 = udiv i32 %10, 25
    Value *val12 = builder.CreateUDiv(val10, builder.getInt32(25));
    //   switch i32 %11, label %13 [
    //     i32 0, label %19
    //     i32 24, label %19
    //   ]
    SwitchInst *switch_inst8 = builder.CreateSwitch(val11, app_bb13, 2);
    switch_inst8->addCase(builder.getInt16(0), app_bb19);
    switch_inst8->addCase(builder.getInt16(24), app_bb19);


    // 13:
    builder.SetInsertPoint(app_bb13);
    //   %14 = icmp ult i64 %9, 25
    Value *val14 = builder.CreateICmpULT(val9, builder.getInt64(25));
    //   %15 = add i32 %10, -975
    Value *val15 = builder.CreateAdd(val10, builder.getInt32(-975));
    //   %16 = icmp ult i32 %15, 25
    Value *val16 = builder.CreateICmpULT(val15, builder.getInt64(25));
    //   %17 = or i1 %14, %16
    Value *val17 = builder.CreateOr(val14, val16);
    //   %18 = zext i1 %17 to i8
    Value *val18 = builder.CreateZExt(val17, builder.getInt8Ty());
    //   br label %19
    builder.CreateBr(app_bb19);


    // 19:
    builder.SetInsertPoint(app_bb13);
    //   %20 = phi i8 [ 1, %8 ], [ 1, %8 ], [ %18, %13 ]
    PHINode *val20 = builder.CreatePHI(builder.getInt8Ty(), 3);
    //   %21 = icmp eq i8 %20, 0
    Value *val21 = builder.CreateICmpEQ(val20, builder.getInt8(0));
    //   %22 = add nsw i32 %11, -1
    Value *val22 = builder.CreateAdd(val11, builder.getInt32(0));
    //   br i1 %21, label %23, label %52
    builder.CreateCondBr(val21, app_bb23, app_bb52);


    // 23:
    builder.SetInsertPoint(app_bb23);
    //   %24 = udiv i32 %10, 25
    Value *val24 = builder.CreateUDiv(val10, builder.getInt32(25));
    //   %25 = getelementptr inbounds i8, ptr %1, i64 %9
    Value *val25 = builder.CreateInBoundsGEP(builder.getInt8Ty(), val1, val9);
    //   %26 = load i8, ptr %25, align 1, !tbaa !3
    Value *val26 = builder.CreateLoad(builder.getInt32Ty(), val25);
    //   %27 = add nsw i32 %24, -1
    Value *val27 = builder.CreateAdd(val24, builder.getInt32(-1));
    //   %28 = sext i32 %22 to i64
    Value *val28 = builder.CreateSExt(val22, builder.getInt64Ty());
    //   %29 = add nuw nsw i32 %11, 2
    Value *val29 = builder.CreateAdd(val11, builder.getInt32(2));
    //   %30 = sext i32 %27 to i64
    Value *val30 = builder.CreateSExt(val27, builder.getInt64Ty());
    //   %31 = add nuw nsw i32 %24, 2
    Value *val31 = builder.CreateAdd(val24, builder.getInt32(2));
    //   %32 = zext nneg i32 %31 to i64
    Value *val32 = builder.CreateZExt(val31, builder.getInt64Ty());
    //   %33 = zext nneg i32 %29 to i64
    Value *val33 = builder.CreateZExt(val29, builder.getInt64Ty());
    //   br label %34
    builder.CreateBr(app_bb34);

    // 34:
    builder.SetInsertPoint(app_bb23);
    //   %35 = phi i64 [ %30, %23 ], [ %40, %39 ]
    PHINode *val35 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %36 = phi i32 [ 0, %23 ], [ %49, %39 ]
    PHINode *val36 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %37 = mul nsw i64 %35, 40
    Value *val37 = builder.CreateMul(val35, builder.getInt64(40));
    //   %38 = getelementptr i8, ptr %1, i64 %37
    Value *val38 = builder.CreateGEP(builder.getInt8Ty(), val1, val37);
    //   br label %42
    builder.CreateBr(app_bb42);

    // 39:
    builder.SetInsertPoint(app_bb23);
    //   %40 = add nsw i64 %35, 1
    Value *val40 = builder.CreateAdd(val35, builder.getInt64(1));
    //   %41 = icmp eq i64 %40, %32
    Value *val41 = builder.CreateICmpEQ(val40, val32);
    //   br i1 %41, label %97, label %34, !llvm.loop !6
    builder.CreateCondBr(val41, app_bb97, app_bb34);


    // 42:
    builder.SetInsertPoint(app_bb42);
    //   %43 = phi i64 [ %28, %34 ], [ %50, %42 ]
    PHINode *val43 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %44 = phi i32 [ %36, %34 ], [ %49, %42 ]
    PHINode *val44 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %45 = getelementptr i8, ptr %38, i64 %43
    Value *val45 = builder.CreateGEP(builder.getInt8Ty(), val38, val43);
    //   %46 = load i8, ptr %45, align 1, !tbaa !3
    Value *val46 = builder.CreateLoad(builder.getInt8Ty(), val45);
    //   %47 = icmp ne i8 %46, 0
    Value *val47 = builder.CreateICmpNE(val46, builder.getInt8(0));
    //   %48 = zext i1 %47 to i32
    Value *val48 = builder.CreateZExt(val47, builder.getInt32Ty());
    //   %49 = add nsw i32 %44, %48
    Value *val49 = builder.CreateAdd(val44, val48);
    //   %50 = add nsw i64 %43, 1
    Value *val50 = builder.CreateAdd(val44, builder.getInt64(1));
    //   %51 = icmp eq i64 %50, %33
    Value *val51 = builder.CreateICmpEQ(val50, val30);
    //   br i1 %51, label %39, label %42, !llvm.loop !9
    builder.CreateCondBr(val51, app_bb39, app_bb42);

    // 52:
    builder.SetInsertPoint(app_bb52);
    //   %53 = getelementptr inbounds i8, ptr %1, i64 %9
    Value *val53 = builder.CreateInBoundsGEP(builder.getInt8Ty(), val1, val9);
    //   %54 = load i8, ptr %53, align 1, !tbaa !3
    Value *val54 = builder.CreateLoad(builder.getInt8Ty(), val53);
    //   %55 = add nuw nsw i32 %11, 1
    Value *val55 = builder.CreateAdd(val11, builder.getInt32(1));
    //   %56 = add nsw i32 %12, -1
    Value *val56 = builder.CreateAdd(val12, builder.getInt32(-1));
    //   %57 = add nuw nsw i32 %12, 1
    Value *val57 = builder.CreateAdd(val12, builder.getInt32(1));
    //   switch i32 %11, label %60 [
    //     i32 0, label %58
    //     i32 24, label %59
    //   ]
    SwitchInst *switch_inst52 = builder.CreateSwitch(val11, app_bb13, 2);
    switch_inst8->addCase(builder.getInt16(0), app_bb58);
    switch_inst8->addCase(builder.getInt16(24), app_bb59);

    // 58:
    builder.SetInsertPoint(app_bb58);
    //   br label %60
    builder.CreateBr(app_bb60);

    // 59:
    builder.SetInsertPoint(app_bb59);
    //   br label %60
    builder.CreateBr(app_bb60);

    // 60:
    builder.SetInsertPoint(app_bb60);
    //   %61 = phi i32 [ %22, %52 ], [ %22, %59 ], [ 0, %58 ]
    PHINode *val61 = builder.CreatePHI(builder.getInt32Ty(), 3);
    //   %62 = phi i32 [ %55, %52 ], [ 24, %59 ], [ %55, %58 ]
    PHINode *val62 = builder.CreatePHI(builder.getInt32Ty(), 3);
    //   %63 = icmp ult i64 %9, 25
    Value *val63 = builder.CreateICmpULT(val50, builder.getInt64(25));
    //   %64 = select i1 %63, i32 0, i32 %56
    Value *val64 = builder.CreateSelect(val63, builder.getInt32(0), val56);
    //   %65 = add i32 %10, -975
    Value *val65 = builder.CreateAdd(val10, builder.getInt32(-975));
    //   %66 = icmp ult i32 %65, 25
    Value *val66 = builder.CreateICmpULT(val65, builder.getInt64(25));
    //   %67 = select i1 %66, i32 39, i32 %57
    Value *val67 = builder.CreateSelect(val66, builder.getInt32(39), val57);
    //   %68 = icmp sgt i32 %64, %67
    Value *val68 = builder.CreateICmpSGT(val64, val67);
    //   br i1 %68, label %97, label %69
    builder.CreateCondBr(val68, app_bb97, app_bb69);


    // 69:
    builder.SetInsertPoint(app_bb69);
    //   %70 = icmp sgt i32 %61, %62
    Value *val70 = builder.CreateICmpSGT(val61, val62);
    //   %71 = sext i32 %61 to i64
    Value *val71 = builder.CreateSExt(val61, builder.getInt64Ty());
    //   %72 = add nsw i32 %62, 1
    Value *val72 = builder.CreateAdd(val62, builder.getInt32(1));
    //   %73 = sext i32 %64 to i64
    Value *val73 = builder.CreateSExt(val64, builder.getInt64Ty());
    //   %74 = add nuw nsw i32 %67, 1
    Value *val74 = builder.CreateAdd(val67, builder.getInt32(1));
    //   br label %75
    builder.CreateBr(app_bb75);

    // 75:
    builder.SetInsertPoint(app_bb75);
    //   %76 = phi i64 [ %73, %69 ], [ %83, %81 ]
    PHINode *val76 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %77 = phi i32 [ 0, %69 ], [ %82, %81 ]
    PHINode *val77 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   br i1 %70, label %81, label %78
    builder.CreateCondBr(val70, app_bb81, app_bb78);


    // 78:
    builder.SetInsertPoint(app_bb78);
    //   %79 = mul nsw i64 %76, 40
    Value *val79 = builder.CreateMul(val76, builder.getInt64(40));
    //   %80 = getelementptr i8, ptr %1, i64 %79
    Value *val80 = builder.CreateGEP(builder.getInt8Ty(), val1, val79);
    //   br label %86
    builder.CreateBr(app_bb86);

    // 81:
    builder.SetInsertPoint(app_bb81);
    //   %82 = phi i32 [ %77, %75 ], [ %93, %86 ]
    PHINode *val82 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %83 = add nsw i64 %76, 1
    Value *val83 = builder.CreateAdd(val76, builder.getInt32(1));
    //   %84 = trunc i64 %83 to i32
    Value *val84 = builder.CreateTrunc(val83, builder.getInt32Ty());
    //   %85 = icmp eq i32 %74, %84
    Value *val85 = builder.CreateICmpEQ(val74, val84);
    //   br i1 %85, label %97, label %75, !llvm.loop !6
    builder.CreateCondBr(val85, app_bb97, app_bb75);


    // 86:
    builder.SetInsertPoint(app_bb86);
    //   %87 = phi i64 [ %71, %78 ], [ %94, %86 ]
    PHINode *val87 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %88 = phi i32 [ %77, %78 ], [ %93, %86 ]
    PHINode *val88 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %89 = getelementptr i8, ptr %80, i64 %87
    Value *val89 = builder.CreateGEP(builder.getInt8Ty(), val80, val87);
    //   %90 = load i8, ptr %89, align 1, !tbaa !3
    Value *val90 = builder.CreateLoad(builder.getInt8Ty(), val89);
    //   %91 = icmp ne i8 %90, 0
    Value *val91 = builder.CreateICmpNE(val90, builder.getInt8(0));
    //   %92 = zext i1 %91 to i32
    Value *val92 = builder.CreateZExt(val91, builder.getInt32Ty());
    //   %93 = add nsw i32 %88, %92
    Value *val93 = builder.CreateAdd(val88, val92);
    //   %94 = add nsw i64 %87, 1
    Value *val94 = builder.CreateAdd(val87, builder.getInt64(1));
    //   %95 = trunc i64 %94 to i32
    Value *val95 = builder.CreateTrunc(val94, builder.getInt32Ty());
    //   %96 = icmp eq i32 %72, %95
    Value *val96 = builder.CreateICmpEQ(val72, val92);
    //   br i1 %96, label %81, label %86, !llvm.loop !9
    builder.CreateCondBr(val96, app_bb81, app_bb86);


    // 97:
    builder.SetInsertPoint(app_bb97);
    //   %98 = phi i8 [ %54, %60 ], [ %26, %39 ], [ %54, %81 ]
    PHINode *val98 = builder.CreatePHI(builder.getInt64Ty(), 3);
    //   %99 = phi i32 [ 0, %60 ], [ %49, %39 ], [ %82, %81 ]
    PHINode *val99 = builder.CreatePHI(builder.getInt64Ty(), 3);
    //   %100 = icmp ne i8 %98, 0
    Value *val100 = builder.CreateICmpNE(val98, builder.getInt8(0));
    //   %101 = add i32 %99, -4
    Value *val101 = builder.CreateAdd(val99, builder.getInt32(-4));
    //   %102 = icmp ult i32 %101, -2
    Value *val102 = builder.CreateICmpULT(val98, builder.getInt8(-2));
    //   %103 = and i1 %100, %102
    Value *val103 = builder.CreateAnd(val100, val102);
    //   %104 = icmp eq i8 %98, 0
    Value *val104 = builder.CreateICmpEQ(val98, builder.getInt8(0));
    //   %105 = icmp eq i32 %99, 3
    Value *val105 = builder.CreateICmpEQ(val99, builder.getInt8(8));
    //   %106 = and i1 %104, %105
    Value *val106 = builder.CreateAnd(val104, val105);
    //   %107 = select i1 %106, i8 1, i8 %98
    Value *val107 = builder.CreateSelect(val106, builder.getInt8(1), val98);
    //   %108 = select i1 %103, i8 0, i8 %107
    Value *val108 = builder.CreateSelect(val103, builder.getInt8(0), val107);
    //   %109 = getelementptr inbounds i8, ptr %2, i64 %9
    Value *val109 = builder.CreateInBoundsGEP(builder.getInt8Ty(), val2, val9);
    //   store i8 %108, ptr %109, align 1, !tbaa !3
    builder.CreateStore(val108, val109);
    //   %110 = add nuw nsw i64 %9, 1
    Value *val110 = builder.CreateAdd(val9, builder.getInt64(1));
    //   %111 = icmp eq i64 %110, 1000
    Value *val111 = builder.CreateICmpEQ(val110, builder.getInt64(1000));
    //   br i1 %111, label %112, label %8, !llvm.loop !10
    builder.CreateCondBr(val111, app_bb112, app_bb8);

    // 112:
    builder.SetInsertPoint(app_bb112);
    //   call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %1) #4
    builder.CreateCall(llvm_lifetime_end_func, {builder.getInt64(1000), val1});
    //   %113 = add nuw nsw i32 %5, 1
    Value *val113 = builder.CreateAdd(val5, builder.getInt32(1));
    //   %114 = icmp eq i32 %113, 100
    Value *val114 = builder.CreateICmpEQ(val113, builder.getInt32(100));
    //   br i1 %114, label %6, label %4, !llvm.loop !11
    builder.CreateCondBr(val114, app_bb6, app_bb4);

    // 115:
    builder.SetInsertPoint(app_bb115);
    // %116 = phi i64 [ 0, %4 ], [ %125, %115 ]
    PHINode *val116 = builder.CreatePHI(builder.getInt64Ty(), 2);
    // %117 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %116
    Value *val117 = builder.CreateInBoundsGEP(array_t, val2, { builder.getInt64(0), val16 } );
    // %118 = load i8, ptr %117, align 1, !tbaa !3
    Value *val118 = builder.CreateLoad(builder.getInt8Ty(), val117);
    // %119 = icmp eq i8 %118, 0
    Value *val119 = builder.CreateICmpEQ(val118, builder.getInt8(0));
    // %120 = trunc i64 %116 to i32
    Value *val120 = builder.CreateTrunc(val116, builder.getInt32Ty());
    // %121 = udiv i32 %120, 25
    Value *val121 = builder.CreateUDiv(val120, builder.getInt32(20));
    // %122 = trunc i64 %116 to i32
    Value *val122 = builder.CreateTrunc(val116, builder.getInt32Ty());
    // %123 = urem i32 %122, 25
    Value *val123 = builder.CreateURem(val122, builder.getInt32(25));
    // %124 = select i1 %119, i32 -1, i32 16751001
    Value *val124 = builder.CreateSelect(val119, builder.getInt32(-1), builder.getInt32(16751001));
    // tail call void @simPutDisplayPixel(i32 noundef %121, i32 noundef %123, i32 noundef %124, i32 noundef 40) #4
    builder.CreateCall(sim_put_display_pixel, {val121, val123, val124, builder.getInt32(40)});
    // %125 = add nuw nsw i64 %116, 1
    Value *val125 = builder.CreateAdd(val116, builder.getInt64(1));
    // %126 = icmp eq i64 %125, 1000
    Value *val126 = builder.CreateICmpEQ(val125, builder.getInt64(1000));
    // br i1 %126, label %7, label %115, !llvm.loop !12
    builder.CreateCondBr(val126, app_bb7, app_bb115);


    // phiphiphi


    // %5 = phi i32 [ 0, %0 ], [ %113, %112 ]
    val5->addIncoming(builder.getInt32(0), app_bb0);
    val5->addIncoming(val113, app_bb112);

    // %9 = phi i64 [ 0, %7 ], [ %110, %97 ]
    val9->addIncoming(builder.getInt32(0), app_bb7);
    val9->addIncoming(val110, app_bb97);

    // %20 = phi i8 [ 1, %8 ], [ 1, %8 ], [ %18, %13 ]
    val20->addIncoming(builder.getInt32(1), app_bb8);
    val20->addIncoming(builder.getInt32(1), app_bb8);
    val20->addIncoming(val18, app_bb13);


    // %35 = phi i64 [ %30, %23 ], [ %40, %39 ]
    val35->addIncoming(val30, app_bb23);
    val35->addIncoming(val40, app_bb39);

    // %36 = phi i32 [ 0, %23 ], [ %49, %39 ]
    val36->addIncoming(builder.getInt32(0), app_bb23);
    val36->addIncoming(val49, app_bb39);

    // %43 = phi i64 [ %28, %34 ], [ %50, %42 ]
    val43->addIncoming(val28, app_bb34);
    val43->addIncoming(val50, app_bb42);

    // %44 = phi i32 [ %36, %34 ], [ %49, %42 ]
    val44->addIncoming(val36, app_bb34);
    val44->addIncoming(val49, app_bb42);

    // %61 = phi i32 [ %22, %52 ], [ %22, %59 ], [ 0, %58 ]
    val61->addIncoming(val22, app_bb52);
    val61->addIncoming(val22, app_bb59);
    val61->addIncoming(builder.getInt32(0), app_bb58);

    // %62 = phi i32 [ %55, %52 ], [ 24, %59 ], [ %55, %58 ]
    val62->addIncoming(val55, app_bb52);
    val62->addIncoming(builder.getInt32(24), app_bb59);
    val62->addIncoming(val55, app_bb58);


    // %76 = phi i64 [ %73, %69 ], [ %83, %81 ]
    val76->addIncoming(val73, app_bb69);
    val76->addIncoming(val83, app_bb81);

    // %77 = phi i32 [ 0, %69 ], [ %82, %81 ]
    val77->addIncoming(builder.getInt32(0), app_bb69);
    val77->addIncoming(val82, app_bb81);

    // %82 = phi i32 [ %77, %75 ], [ %93, %86 ]
    val77->addIncoming(val77, app_bb75);
    val77->addIncoming(val93, app_bb86);

    // %87 = phi i64 [ %71, %78 ], [ %94, %86 ]
    val87->addIncoming(val71, app_bb78);
    val87->addIncoming(val94, app_bb86);

    // %88 = phi i32 [ %77, %78 ], [ %93, %86 ]
    val88->addIncoming(val77, app_bb78);
    val88->addIncoming(val93, app_bb86);

    // %98 = phi i8 [ %54, %60 ], [ %26, %39 ], [ %54, %81 ]
    val98->addIncoming(val54, app_bb60);
    val98->addIncoming(val26, app_bb39);
    val98->addIncoming(val54, app_bb81);

    // %99 = phi i32 [ 0, %60 ], [ %49, %39 ], [ %82, %81 ]
    val99->addIncoming(builder.getInt32(0), app_bb60);
    val99->addIncoming(val49, app_bb39);
    val99->addIncoming(val82, app_bb81);

    // %116 = phi i64 [ 0, %4 ], [ %125, %115 ]
    val116->addIncoming(builder.getInt32(0), app_bb4);
    val116->addIncoming(val125, app_bb115);


    // dump
    module->print(outs(), nullptr);

    // interpret ir
    outs() << "\nrunning...............\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    ee->InstallLazyFunctionCreator([&](const std::string &fnName) -> void * {
        if (fnName == "simPutDisplayPixel") {
            return reinterpret_cast<void *>(simPutDisplayPixel);
        }
        if (fnName == "simFlush") {
            return reinterpret_cast<void *>(simFlush);
        }
        return nullptr;
    });
    ee->finalizeObject();

    simInit();

    ArrayRef<GenericValue> noargs;
    GenericValue v = ee->runFunction(app, noargs);
    outs() << "\ndoneeeee!\n";

    // simExit();
    return EXIT_SUCCESS;
}

