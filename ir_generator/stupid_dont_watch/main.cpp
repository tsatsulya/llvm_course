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
    BasicBlock *app_bb82 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb83 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb84 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb106 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb109 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb112 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb115 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb134 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb137 = BasicBlock::Create(context, "", app);

    BasicBlock *app_bb153 = BasicBlock::Create(context, "", app);
    BasicBlock *app_bb171 = BasicBlock::Create(context, "", app);



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

    SwitchInst *switch_inst8 = builder.CreateSwitch(val11, app_bb14, 2);
    switch_inst8->addCase(builder.getInt16(0), app_bb74);
    switch_inst8->addCase(builder.getInt16(24), app_bb74);


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
    builder.CreateBr(app_bb153);

    // 74:
    builder.SetInsertPoint(app_bb74);
    //   %75 = getelementptr inbounds i8, ptr %1, i64 %9
    Value *val75 = builder.CreateInBoundsGEP(builder.getInt8Ty(), val1, val9);
    //   %76 = load i8, ptr %75, align 1, !tbaa !3
    Value *val76 = builder.CreateLoad(builder.getInt8Ty(), val75);
    //   %77 = zext nneg i16 %12 to i32
    Value *val77 = builder.CreateZExt(val12, builder.getInt32Ty());
    //   %78 = add nsw i32 %13, -1
    Value *val78 = builder.CreateAdd(val13, builder.getInt32(-1));
    //   %79 = add nuw nsw i32 %13, 1
    Value *val79 = builder.CreateAdd(val13, builder.getInt32(1));
    //   %80 = add nsw i32 %77, -1
    Value *val80 = builder.CreateAdd(val77, builder.getInt32(-1));
    //   %81 = add nuw nsw i32 %77, 1
    Value *val81 = builder.CreateAdd(val77, builder.getInt32(1));
    //   switch i16 %11, label %84 [
    //     i16 0, label %82
    //     i16 24, label %83
    //   ]
    SwitchInst *switch_inst74 = builder.CreateSwitch(val11, app_bb84, 2);
    switch_inst8->addCase(builder.getInt16(0), app_bb82);
    switch_inst8->addCase(builder.getInt16(24), app_bb83);


    // 82:
    builder.SetInsertPoint(app_bb82);
    //   br label %84
    builder.CreateBr(app_bb153);

    // 83:
    builder.SetInsertPoint(app_bb83);
    //   br label %84
    builder.CreateBr(app_bb153);

    // 84:
    // %85 = phi i32 [ %78, %74 ], [ 23, %83 ], [ 0, %82 ]
    PHINode *val85 = builder.CreatePHI(builder.getInt32Ty(), 3);
    // %86 = phi i32 [ %79, %74 ], [ 24, %83 ], [ 1, %82 ]
    PHINode *val86 = builder.CreatePHI(builder.getInt32Ty(), 3);
    // %87 = icmp ult i64 %9, 25
    Value *val87 = builder.CreateICmpULT(val9, builder.getInt64(25));
    // %88 = trunc i64 %9 to i32
    Value *val88 = builder.CreateTrunc(val9, builder.getInt32Ty());
    // %89 = add i32 %88, -975
    Value *val89 = builder.CreateAdd(val88, builder.getInt32(-975));
    // %90 = icmp ult i32 %89, 25
    Value *val90 = builder.CreateICmpULT(val89, builder.getInt32(25));
    // %91 = select i1 %90, i32 39, i32 %81
    Value *val91 = builder.CreateSelect(val90, builder.getInt32(39), val81);
    // %92 = select i1 %87, i32 %81, i32 %91
    Value *val92 = builder.CreateSelect(val87, val81, val91);
    // %93 = sext i32 %80 to i64
    Value *val93 = builder.CreateSExt(val80, builder.getInt64Ty());
    // %94 = icmp sgt i32 %85, %86
    Value *val94 = builder.CreateICmpSGT(val85, val86);
    // %95 = sext i32 %85 to i64
    Value *val95 = builder.CreateSExt(val85, builder.getInt64Ty());
    // %96 = add nuw nsw i32 %86, 1
    Value *val96 = builder.CreateAdd(val86, builder.getInt32(1));
    // %97 = select i1 %87, i64 0, i64 %93
    Value *val97 = builder.CreateSelect(val87, builder.getInt32(0), val93);
    // %98 = add nuw nsw i32 %92, 1
    Value *val98 = builder.CreateAdd(val92, builder.getInt32(1));
    // %99 = sub nsw i32 %86, %85
    Value *val99 = builder.CreateSub(val86, val85);
    // %100 = zext i32 %99 to i64
    Value *val100 = builder.CreateZExt(val99, builder.getInt64Ty());
    // %101 = add nuw nsw i64 %100, 1
    Value *val101 = builder.CreateAdd(val100, builder.getInt64(1));
    // %102 = icmp ult i32 %99, 7
    Value *val102 = builder.CreateICmpULT(val99, builder.getInt32(7));
    // %103 = and i64 %101, 8589934584
    Value *val103 = builder.CreateAnd(val101, builder.getInt64(8589934584));
    // %104 = add nsw i64 %103, %95
    Value *val104 = builder.CreateAdd(val103, val95);
    // %105 = icmp eq i64 %101, %103
    Value *val105 = builder.CreateAdd(val101, val103);
    // br label %106
    builder.CreateBr(app_bb106);



    // 106:
    builder.SetInsertPoint(app_bb106);
    //   %107 = phi i64 [ %97, %84 ], [ %139, %137 ]
    PHINode *val107 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   %108 = phi i32 [ 0, %84 ], [ %138, %137 ]
    PHINode *val108 = builder.CreatePHI(builder.getInt32Ty(), 2);
    //   br i1 %94, label %137, label %109
    builder.CreateCondBr(val94, app_bb137, app_bb109);


    // 109:
    builder.SetInsertPoint(app_bb109);
    //   %110 = mul nsw i64 %107, 40
    Value *val110 = builder.CreateMul(val107, builder.getInt64(40));
    //   %111 = getelementptr i8, ptr %1, i64 %110
    Value *val111 = builder.CreateGEP(builder.getInt8Ty(), val1, val110);
    //   br i1 %102, label %134, label %112
    builder.CreateCondBr(val102, app_bb134, app_bb112);

    // 112:
    builder.SetInsertPoint(app_bb112);
    //   %113 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %108, i64 0
    Value* emptyVec = UndefValue::get(VectorType::get(Type::getInt32Ty( context ), 4, false));
    Constant* index0 =  Constant::getIntegerValue(Type::getInt32Ty( context ), llvm::APInt(32, 0));
    Value* val113 = builder.CreateInsertElement(builder.getInt32(0), emptyVec, index0, "");
    // %114 = getelementptr i8, ptr %111, i64 %95
    Value *val114 = builder.CreateGEP(builder.getInt8Ty(), val111, val95);
    //   br label %115
    builder.CreateCondBr(val102, app_bb134, app_bb115);



    // 115:
    builder.SetInsertPoint(app_bb115);

    //   %116 = phi i64 [ 0, %112 ], [ %129, %115 ]
    PHINode *val116 = builder.CreatePHI(builder.getInt64Ty(), 2);
    //   %117 = phi <4 x i32> [ %113, %112 ], [ %127, %115 ]
    PHINode *val117 = builder.CreatePHI(VectorType::get(Type::getInt32Ty( context ), 4, false), 2);
    //   %118 = phi <4 x i32> [ zeroinitializer, %112 ], [ %128, %115 ]
    PHINode *val118 = builder.CreatePHI(VectorType::get(Type::getInt32Ty( context ), 4, false), 2);
    //   %119 = getelementptr i8, ptr %114, i64 %116
    Value *val119 = builder.CreateGEP(builder.getInt8Ty(), val114, val116);
    //   %120 = getelementptr i8, ptr %119, i64 4
    Value *val120 = builder.CreateGEP(builder.getInt8Ty(), val119, builder.getInt64(4));
    //   %121 = load <4 x i8>, ptr %119, align 1, !tbaa !3
    Value *val121 = builder.CreateLoad(VectorType::get(Type::getInt32Ty( context ), 4, false), val119);
    //   %122 = load <4 x i8>, ptr %120, align 1, !tbaa !3
    Value *val122 = builder.CreateLoad(VectorType::get(Type::getInt32Ty( context ), 4, false), val120);
    //   %123 = icmp ne <4 x i8> %121, zeroinitializer
    
    //   %124 = icmp ne <4 x i8> %122, zeroinitializer
    //   %125 = zext <4 x i1> %123 to <4 x i32>
    //   %126 = zext <4 x i1> %124 to <4 x i32>
    //   %127 = add <4 x i32> %117, %125
    //   %128 = add <4 x i32> %118, %126
    //   %129 = add nuw i64 %116, 8
    //   %130 = icmp eq i64 %129, %103
    //   br i1 %130, label %131, label %115, !llvm.loop !6
    return 0;
}

