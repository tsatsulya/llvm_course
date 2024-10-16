; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef signext i8 @is_border(i32 noundef %0) local_unnamed_addr #0 {
  %2 = srem i32 %0, 25
  switch i32 %2, label %3 [
    i32 0, label %10
    i32 24, label %10
  ]

3:                                                ; preds = %1
  %4 = add i32 %0, 24
  %5 = icmp ult i32 %4, 49
  %6 = add i32 %0, -975
  %7 = icmp ult i32 %6, 25
  %8 = or i1 %5, %7
  %9 = zext i1 %8 to i8
  br label %10

10:                                               ; preds = %3, %1, %1
  %11 = phi i8 [ 1, %1 ], [ 1, %1 ], [ %9, %3 ]
  ret i8 %11
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local i32 @get_neighbours_amount(i32 noundef %0, ptr nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) local_unnamed_addr #1 {
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
  %25 = mul nsw i64 %22, 40
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
define dso_local noundef signext i8 @check_rule(i32 noundef %0, i8 noundef signext %1) local_unnamed_addr #0 {
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
define dso_local signext i8 @update_nonborder_cell(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #3 {
  %3 = sdiv i32 %0, 25
  %4 = srem i32 %0, 25
  %5 = sext i32 %0 to i64
  %6 = getelementptr inbounds i8, ptr %1, i64 %5
  %7 = load i8, ptr %6, align 1, !tbaa !3
  %8 = add nsw i32 %4, -1
  %9 = add nsw i32 %3, -1
  %10 = sext i32 %8 to i64
  %11 = sext i32 %9 to i64
  %12 = mul nsw i64 %11, 40
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
  %30 = mul nsw i64 %11, 40
  %31 = getelementptr i8, ptr %1, i64 %30
  %32 = getelementptr i8, ptr %31, i64 40
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
  %48 = mul nsw i64 %11, 40
  %49 = getelementptr i8, ptr %1, i64 %48
  %50 = getelementptr i8, ptr %49, i64 80
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
define dso_local void @set_range(i32 noundef %0, ptr nocapture noundef writeonly %1, ptr nocapture noundef writeonly %2, ptr nocapture noundef writeonly %3, ptr nocapture noundef writeonly %4) local_unnamed_addr #4 {
  %6 = sdiv i32 %0, 25
  %7 = srem i32 %0, 25
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
    i32 24, label %13
  ]

12:                                               ; preds = %5
  store i32 0, ptr %1, align 4, !tbaa !12
  br label %14

13:                                               ; preds = %5
  store i32 24, ptr %2, align 4, !tbaa !12
  br label %14

14:                                               ; preds = %12, %5, %13
  %15 = add i32 %0, 24
  %16 = icmp ult i32 %15, 49
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  store i32 0, ptr %3, align 4, !tbaa !12
  br label %22

18:                                               ; preds = %14
  %19 = add i32 %0, -975
  %20 = icmp ult i32 %19, 25
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  store i32 39, ptr %4, align 4, !tbaa !12
  br label %22

22:                                               ; preds = %17, %21, %18
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local signext i8 @update_border_cell(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #1 {
  %3 = sext i32 %0 to i64
  %4 = getelementptr inbounds i8, ptr %1, i64 %3
  %5 = load i8, ptr %4, align 1, !tbaa !3
  %6 = sdiv i32 %0, 25
  %7 = srem i32 %0, 25
  %8 = add nsw i32 %7, -1
  %9 = add nsw i32 %7, 1
  %10 = add nsw i32 %6, -1
  %11 = add nsw i32 %6, 1
  switch i32 %7, label %14 [
    i32 0, label %12
    i32 24, label %13
  ]

12:                                               ; preds = %2
  br label %14

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %13, %12, %2
  %15 = phi i32 [ %8, %2 ], [ 23, %13 ], [ 0, %12 ]
  %16 = phi i32 [ %9, %2 ], [ 24, %13 ], [ 1, %12 ]
  %17 = add i32 %0, 24
  %18 = icmp ult i32 %17, 49
  br i1 %18, label %22, label %19

19:                                               ; preds = %14
  %20 = add i32 %0, -975
  %21 = icmp ult i32 %20, 25
  br i1 %21, label %22, label %26

22:                                               ; preds = %19, %14
  %23 = phi i32 [ 0, %14 ], [ %10, %19 ]
  %24 = phi i32 [ %11, %14 ], [ 39, %19 ]
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
  %45 = mul nsw i64 %42, 40
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

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @copy_map(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #5 {
  %3 = ptrtoint ptr %0 to i64
  %4 = ptrtoint ptr %1 to i64
  %5 = sub i64 %3, %4
  %6 = icmp ult i64 %5, 32
  br i1 %6, label %44, label %7

7:                                                ; preds = %2, %31
  %8 = phi i64 [ %38, %31 ], [ 0, %2 ]
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
  %22 = or disjoint i64 %8, 64
  %23 = getelementptr inbounds i8, ptr %1, i64 %22
  %24 = getelementptr inbounds i8, ptr %23, i64 16
  %25 = load <16 x i8>, ptr %23, align 1, !tbaa !3
  %26 = load <16 x i8>, ptr %24, align 1, !tbaa !3
  %27 = getelementptr inbounds i8, ptr %0, i64 %22
  %28 = getelementptr inbounds i8, ptr %27, i64 16
  store <16 x i8> %25, ptr %27, align 1, !tbaa !3
  store <16 x i8> %26, ptr %28, align 1, !tbaa !3
  %29 = or disjoint i64 %8, 96
  %30 = icmp eq i64 %29, 992
  br i1 %30, label %39, label %31, !llvm.loop !16

31:                                               ; preds = %7
  %32 = getelementptr inbounds i8, ptr %1, i64 %29
  %33 = getelementptr inbounds i8, ptr %32, i64 16
  %34 = load <16 x i8>, ptr %32, align 1, !tbaa !3
  %35 = load <16 x i8>, ptr %33, align 1, !tbaa !3
  %36 = getelementptr inbounds i8, ptr %0, i64 %29
  %37 = getelementptr inbounds i8, ptr %36, i64 16
  store <16 x i8> %34, ptr %36, align 1, !tbaa !3
  store <16 x i8> %35, ptr %37, align 1, !tbaa !3
  %38 = add nuw nsw i64 %8, 128
  br label %7

39:                                               ; preds = %7
  %40 = getelementptr inbounds i8, ptr %1, i64 992
  %41 = load <8 x i8>, ptr %40, align 1, !tbaa !3
  %42 = getelementptr inbounds i8, ptr %0, i64 992
  store <8 x i8> %41, ptr %42, align 1, !tbaa !3
  br label %43

43:                                               ; preds = %44, %39
  ret void

44:                                               ; preds = %2, %44
  %45 = phi i64 [ %65, %44 ], [ 0, %2 ]
  %46 = getelementptr inbounds i8, ptr %1, i64 %45
  %47 = load i8, ptr %46, align 1, !tbaa !3
  %48 = getelementptr inbounds i8, ptr %0, i64 %45
  store i8 %47, ptr %48, align 1, !tbaa !3
  %49 = add nuw nsw i64 %45, 1
  %50 = getelementptr inbounds i8, ptr %1, i64 %49
  %51 = load i8, ptr %50, align 1, !tbaa !3
  %52 = getelementptr inbounds i8, ptr %0, i64 %49
  store i8 %51, ptr %52, align 1, !tbaa !3
  %53 = add nuw nsw i64 %45, 2
  %54 = getelementptr inbounds i8, ptr %1, i64 %53
  %55 = load i8, ptr %54, align 1, !tbaa !3
  %56 = getelementptr inbounds i8, ptr %0, i64 %53
  store i8 %55, ptr %56, align 1, !tbaa !3
  %57 = add nuw nsw i64 %45, 3
  %58 = getelementptr inbounds i8, ptr %1, i64 %57
  %59 = load i8, ptr %58, align 1, !tbaa !3
  %60 = getelementptr inbounds i8, ptr %0, i64 %57
  store i8 %59, ptr %60, align 1, !tbaa !3
  %61 = add nuw nsw i64 %45, 4
  %62 = getelementptr inbounds i8, ptr %1, i64 %61
  %63 = load i8, ptr %62, align 1, !tbaa !3
  %64 = getelementptr inbounds i8, ptr %0, i64 %61
  store i8 %63, ptr %64, align 1, !tbaa !3
  %65 = add nuw nsw i64 %45, 5
  %66 = icmp eq i64 %65, 1000
  br i1 %66, label %43, label %44, !llvm.loop !17
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @update_map(ptr nocapture noundef %0) local_unnamed_addr #5 {
  %2 = alloca [1000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %2) #10
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(1000) %2, ptr noundef nonnull align 1 dereferenceable(1000) %0, i64 1000, i1 false), !tbaa !3
  br label %4

3:                                                ; preds = %149
  call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %2) #10
  ret void

4:                                                ; preds = %1, %149
  %5 = phi i64 [ 0, %1 ], [ %162, %149 ]
  %6 = trunc i64 %5 to i16
  %7 = urem i16 %6, 25
  %8 = udiv i16 %6, 25
  %9 = zext nneg i16 %7 to i32
  switch i16 %7, label %10 [
    i16 0, label %70
    i16 24, label %70
  ]

10:                                               ; preds = %4
  %11 = add nsw i64 %5, -25
  %12 = icmp ult i64 %11, 950
  br i1 %12, label %13, label %70

13:                                               ; preds = %10
  %14 = udiv i16 %6, 25
  %15 = getelementptr inbounds i8, ptr %2, i64 %5
  %16 = load i8, ptr %15, align 1, !tbaa !3
  %17 = add nsw i32 %9, -1
  %18 = sext i32 %17 to i64
  %19 = mul nuw nsw i16 %14, 40
  %20 = zext nneg i16 %19 to i64
  %21 = getelementptr i8, ptr %2, i64 %20
  %22 = getelementptr i8, ptr %21, i64 -40
  %23 = getelementptr i8, ptr %22, i64 %18
  %24 = load i8, ptr %23, align 1, !tbaa !3
  %25 = icmp ne i8 %24, 0
  %26 = zext i1 %25 to i32
  %27 = add nsw i64 %18, 1
  %28 = getelementptr i8, ptr %22, i64 %27
  %29 = load i8, ptr %28, align 1, !tbaa !3
  %30 = icmp ne i8 %29, 0
  %31 = zext i1 %30 to i32
  %32 = add nuw nsw i32 %31, %26
  %33 = add nsw i64 %18, 2
  %34 = getelementptr i8, ptr %22, i64 %33
  %35 = load i8, ptr %34, align 1, !tbaa !3
  %36 = icmp ne i8 %35, 0
  %37 = zext i1 %36 to i32
  %38 = add nuw nsw i32 %32, %37
  %39 = getelementptr i8, ptr %21, i64 %18
  %40 = load i8, ptr %39, align 1, !tbaa !3
  %41 = icmp ne i8 %40, 0
  %42 = zext i1 %41 to i32
  %43 = add nuw nsw i32 %38, %42
  %44 = getelementptr i8, ptr %21, i64 %27
  %45 = load i8, ptr %44, align 1, !tbaa !3
  %46 = icmp ne i8 %45, 0
  %47 = zext i1 %46 to i32
  %48 = add nuw nsw i32 %43, %47
  %49 = getelementptr i8, ptr %21, i64 %33
  %50 = load i8, ptr %49, align 1, !tbaa !3
  %51 = icmp ne i8 %50, 0
  %52 = zext i1 %51 to i32
  %53 = add nuw nsw i32 %48, %52
  %54 = getelementptr i8, ptr %21, i64 40
  %55 = getelementptr i8, ptr %54, i64 %18
  %56 = load i8, ptr %55, align 1, !tbaa !3
  %57 = icmp ne i8 %56, 0
  %58 = zext i1 %57 to i32
  %59 = add nuw nsw i32 %53, %58
  %60 = getelementptr i8, ptr %54, i64 %27
  %61 = load i8, ptr %60, align 1, !tbaa !3
  %62 = icmp ne i8 %61, 0
  %63 = zext i1 %62 to i32
  %64 = add nuw nsw i32 %59, %63
  %65 = getelementptr i8, ptr %54, i64 %33
  %66 = load i8, ptr %65, align 1, !tbaa !3
  %67 = icmp ne i8 %66, 0
  %68 = zext i1 %67 to i32
  %69 = add nuw nsw i32 %64, %68
  br label %149

70:                                               ; preds = %4, %4, %10
  %71 = getelementptr inbounds i8, ptr %2, i64 %5
  %72 = load i8, ptr %71, align 1, !tbaa !3
  %73 = zext nneg i16 %8 to i32
  %74 = add nsw i32 %9, -1
  %75 = add nuw nsw i32 %9, 1
  %76 = add nsw i32 %73, -1
  %77 = add nuw nsw i32 %73, 1
  switch i16 %7, label %80 [
    i16 0, label %78
    i16 24, label %79
  ]

78:                                               ; preds = %70
  br label %80

79:                                               ; preds = %70
  br label %80

80:                                               ; preds = %79, %78, %70
  %81 = phi i32 [ %74, %70 ], [ 23, %79 ], [ 0, %78 ]
  %82 = phi i32 [ %75, %70 ], [ 24, %79 ], [ 1, %78 ]
  %83 = icmp ult i64 %5, 25
  %84 = trunc i64 %5 to i32
  %85 = add i32 %84, -975
  %86 = icmp ult i32 %85, 25
  %87 = select i1 %86, i32 39, i32 %77
  %88 = select i1 %83, i32 %77, i32 %87
  %89 = sext i32 %76 to i64
  %90 = icmp sgt i32 %81, %82
  %91 = sext i32 %81 to i64
  %92 = add nuw nsw i32 %82, 1
  %93 = select i1 %83, i64 0, i64 %89
  %94 = add nuw nsw i32 %88, 1
  %95 = sub nsw i32 %82, %81
  %96 = zext i32 %95 to i64
  %97 = add nuw nsw i64 %96, 1
  %98 = icmp ult i32 %95, 7
  %99 = and i64 %97, 8589934584
  %100 = add nsw i64 %99, %91
  %101 = icmp eq i64 %97, %99
  br label %102

102:                                              ; preds = %133, %80
  %103 = phi i64 [ %93, %80 ], [ %135, %133 ]
  %104 = phi i32 [ 0, %80 ], [ %134, %133 ]
  br i1 %90, label %133, label %105

105:                                              ; preds = %102
  %106 = mul nsw i64 %103, 40
  %107 = getelementptr i8, ptr %2, i64 %106
  br i1 %98, label %130, label %108

108:                                              ; preds = %105
  %109 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %104, i64 0
  %110 = getelementptr i8, ptr %107, i64 %91
  br label %111

111:                                              ; preds = %111, %108
  %112 = phi i64 [ 0, %108 ], [ %125, %111 ]
  %113 = phi <4 x i32> [ %109, %108 ], [ %123, %111 ]
  %114 = phi <4 x i32> [ zeroinitializer, %108 ], [ %124, %111 ]
  %115 = getelementptr i8, ptr %110, i64 %112
  %116 = getelementptr i8, ptr %115, i64 4
  %117 = load <4 x i8>, ptr %115, align 1, !tbaa !3
  %118 = load <4 x i8>, ptr %116, align 1, !tbaa !3
  %119 = icmp ne <4 x i8> %117, zeroinitializer
  %120 = icmp ne <4 x i8> %118, zeroinitializer
  %121 = zext <4 x i1> %119 to <4 x i32>
  %122 = zext <4 x i1> %120 to <4 x i32>
  %123 = add <4 x i32> %113, %121
  %124 = add <4 x i32> %114, %122
  %125 = add nuw i64 %112, 8
  %126 = icmp eq i64 %125, %99
  br i1 %126, label %127, label %111, !llvm.loop !18

127:                                              ; preds = %111
  %128 = add <4 x i32> %124, %123
  %129 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %128)
  br i1 %101, label %133, label %130

130:                                              ; preds = %105, %127
  %131 = phi i64 [ %91, %105 ], [ %100, %127 ]
  %132 = phi i32 [ %104, %105 ], [ %129, %127 ]
  br label %138

133:                                              ; preds = %138, %127, %102
  %134 = phi i32 [ %104, %102 ], [ %129, %127 ], [ %145, %138 ]
  %135 = add nsw i64 %103, 1
  %136 = trunc i64 %135 to i32
  %137 = icmp eq i32 %94, %136
  br i1 %137, label %149, label %102, !llvm.loop !10

138:                                              ; preds = %130, %138
  %139 = phi i64 [ %146, %138 ], [ %131, %130 ]
  %140 = phi i32 [ %145, %138 ], [ %132, %130 ]
  %141 = getelementptr i8, ptr %107, i64 %139
  %142 = load i8, ptr %141, align 1, !tbaa !3
  %143 = icmp ne i8 %142, 0
  %144 = zext i1 %143 to i32
  %145 = add nsw i32 %140, %144
  %146 = add nsw i64 %139, 1
  %147 = trunc i64 %146 to i32
  %148 = icmp eq i32 %92, %147
  br i1 %148, label %133, label %138, !llvm.loop !19

149:                                              ; preds = %133, %13
  %150 = phi i8 [ %16, %13 ], [ %72, %133 ]
  %151 = phi i32 [ %69, %13 ], [ %134, %133 ]
  %152 = icmp ne i8 %150, 0
  %153 = add i32 %151, -4
  %154 = icmp ult i32 %153, -2
  %155 = and i1 %152, %154
  %156 = icmp eq i8 %150, 0
  %157 = icmp eq i32 %151, 3
  %158 = and i1 %156, %157
  %159 = select i1 %158, i8 1, i8 %150
  %160 = select i1 %155, i8 0, i8 %159
  %161 = getelementptr inbounds i8, ptr %0, i64 %5
  store i8 %160, ptr %161, align 1, !tbaa !3
  %162 = add nuw nsw i64 %5, 1
  %163 = icmp eq i64 %162, 1000
  br i1 %163, label %3, label %4, !llvm.loop !20
}

; Function Attrs: nounwind uwtable
define dso_local void @app_() local_unnamed_addr #6 {
  %1 = alloca [1000 x i8], align 16
  tail call void (...) @simInit() #10
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %1) #10
  %2 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 14
  store i8 1, ptr %2, align 2, !tbaa !3
  br label %3

3:                                                ; preds = %0, %6
  %4 = phi i32 [ 0, %0 ], [ %7, %6 ]
  br label %9

5:                                                ; preds = %6
  tail call void (...) @simExit() #10
  call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %1) #10
  ret void

6:                                                ; preds = %9
  tail call void (...) @simFlush() #10
  call void @update_map(ptr noundef nonnull %1)
  %7 = add nuw nsw i32 %4, 1
  %8 = icmp eq i32 %7, 10
  br i1 %8, label %5, label %3, !llvm.loop !21

9:                                                ; preds = %3, %9
  %10 = phi i64 [ 0, %3 ], [ %20, %9 ]
  %11 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 %10
  %12 = load i8, ptr %11, align 1, !tbaa !3
  %13 = icmp eq i8 %12, 0
  %14 = trunc i64 %10 to i16
  %15 = udiv i16 %14, 25
  %16 = zext nneg i16 %15 to i32
  %17 = urem i16 %14, 25
  %18 = zext nneg i16 %17 to i32
  %19 = select i1 %13, i32 -1, i32 -16777216
  tail call void @simPutDisplayPixel(i32 noundef %16, i32 noundef %18, i32 noundef %19, i32 noundef 40) #10
  %20 = add nuw nsw i64 %10, 1
  %21 = icmp eq i64 %20, 1000
  br i1 %21, label %6, label %9, !llvm.loop !22
}

declare dso_local void @simInit(...) local_unnamed_addr #7

declare dso_local void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #7

declare dso_local void @simFlush(...) local_unnamed_addr #7

declare dso_local void @simExit(...) local_unnamed_addr #7

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!5 = !{!"Simple C/C++ TBAA"}
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
!22 = distinct !{!22, !7}
