; ModuleID = '/home/varvara/projects/llvm_course/capp/app.cpp'
source_filename = "/home/varvara/projects/llvm_course/capp/app.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef signext i8 @_Z9is_borderi(i32 noundef %0) local_unnamed_addr #0 {
  %2 = srem i32 %0, 500
  switch i32 %2, label %3 [
    i32 0, label %10
    i32 499, label %10
  ]

3:                                                ; preds = %1
  %4 = add i32 %0, 499
  %5 = icmp ult i32 %4, 999
  %6 = add i32 %0, -199500
  %7 = icmp ult i32 %6, 500
  %8 = or i1 %5, %7
  %9 = zext i1 %8 to i8
  br label %10

10:                                               ; preds = %3, %1, %1
  %11 = phi i8 [ 1, %1 ], [ 1, %1 ], [ %9, %3 ]
  ret i8 %11
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local noundef i32 @_Z21get_neighbours_amountiPciiii(i32 noundef %0, ptr nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) local_unnamed_addr #1 {
  %7 = icmp sgt i32 %4, %5
  br i1 %7, label %52, label %8

8:                                                ; preds = %6
  %9 = icmp sgt i32 %2, %3
  %10 = sext i32 %2 to i64
  %11 = add i32 %3, 1
  %12 = sext i32 %4 to i64
  %13 = add i32 %5, 1
  %14 = sub i32 %3, %2
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = icmp ult i32 %14, 7
  %18 = and i64 %16, 8589934584
  %19 = add nsw i64 %18, %10
  %20 = icmp eq i64 %16, %18
  br label %21

21:                                               ; preds = %8, %54
  %22 = phi i64 [ %12, %8 ], [ %56, %54 ]
  %23 = phi i32 [ 0, %8 ], [ %55, %54 ]
  br i1 %9, label %54, label %24

24:                                               ; preds = %21
  %25 = mul nsw i64 %22, 400
  %26 = getelementptr i8, ptr %1, i64 %25
  br i1 %17, label %49, label %27

27:                                               ; preds = %24
  %28 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %23, i64 0
  %29 = getelementptr i8, ptr %26, i64 %10
  br label %30

30:                                               ; preds = %30, %27
  %31 = phi i64 [ 0, %27 ], [ %44, %30 ]
  %32 = phi <4 x i32> [ %28, %27 ], [ %42, %30 ]
  %33 = phi <4 x i32> [ zeroinitializer, %27 ], [ %43, %30 ]
  %34 = getelementptr i8, ptr %29, i64 %31
  %35 = getelementptr i8, ptr %34, i64 4
  %36 = load <4 x i8>, ptr %34, align 1, !tbaa !3
  %37 = load <4 x i8>, ptr %35, align 1, !tbaa !3
  %38 = icmp ne <4 x i8> %36, zeroinitializer
  %39 = icmp ne <4 x i8> %37, zeroinitializer
  %40 = zext <4 x i1> %38 to <4 x i32>
  %41 = zext <4 x i1> %39 to <4 x i32>
  %42 = add <4 x i32> %32, %40
  %43 = add <4 x i32> %33, %41
  %44 = add nuw i64 %31, 8
  %45 = icmp eq i64 %44, %18
  br i1 %45, label %46, label %30, !llvm.loop !6

46:                                               ; preds = %30
  %47 = add <4 x i32> %43, %42
  %48 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %47)
  br i1 %20, label %54, label %49

49:                                               ; preds = %24, %46
  %50 = phi i64 [ %10, %24 ], [ %19, %46 ]
  %51 = phi i32 [ %23, %24 ], [ %48, %46 ]
  br label %59

52:                                               ; preds = %54, %6
  %53 = phi i32 [ 0, %6 ], [ %55, %54 ]
  ret i32 %53

54:                                               ; preds = %59, %46, %21
  %55 = phi i32 [ %23, %21 ], [ %48, %46 ], [ %66, %59 ]
  %56 = add nsw i64 %22, 1
  %57 = trunc i64 %56 to i32
  %58 = icmp eq i32 %13, %57
  br i1 %58, label %52, label %21, !llvm.loop !10

59:                                               ; preds = %49, %59
  %60 = phi i64 [ %67, %59 ], [ %50, %49 ]
  %61 = phi i32 [ %66, %59 ], [ %51, %49 ]
  %62 = getelementptr i8, ptr %26, i64 %60
  %63 = load i8, ptr %62, align 1, !tbaa !3
  %64 = icmp ne i8 %63, 0
  %65 = zext i1 %64 to i32
  %66 = add nsw i32 %61, %65
  %67 = add nsw i64 %60, 1
  %68 = trunc i64 %67 to i32
  %69 = icmp eq i32 %11, %68
  br i1 %69, label %54, label %59, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef signext i8 @_Z10check_ruleic(i32 noundef %0, i8 noundef signext %1) local_unnamed_addr #0 {
  %3 = icmp ne i8 %1, 0
  %4 = add i32 %0, -4
  %5 = icmp ult i32 %4, -2
  %6 = and i1 %3, %5
  %7 = icmp eq i8 %1, 0
  %8 = icmp eq i32 %0, 3
  %9 = and i1 %8, %7
  %10 = select i1 %9, i8 1, i8 %1
  %11 = select i1 %6, i8 0, i8 %10
  ret i8 %11
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local noundef signext i8 @_Z21update_nonborder_celliPc(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #1 {
  %3 = sdiv i32 %0, 500
  %4 = srem i32 %0, 500
  %5 = sext i32 %0 to i64
  %6 = getelementptr inbounds i8, ptr %1, i64 %5
  %7 = load i8, ptr %6, align 1, !tbaa !3
  %8 = add nsw i32 %4, -1
  %9 = add nsw i32 %3, -1
  %10 = sext i32 %8 to i64
  %11 = sext i32 %9 to i64
  %12 = mul nsw i64 %11, 400
  %13 = getelementptr i8, ptr %1, i64 %12
  %14 = getelementptr i8, ptr %13, i64 %10
  %15 = load i8, ptr %14, align 1, !tbaa !3
  %16 = icmp ne i8 %15, 0
  %17 = zext i1 %16 to i32
  %18 = add nsw i64 %10, 1
  %19 = getelementptr i8, ptr %13, i64 %18
  %20 = load i8, ptr %19, align 1, !tbaa !3
  %21 = icmp ne i8 %20, 0
  %22 = zext i1 %21 to i32
  %23 = add nuw nsw i32 %17, %22
  %24 = add nsw i64 %10, 2
  %25 = getelementptr i8, ptr %13, i64 %24
  %26 = load i8, ptr %25, align 1, !tbaa !3
  %27 = icmp ne i8 %26, 0
  %28 = zext i1 %27 to i32
  %29 = add nuw nsw i32 %23, %28
  %30 = mul nsw i64 %11, 400
  %31 = getelementptr i8, ptr %1, i64 %30
  %32 = getelementptr i8, ptr %31, i64 400
  %33 = getelementptr i8, ptr %32, i64 %10
  %34 = load i8, ptr %33, align 1, !tbaa !3
  %35 = icmp ne i8 %34, 0
  %36 = zext i1 %35 to i32
  %37 = add nuw nsw i32 %29, %36
  %38 = getelementptr i8, ptr %32, i64 %18
  %39 = load i8, ptr %38, align 1, !tbaa !3
  %40 = icmp ne i8 %39, 0
  %41 = zext i1 %40 to i32
  %42 = add nuw nsw i32 %37, %41
  %43 = getelementptr i8, ptr %32, i64 %24
  %44 = load i8, ptr %43, align 1, !tbaa !3
  %45 = icmp ne i8 %44, 0
  %46 = zext i1 %45 to i32
  %47 = add nuw nsw i32 %42, %46
  %48 = mul nsw i64 %11, 400
  %49 = getelementptr i8, ptr %1, i64 %48
  %50 = getelementptr i8, ptr %49, i64 800
  %51 = getelementptr i8, ptr %50, i64 %10
  %52 = load i8, ptr %51, align 1, !tbaa !3
  %53 = icmp ne i8 %52, 0
  %54 = zext i1 %53 to i32
  %55 = add nuw nsw i32 %47, %54
  %56 = getelementptr i8, ptr %50, i64 %18
  %57 = load i8, ptr %56, align 1, !tbaa !3
  %58 = icmp ne i8 %57, 0
  %59 = zext i1 %58 to i32
  %60 = add nuw nsw i32 %55, %59
  %61 = getelementptr i8, ptr %50, i64 %24
  %62 = load i8, ptr %61, align 1, !tbaa !3
  %63 = icmp ne i8 %62, 0
  %64 = zext i1 %63 to i32
  %65 = add nuw nsw i32 %60, %64
  %66 = icmp ne i8 %7, 0
  %67 = add nsw i32 %65, -4
  %68 = icmp ult i32 %67, -2
  %69 = and i1 %66, %68
  %70 = icmp eq i8 %7, 0
  %71 = icmp eq i32 %65, 3
  %72 = and i1 %70, %71
  %73 = select i1 %72, i8 1, i8 %7
  %74 = select i1 %69, i8 0, i8 %73
  ret i8 %74
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable
define dso_local void @_Z9set_rangeiPiS_S_S_(i32 noundef %0, ptr nocapture noundef writeonly %1, ptr nocapture noundef writeonly %2, ptr nocapture noundef writeonly %3, ptr nocapture noundef writeonly %4) local_unnamed_addr #3 {
  %6 = sdiv i32 %0, 500
  %7 = srem i32 %0, 500
  %8 = add nsw i32 %7, -1
  store i32 %8, ptr %1, align 4, !tbaa !12
  %9 = add nsw i32 %7, 1
  store i32 %9, ptr %2, align 4, !tbaa !12
  %10 = add nsw i32 %6, -1
  store i32 %10, ptr %3, align 4, !tbaa !12
  %11 = add nsw i32 %6, 1
  store i32 %11, ptr %4, align 4, !tbaa !12
  switch i32 %7, label %14 [
    i32 0, label %12
    i32 499, label %13
  ]

12:                                               ; preds = %5
  store i32 0, ptr %1, align 4, !tbaa !12
  br label %14

13:                                               ; preds = %5
  store i32 499, ptr %2, align 4, !tbaa !12
  br label %14

14:                                               ; preds = %12, %5, %13
  %15 = add i32 %0, 499
  %16 = icmp ult i32 %15, 999
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  store i32 0, ptr %3, align 4, !tbaa !12
  br label %22

18:                                               ; preds = %14
  %19 = add i32 %0, -199500
  %20 = icmp ult i32 %19, 500
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  store i32 399, ptr %4, align 4, !tbaa !12
  br label %22

22:                                               ; preds = %17, %21, %18
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local noundef signext i8 @_Z18update_border_celliPc(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #1 {
  %3 = sext i32 %0 to i64
  %4 = getelementptr inbounds i8, ptr %1, i64 %3
  %5 = load i8, ptr %4, align 1, !tbaa !3
  %6 = sdiv i32 %0, 500
  %7 = srem i32 %0, 500
  %8 = add nsw i32 %7, -1
  %9 = add nsw i32 %7, 1
  %10 = add nsw i32 %6, -1
  %11 = add nsw i32 %6, 1
  switch i32 %7, label %14 [
    i32 0, label %12
    i32 499, label %13
  ]

12:                                               ; preds = %2
  br label %14

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %13, %12, %2
  %15 = phi i32 [ %8, %2 ], [ 498, %13 ], [ 0, %12 ]
  %16 = phi i32 [ %9, %2 ], [ 499, %13 ], [ 1, %12 ]
  %17 = add i32 %0, 499
  %18 = icmp ult i32 %17, 999
  br i1 %18, label %22, label %19

19:                                               ; preds = %14
  %20 = add i32 %0, -199500
  %21 = icmp ult i32 %20, 500
  br i1 %21, label %22, label %26

22:                                               ; preds = %19, %14
  %23 = phi i32 [ 0, %14 ], [ %10, %19 ]
  %24 = phi i32 [ %11, %14 ], [ 399, %19 ]
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %88, label %26

26:                                               ; preds = %19, %22
  %27 = phi i32 [ %24, %22 ], [ %11, %19 ]
  %28 = phi i32 [ %23, %22 ], [ %10, %19 ]
  %29 = icmp sgt i32 %15, %16
  %30 = sext i32 %15 to i64
  %31 = add nsw i32 %16, 1
  %32 = sext i32 %28 to i64
  %33 = add nsw i32 %27, 1
  %34 = sub nsw i32 %16, %15
  %35 = zext i32 %34 to i64
  %36 = add nuw nsw i64 %35, 1
  %37 = icmp ult i32 %34, 7
  %38 = and i64 %36, 8589934584
  %39 = add nsw i64 %38, %30
  %40 = icmp eq i64 %36, %38
  br label %41

41:                                               ; preds = %72, %26
  %42 = phi i64 [ %32, %26 ], [ %74, %72 ]
  %43 = phi i32 [ 0, %26 ], [ %73, %72 ]
  br i1 %29, label %72, label %44

44:                                               ; preds = %41
  %45 = mul nsw i64 %42, 400
  %46 = getelementptr i8, ptr %1, i64 %45
  br i1 %37, label %69, label %47

47:                                               ; preds = %44
  %48 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %43, i64 0
  %49 = getelementptr i8, ptr %46, i64 %30
  br label %50

50:                                               ; preds = %50, %47
  %51 = phi i64 [ 0, %47 ], [ %64, %50 ]
  %52 = phi <4 x i32> [ %48, %47 ], [ %62, %50 ]
  %53 = phi <4 x i32> [ zeroinitializer, %47 ], [ %63, %50 ]
  %54 = getelementptr i8, ptr %49, i64 %51
  %55 = getelementptr i8, ptr %54, i64 4
  %56 = load <4 x i8>, ptr %54, align 1, !tbaa !3
  %57 = load <4 x i8>, ptr %55, align 1, !tbaa !3
  %58 = icmp ne <4 x i8> %56, zeroinitializer
  %59 = icmp ne <4 x i8> %57, zeroinitializer
  %60 = zext <4 x i1> %58 to <4 x i32>
  %61 = zext <4 x i1> %59 to <4 x i32>
  %62 = add <4 x i32> %52, %60
  %63 = add <4 x i32> %53, %61
  %64 = add nuw i64 %51, 8
  %65 = icmp eq i64 %64, %38
  br i1 %65, label %66, label %50, !llvm.loop !14

66:                                               ; preds = %50
  %67 = add <4 x i32> %63, %62
  %68 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %67)
  br i1 %40, label %72, label %69

69:                                               ; preds = %44, %66
  %70 = phi i64 [ %30, %44 ], [ %39, %66 ]
  %71 = phi i32 [ %43, %44 ], [ %68, %66 ]
  br label %77

72:                                               ; preds = %77, %66, %41
  %73 = phi i32 [ %43, %41 ], [ %68, %66 ], [ %84, %77 ]
  %74 = add nsw i64 %42, 1
  %75 = trunc i64 %74 to i32
  %76 = icmp eq i32 %33, %75
  br i1 %76, label %88, label %41, !llvm.loop !10

77:                                               ; preds = %69, %77
  %78 = phi i64 [ %85, %77 ], [ %70, %69 ]
  %79 = phi i32 [ %84, %77 ], [ %71, %69 ]
  %80 = getelementptr i8, ptr %46, i64 %78
  %81 = load i8, ptr %80, align 1, !tbaa !3
  %82 = icmp ne i8 %81, 0
  %83 = zext i1 %82 to i32
  %84 = add nsw i32 %79, %83
  %85 = add nsw i64 %78, 1
  %86 = trunc i64 %85 to i32
  %87 = icmp eq i32 %31, %86
  br i1 %87, label %72, label %77, !llvm.loop !15

88:                                               ; preds = %72, %22
  %89 = phi i32 [ 0, %22 ], [ %73, %72 ]
  %90 = icmp ne i8 %5, 0
  %91 = add i32 %89, -4
  %92 = icmp ult i32 %91, -2
  %93 = and i1 %90, %92
  %94 = icmp eq i8 %5, 0
  %95 = icmp eq i32 %89, 3
  %96 = and i1 %94, %95
  %97 = select i1 %96, i8 1, i8 %5
  %98 = select i1 %93, i8 0, i8 %97
  ret i8 %98
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z8copy_mapPcS_(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #4 {
  %3 = ptrtoint ptr %0 to i64
  %4 = ptrtoint ptr %1 to i64
  %5 = sub i64 %3, %4
  %6 = icmp ult i64 %5, 32
  br i1 %6, label %25, label %7

7:                                                ; preds = %2, %7
  %8 = phi i64 [ %22, %7 ], [ 0, %2 ]
  %9 = getelementptr inbounds i8, ptr %1, i64 %8
  %10 = getelementptr inbounds i8, ptr %9, i64 16
  %11 = load <16 x i8>, ptr %9, align 1, !tbaa !3
  %12 = load <16 x i8>, ptr %10, align 1, !tbaa !3
  %13 = getelementptr inbounds i8, ptr %0, i64 %8
  %14 = getelementptr inbounds i8, ptr %13, i64 16
  store <16 x i8> %11, ptr %13, align 1, !tbaa !3
  store <16 x i8> %12, ptr %14, align 1, !tbaa !3
  %15 = or disjoint i64 %8, 32
  %16 = getelementptr inbounds i8, ptr %1, i64 %15
  %17 = getelementptr inbounds i8, ptr %16, i64 16
  %18 = load <16 x i8>, ptr %16, align 1, !tbaa !3
  %19 = load <16 x i8>, ptr %17, align 1, !tbaa !3
  %20 = getelementptr inbounds i8, ptr %0, i64 %15
  %21 = getelementptr inbounds i8, ptr %20, i64 16
  store <16 x i8> %18, ptr %20, align 1, !tbaa !3
  store <16 x i8> %19, ptr %21, align 1, !tbaa !3
  %22 = add nuw nsw i64 %8, 64
  %23 = icmp eq i64 %22, 200000
  br i1 %23, label %24, label %7, !llvm.loop !16

24:                                               ; preds = %7, %25
  ret void

25:                                               ; preds = %2, %25
  %26 = phi i64 [ %46, %25 ], [ 0, %2 ]
  %27 = getelementptr inbounds i8, ptr %1, i64 %26
  %28 = load i8, ptr %27, align 1, !tbaa !3
  %29 = getelementptr inbounds i8, ptr %0, i64 %26
  store i8 %28, ptr %29, align 1, !tbaa !3
  %30 = add nuw nsw i64 %26, 1
  %31 = getelementptr inbounds i8, ptr %1, i64 %30
  %32 = load i8, ptr %31, align 1, !tbaa !3
  %33 = getelementptr inbounds i8, ptr %0, i64 %30
  store i8 %32, ptr %33, align 1, !tbaa !3
  %34 = add nuw nsw i64 %26, 2
  %35 = getelementptr inbounds i8, ptr %1, i64 %34
  %36 = load i8, ptr %35, align 1, !tbaa !3
  %37 = getelementptr inbounds i8, ptr %0, i64 %34
  store i8 %36, ptr %37, align 1, !tbaa !3
  %38 = add nuw nsw i64 %26, 3
  %39 = getelementptr inbounds i8, ptr %1, i64 %38
  %40 = load i8, ptr %39, align 1, !tbaa !3
  %41 = getelementptr inbounds i8, ptr %0, i64 %38
  store i8 %40, ptr %41, align 1, !tbaa !3
  %42 = add nuw nsw i64 %26, 4
  %43 = getelementptr inbounds i8, ptr %1, i64 %42
  %44 = load i8, ptr %43, align 1, !tbaa !3
  %45 = getelementptr inbounds i8, ptr %0, i64 %42
  store i8 %44, ptr %45, align 1, !tbaa !3
  %46 = add nuw nsw i64 %26, 5
  %47 = icmp eq i64 %46, 200000
  br i1 %47, label %24, label %25, !llvm.loop !17
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z10update_mapPc(ptr nocapture noundef %0) local_unnamed_addr #5 {
  %2 = alloca [200000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 200000, ptr nonnull %2) #10
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(200000) %2, ptr noundef nonnull align 1 dereferenceable(200000) %0, i64 200000, i1 false), !tbaa !3
  br label %4

3:                                                ; preds = %148
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %2) #10
  ret void

4:                                                ; preds = %1, %148
  %5 = phi i64 [ 0, %1 ], [ %163, %148 ]
  %6 = trunc i64 %5 to i32
  %7 = urem i32 %6, 500
  %8 = udiv i32 %6, 500
  switch i32 %7, label %9 [
    i32 0, label %69
    i32 499, label %69
  ]

9:                                                ; preds = %4
  %10 = add nsw i64 %5, -500
  %11 = icmp ult i64 %10, 199000
  br i1 %11, label %12, label %69

12:                                               ; preds = %9
  %13 = udiv i32 %6, 500
  %14 = getelementptr inbounds i8, ptr %2, i64 %5
  %15 = load i8, ptr %14, align 1, !tbaa !3
  %16 = add nsw i32 %7, -1
  %17 = sext i32 %16 to i64
  %18 = mul nuw nsw i32 %13, 400
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr i8, ptr %2, i64 %19
  %21 = getelementptr i8, ptr %20, i64 -400
  %22 = getelementptr i8, ptr %21, i64 %17
  %23 = load i8, ptr %22, align 1, !tbaa !3
  %24 = icmp ne i8 %23, 0
  %25 = zext i1 %24 to i32
  %26 = add nsw i64 %17, 1
  %27 = getelementptr i8, ptr %21, i64 %26
  %28 = load i8, ptr %27, align 1, !tbaa !3
  %29 = icmp ne i8 %28, 0
  %30 = zext i1 %29 to i32
  %31 = add nuw nsw i32 %30, %25
  %32 = add nsw i64 %17, 2
  %33 = getelementptr i8, ptr %21, i64 %32
  %34 = load i8, ptr %33, align 1, !tbaa !3
  %35 = icmp ne i8 %34, 0
  %36 = zext i1 %35 to i32
  %37 = add nuw nsw i32 %31, %36
  %38 = getelementptr i8, ptr %20, i64 %17
  %39 = load i8, ptr %38, align 1, !tbaa !3
  %40 = icmp ne i8 %39, 0
  %41 = zext i1 %40 to i32
  %42 = add nuw nsw i32 %37, %41
  %43 = getelementptr i8, ptr %20, i64 %26
  %44 = load i8, ptr %43, align 1, !tbaa !3
  %45 = icmp ne i8 %44, 0
  %46 = zext i1 %45 to i32
  %47 = add nuw nsw i32 %42, %46
  %48 = getelementptr i8, ptr %20, i64 %32
  %49 = load i8, ptr %48, align 1, !tbaa !3
  %50 = icmp ne i8 %49, 0
  %51 = zext i1 %50 to i32
  %52 = add nuw nsw i32 %47, %51
  %53 = getelementptr i8, ptr %20, i64 400
  %54 = getelementptr i8, ptr %53, i64 %17
  %55 = load i8, ptr %54, align 1, !tbaa !3
  %56 = icmp ne i8 %55, 0
  %57 = zext i1 %56 to i32
  %58 = add nuw nsw i32 %52, %57
  %59 = getelementptr i8, ptr %53, i64 %26
  %60 = load i8, ptr %59, align 1, !tbaa !3
  %61 = icmp ne i8 %60, 0
  %62 = zext i1 %61 to i32
  %63 = add nuw nsw i32 %58, %62
  %64 = getelementptr i8, ptr %53, i64 %32
  %65 = load i8, ptr %64, align 1, !tbaa !3
  %66 = icmp ne i8 %65, 0
  %67 = zext i1 %66 to i32
  %68 = add nuw nsw i32 %63, %67
  br label %148

69:                                               ; preds = %4, %4, %9
  %70 = getelementptr inbounds i8, ptr %2, i64 %5
  %71 = load i8, ptr %70, align 1, !tbaa !3
  %72 = udiv i32 %6, 500
  %73 = add nsw i32 %7, -1
  %74 = add nuw nsw i32 %7, 1
  %75 = add nsw i32 %72, -1
  %76 = add nuw nsw i32 %72, 1
  switch i32 %7, label %79 [
    i32 0, label %77
    i32 499, label %78
  ]

77:                                               ; preds = %69
  br label %79

78:                                               ; preds = %69
  br label %79

79:                                               ; preds = %78, %77, %69
  %80 = phi i32 [ %73, %69 ], [ 498, %78 ], [ 0, %77 ]
  %81 = phi i32 [ %74, %69 ], [ 499, %78 ], [ 1, %77 ]
  %82 = icmp ult i64 %5, 500
  %83 = trunc i64 %5 to i32
  %84 = add i32 %83, -199500
  %85 = icmp ult i32 %84, 500
  %86 = select i1 %85, i32 399, i32 %76
  %87 = select i1 %82, i32 %76, i32 %86
  %88 = sext i32 %75 to i64
  %89 = icmp sgt i32 %80, %81
  %90 = sext i32 %80 to i64
  %91 = add nuw nsw i32 %81, 1
  %92 = select i1 %82, i64 0, i64 %88
  %93 = add nuw nsw i32 %87, 1
  %94 = sub nsw i32 %81, %80
  %95 = zext i32 %94 to i64
  %96 = add nuw nsw i64 %95, 1
  %97 = icmp ult i32 %94, 7
  %98 = and i64 %96, 8589934584
  %99 = add nsw i64 %98, %90
  %100 = icmp eq i64 %96, %98
  br label %101

101:                                              ; preds = %132, %79
  %102 = phi i64 [ %92, %79 ], [ %134, %132 ]
  %103 = phi i32 [ 0, %79 ], [ %133, %132 ]
  br i1 %89, label %132, label %104

104:                                              ; preds = %101
  %105 = mul nsw i64 %102, 400
  %106 = getelementptr i8, ptr %2, i64 %105
  br i1 %97, label %129, label %107

107:                                              ; preds = %104
  %108 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %103, i64 0
  %109 = getelementptr i8, ptr %106, i64 %90
  br label %110

110:                                              ; preds = %110, %107
  %111 = phi i64 [ 0, %107 ], [ %124, %110 ]
  %112 = phi <4 x i32> [ %108, %107 ], [ %122, %110 ]
  %113 = phi <4 x i32> [ zeroinitializer, %107 ], [ %123, %110 ]
  %114 = getelementptr i8, ptr %109, i64 %111
  %115 = getelementptr i8, ptr %114, i64 4
  %116 = load <4 x i8>, ptr %114, align 1, !tbaa !3
  %117 = load <4 x i8>, ptr %115, align 1, !tbaa !3
  %118 = icmp ne <4 x i8> %116, zeroinitializer
  %119 = icmp ne <4 x i8> %117, zeroinitializer
  %120 = zext <4 x i1> %118 to <4 x i32>
  %121 = zext <4 x i1> %119 to <4 x i32>
  %122 = add <4 x i32> %112, %120
  %123 = add <4 x i32> %113, %121
  %124 = add nuw i64 %111, 8
  %125 = icmp eq i64 %124, %98
  br i1 %125, label %126, label %110, !llvm.loop !18

126:                                              ; preds = %110
  %127 = add <4 x i32> %123, %122
  %128 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %127)
  br i1 %100, label %132, label %129

129:                                              ; preds = %104, %126
  %130 = phi i64 [ %90, %104 ], [ %99, %126 ]
  %131 = phi i32 [ %103, %104 ], [ %128, %126 ]
  br label %137

132:                                              ; preds = %137, %126, %101
  %133 = phi i32 [ %103, %101 ], [ %128, %126 ], [ %144, %137 ]
  %134 = add nsw i64 %102, 1
  %135 = trunc i64 %134 to i32
  %136 = icmp eq i32 %93, %135
  br i1 %136, label %148, label %101, !llvm.loop !10

137:                                              ; preds = %129, %137
  %138 = phi i64 [ %145, %137 ], [ %130, %129 ]
  %139 = phi i32 [ %144, %137 ], [ %131, %129 ]
  %140 = getelementptr i8, ptr %106, i64 %138
  %141 = load i8, ptr %140, align 1, !tbaa !3
  %142 = icmp ne i8 %141, 0
  %143 = zext i1 %142 to i32
  %144 = add nsw i32 %139, %143
  %145 = add nsw i64 %138, 1
  %146 = trunc i64 %145 to i32
  %147 = icmp eq i32 %91, %146
  br i1 %147, label %132, label %137, !llvm.loop !19

148:                                              ; preds = %132, %12
  %149 = phi i8 [ %15, %12 ], [ %71, %132 ]
  %150 = phi i32 [ %68, %12 ], [ %133, %132 ]
  %151 = icmp ne i8 %149, 0
  %152 = add i32 %150, -4
  %153 = icmp ult i32 %152, -2
  %154 = and i1 %151, %153
  %155 = icmp eq i8 %149, 0
  %156 = icmp eq i32 %150, 3
  %157 = and i1 %155, %156
  %158 = select i1 %157, i8 1, i8 %149
  %159 = select i1 %154, i8 0, i8 %158
  %160 = getelementptr inbounds i8, ptr %0, i64 %5
  store i8 %159, ptr %160, align 1, !tbaa !3
  %161 = icmp eq i8 %159, 0
  %162 = select i1 %161, i32 0, i32 255
  tail call void @set_pixel(i32 noundef %8, i32 noundef %7, i32 noundef %162, i32 noundef 0, i32 noundef 0)
  %163 = add nuw nsw i64 %5, 1
  %164 = icmp eq i64 %163, 200000
  br i1 %164, label %3, label %4, !llvm.loop !20
}

declare dso_local void @set_pixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z3appv() local_unnamed_addr #5 {
  %1 = alloca [200000 x i8], align 16
  tail call void @create_window()
  call void @llvm.lifetime.start.p0(i64 200000, ptr nonnull %1) #10
  call void @generate_char_field(ptr noundef nonnull %1)
  br label %3

2:                                                ; preds = %3
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %1) #10
  ret void

3:                                                ; preds = %0, %3
  %4 = phi i32 [ 0, %0 ], [ %6, %3 ]
  call void @_Z10update_mapPc(ptr noundef nonnull %1)
  %5 = call i32 @update_window()
  %6 = add nuw nsw i32 %4, 1
  %7 = icmp eq i32 %6, 100000
  br i1 %7, label %2, label %3, !llvm.loop !21
}

declare dso_local void @create_window() local_unnamed_addr #6

declare dso_local void @generate_char_field(ptr noundef) local_unnamed_addr #6

declare dso_local i32 @update_window() local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #7 {
  %1 = alloca [200000 x i8], align 16
  tail call void @create_window()
  call void @llvm.lifetime.start.p0(i64 200000, ptr nonnull %1) #10
  call void @generate_char_field(ptr noundef nonnull %1)
  br label %2

2:                                                ; preds = %2, %0
  %3 = phi i32 [ 0, %0 ], [ %5, %2 ]
  call void @_Z10update_mapPc(ptr noundef nonnull %1)
  %4 = call i32 @update_window()
  %5 = add nuw nsw i32 %3, 1
  %6 = icmp eq i32 %5, 100000
  br i1 %6, label %7, label %2, !llvm.loop !21

7:                                                ; preds = %2
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %1) #10
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 18.1.8 (Fedora 18.1.8-1.fc40)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = distinct !{!6, !7, !8, !9}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7, !9, !8}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !4, i64 0}
!14 = distinct !{!14, !7, !8, !9}
!15 = distinct !{!15, !7, !9, !8}
!16 = distinct !{!16, !7, !8, !9}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8, !9}
!19 = distinct !{!19, !7, !9, !8}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
