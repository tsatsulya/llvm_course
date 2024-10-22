; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [1000 x i8], align 16
  %2 = alloca [1000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %2) #4
  %3 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 14
  store i8 1, ptr %3, align 2, !tbaa !3
  br label %4

4:                                                ; preds = %0, %112
  %5 = phi i32 [ 0, %0 ], [ %113, %112 ]
  br label %115

6:                                                ; preds = %112
  call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %2) #4
  ret void

7:                                                ; preds = %115
  tail call void (...) @simFlush() #4
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %1) #4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(1000) %1, ptr noundef nonnull align 16 dereferenceable(1000) %2, i64 1000, i1 false), !tbaa !3
  br label %8

8:                                                ; preds = %97, %7
  %9 = phi i64 [ 0, %7 ], [ %110, %97 ]
  %10 = trunc i64 %9 to i32
  %11 = urem i32 %10, 25
  %12 = udiv i32 %10, 25
  switch i32 %11, label %13 [
    i32 0, label %19
    i32 24, label %19
  ]

13:                                               ; preds = %8
  %14 = icmp ult i64 %9, 25
  %15 = add i32 %10, -975
  %16 = icmp ult i32 %15, 25
  %17 = or i1 %14, %16
  %18 = zext i1 %17 to i8
  br label %19

19:                                               ; preds = %13, %8, %8
  %20 = phi i8 [ 1, %8 ], [ 1, %8 ], [ %18, %13 ]
  %21 = icmp eq i8 %20, 0
  %22 = add nsw i32 %11, -1
  br i1 %21, label %23, label %52

23:                                               ; preds = %19
  %24 = udiv i32 %10, 25
  %25 = getelementptr inbounds i8, ptr %1, i64 %9
  %26 = load i8, ptr %25, align 1, !tbaa !3
  %27 = add nsw i32 %24, -1
  %28 = sext i32 %22 to i64
  %29 = add nuw nsw i32 %11, 2
  %30 = sext i32 %27 to i64
  %31 = add nuw nsw i32 %24, 2
  %32 = zext nneg i32 %31 to i64
  %33 = zext nneg i32 %29 to i64
  br label %34

34:                                               ; preds = %39, %23
  %35 = phi i64 [ %30, %23 ], [ %40, %39 ]
  %36 = phi i32 [ 0, %23 ], [ %49, %39 ]
  %37 = mul nsw i64 %35, 40
  %38 = getelementptr i8, ptr %1, i64 %37
  br label %42

39:                                               ; preds = %42
  %40 = add nsw i64 %35, 1
  %41 = icmp eq i64 %40, %32
  br i1 %41, label %97, label %34, !llvm.loop !6

42:                                               ; preds = %42, %34
  %43 = phi i64 [ %28, %34 ], [ %50, %42 ]
  %44 = phi i32 [ %36, %34 ], [ %49, %42 ]
  %45 = getelementptr i8, ptr %38, i64 %43
  %46 = load i8, ptr %45, align 1, !tbaa !3
  %47 = icmp ne i8 %46, 0
  %48 = zext i1 %47 to i32
  %49 = add nsw i32 %44, %48
  %50 = add nsw i64 %43, 1
  %51 = icmp eq i64 %50, %33
  br i1 %51, label %39, label %42, !llvm.loop !9

52:                                               ; preds = %19
  %53 = getelementptr inbounds i8, ptr %1, i64 %9
  %54 = load i8, ptr %53, align 1, !tbaa !3
  %55 = add nuw nsw i32 %11, 1
  %56 = add nsw i32 %12, -1
  %57 = add nuw nsw i32 %12, 1
  switch i32 %11, label %60 [
    i32 0, label %58
    i32 24, label %59
  ]

58:                                               ; preds = %52
  br label %60

59:                                               ; preds = %52
  br label %60

60:                                               ; preds = %59, %58, %52
  %61 = phi i32 [ %22, %52 ], [ %22, %59 ], [ 0, %58 ]
  %62 = phi i32 [ %55, %52 ], [ 24, %59 ], [ %55, %58 ]
  %63 = icmp ult i64 %9, 25
  %64 = select i1 %63, i32 0, i32 %56
  %65 = add i32 %10, -975
  %66 = icmp ult i32 %65, 25
  %67 = select i1 %66, i32 39, i32 %57
  %68 = icmp sgt i32 %64, %67
  br i1 %68, label %97, label %69

69:                                               ; preds = %60
  %70 = icmp sgt i32 %61, %62
  %71 = sext i32 %61 to i64
  %72 = add nsw i32 %62, 1
  %73 = sext i32 %64 to i64
  %74 = add nuw nsw i32 %67, 1
  br label %75

75:                                               ; preds = %81, %69
  %76 = phi i64 [ %73, %69 ], [ %83, %81 ]
  %77 = phi i32 [ 0, %69 ], [ %82, %81 ]
  br i1 %70, label %81, label %78

78:                                               ; preds = %75
  %79 = mul nsw i64 %76, 40
  %80 = getelementptr i8, ptr %1, i64 %79
  br label %86

81:                                               ; preds = %86, %75
  %82 = phi i32 [ %77, %75 ], [ %93, %86 ]
  %83 = add nsw i64 %76, 1
  %84 = trunc i64 %83 to i32
  %85 = icmp eq i32 %74, %84
  br i1 %85, label %97, label %75, !llvm.loop !6

86:                                               ; preds = %86, %78
  %87 = phi i64 [ %71, %78 ], [ %94, %86 ]
  %88 = phi i32 [ %77, %78 ], [ %93, %86 ]
  %89 = getelementptr i8, ptr %80, i64 %87
  %90 = load i8, ptr %89, align 1, !tbaa !3
  %91 = icmp ne i8 %90, 0
  %92 = zext i1 %91 to i32
  %93 = add nsw i32 %88, %92
  %94 = add nsw i64 %87, 1
  %95 = trunc i64 %94 to i32
  %96 = icmp eq i32 %72, %95
  br i1 %96, label %81, label %86, !llvm.loop !9

97:                                               ; preds = %81, %39, %60
  %98 = phi i8 [ %54, %60 ], [ %26, %39 ], [ %54, %81 ]
  %99 = phi i32 [ 0, %60 ], [ %49, %39 ], [ %82, %81 ]
  %100 = icmp ne i8 %98, 0
  %101 = add i32 %99, -4
  %102 = icmp ult i32 %101, -2
  %103 = and i1 %100, %102
  %104 = icmp eq i8 %98, 0
  %105 = icmp eq i32 %99, 3
  %106 = and i1 %104, %105
  %107 = select i1 %106, i8 1, i8 %98
  %108 = select i1 %103, i8 0, i8 %107
  %109 = getelementptr inbounds i8, ptr %2, i64 %9
  store i8 %108, ptr %109, align 1, !tbaa !3
  %110 = add nuw nsw i64 %9, 1
  %111 = icmp eq i64 %110, 1000
  br i1 %111, label %112, label %8, !llvm.loop !10

112:                                              ; preds = %97
  call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %1) #4
  %113 = add nuw nsw i32 %5, 1
  %114 = icmp eq i32 %113, 100
  br i1 %114, label %6, label %4, !llvm.loop !11

115:                                              ; preds = %4, %115
  %116 = phi i64 [ 0, %4 ], [ %125, %115 ]
  %117 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %116
  %118 = load i8, ptr %117, align 1, !tbaa !3
  %119 = icmp eq i8 %118, 0
  %120 = trunc i64 %116 to i32
  %121 = udiv i32 %120, 25
  %122 = trunc i64 %116 to i32
  %123 = urem i32 %122, 25
  %124 = select i1 %119, i32 -1, i32 16751001
  tail call void @simPutDisplayPixel(i32 noundef %121, i32 noundef %123, i32 noundef %124, i32 noundef 40) #4
  %125 = add nuw nsw i64 %116, 1
  %126 = icmp eq i64 %125, 1000
  br i1 %126, label %7, label %115, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

declare dso_local void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

declare dso_local void @simFlush(...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 18.1.8 (Fedora 18.1.8-1.fc40)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = distinct !{!11, !7, !8}
!12 = distinct !{!12, !7, !8}
