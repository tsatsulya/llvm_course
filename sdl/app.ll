; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [1000 x i8], align 16
  %2 = alloca [1000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %2) #5
  %3 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 14
  store i8 1, ptr %3, align 2, !tbaa !3
  br label %4

4:                                                ; preds = %0, %168
  %5 = phi i32 [ 0, %0 ], [ %169, %168 ]
  br label %171

6:                                                ; preds = %168
  call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %2) #5
  ret void

7:                                                ; preds = %171
  tail call void (...) @simFlush() #5
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %1) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(1000) %1, ptr noundef nonnull align 16 dereferenceable(1000) %2, i64 1000, i1 false), !tbaa !3
  br label %8

8:                                                ; preds = %153, %7
  %9 = phi i64 [ 0, %7 ], [ %166, %153 ]
  %10 = trunc i64 %9 to i16
  %11 = urem i16 %10, 25
  %12 = udiv i16 %10, 25
  %13 = zext nneg i16 %11 to i32
  switch i16 %11, label %14 [
    i16 0, label %74
    i16 24, label %74
  ]

14:                                               ; preds = %8
  %15 = add nsw i64 %9, -25
  %16 = icmp ult i64 %15, 950
  br i1 %16, label %17, label %74

17:                                               ; preds = %14
  %18 = udiv i16 %10, 25
  %19 = getelementptr inbounds i8, ptr %1, i64 %9
  %20 = load i8, ptr %19, align 1, !tbaa !3
  %21 = add nsw i32 %13, -1
  %22 = sext i32 %21 to i64
  %23 = mul nuw nsw i16 %18, 40
  %24 = zext nneg i16 %23 to i64
  %25 = getelementptr i8, ptr %1, i64 %24
  %26 = getelementptr i8, ptr %25, i64 -40
  %27 = getelementptr i8, ptr %26, i64 %22
  %28 = load i8, ptr %27, align 1, !tbaa !3
  %29 = icmp ne i8 %28, 0
  %30 = zext i1 %29 to i32
  %31 = add nsw i64 %22, 1
  %32 = getelementptr i8, ptr %26, i64 %31
  %33 = load i8, ptr %32, align 1, !tbaa !3
  %34 = icmp ne i8 %33, 0
  %35 = zext i1 %34 to i32
  %36 = add nuw nsw i32 %35, %30
  %37 = add nsw i64 %22, 2
  %38 = getelementptr i8, ptr %26, i64 %37
  %39 = load i8, ptr %38, align 1, !tbaa !3
  %40 = icmp ne i8 %39, 0
  %41 = zext i1 %40 to i32
  %42 = add nuw nsw i32 %36, %41
  %43 = getelementptr i8, ptr %25, i64 %22
  %44 = load i8, ptr %43, align 1, !tbaa !3
  %45 = icmp ne i8 %44, 0
  %46 = zext i1 %45 to i32
  %47 = add nuw nsw i32 %42, %46
  %48 = getelementptr i8, ptr %25, i64 %31
  %49 = load i8, ptr %48, align 1, !tbaa !3
  %50 = icmp ne i8 %49, 0
  %51 = zext i1 %50 to i32
  %52 = add nuw nsw i32 %47, %51
  %53 = getelementptr i8, ptr %25, i64 %37
  %54 = load i8, ptr %53, align 1, !tbaa !3
  %55 = icmp ne i8 %54, 0
  %56 = zext i1 %55 to i32
  %57 = add nuw nsw i32 %52, %56
  %58 = getelementptr i8, ptr %25, i64 40
  %59 = getelementptr i8, ptr %58, i64 %22
  %60 = load i8, ptr %59, align 1, !tbaa !3
  %61 = icmp ne i8 %60, 0
  %62 = zext i1 %61 to i32
  %63 = add nuw nsw i32 %57, %62
  %64 = getelementptr i8, ptr %58, i64 %31
  %65 = load i8, ptr %64, align 1, !tbaa !3
  %66 = icmp ne i8 %65, 0
  %67 = zext i1 %66 to i32
  %68 = add nuw nsw i32 %63, %67
  %69 = getelementptr i8, ptr %58, i64 %37
  %70 = load i8, ptr %69, align 1, !tbaa !3
  %71 = icmp ne i8 %70, 0
  %72 = zext i1 %71 to i32
  %73 = add nuw nsw i32 %68, %72
  br label %153

74:                                               ; preds = %14, %8, %8
  %75 = getelementptr inbounds i8, ptr %1, i64 %9
  %76 = load i8, ptr %75, align 1, !tbaa !3
  %77 = zext nneg i16 %12 to i32
  %78 = add nsw i32 %13, -1
  %79 = add nuw nsw i32 %13, 1
  %80 = add nsw i32 %77, -1
  %81 = add nuw nsw i32 %77, 1
  switch i16 %11, label %84 [
    i16 0, label %82
    i16 24, label %83
  ]

82:                                               ; preds = %74
  br label %84

83:                                               ; preds = %74
  br label %84

84:                                               ; preds = %83, %82, %74
  %85 = phi i32 [ %78, %74 ], [ 23, %83 ], [ 0, %82 ]
  %86 = phi i32 [ %79, %74 ], [ 24, %83 ], [ 1, %82 ]
  %87 = icmp ult i64 %9, 25
  %88 = trunc i64 %9 to i32
  %89 = add i32 %88, -975
  %90 = icmp ult i32 %89, 25
  %91 = select i1 %90, i32 39, i32 %81
  %92 = select i1 %87, i32 %81, i32 %91
  %93 = sext i32 %80 to i64
  %94 = icmp sgt i32 %85, %86
  %95 = sext i32 %85 to i64
  %96 = add nuw nsw i32 %86, 1
  %97 = select i1 %87, i64 0, i64 %93
  %98 = add nuw nsw i32 %92, 1
  %99 = sub nsw i32 %86, %85
  %100 = zext i32 %99 to i64
  %101 = add nuw nsw i64 %100, 1
  %102 = icmp ult i32 %99, 7
  %103 = and i64 %101, 8589934584
  %104 = add nsw i64 %103, %95
  %105 = icmp eq i64 %101, %103
  br label %106

106:                                              ; preds = %137, %84
  %107 = phi i64 [ %97, %84 ], [ %139, %137 ]
  %108 = phi i32 [ 0, %84 ], [ %138, %137 ]
  br i1 %94, label %137, label %109

109:                                              ; preds = %106
  %110 = mul nsw i64 %107, 40
  %111 = getelementptr i8, ptr %1, i64 %110
  br i1 %102, label %134, label %112

112:                                              ; preds = %109
  %113 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %108, i64 0
  %114 = getelementptr i8, ptr %111, i64 %95
  br label %115

115:                                              ; preds = %115, %112
  %116 = phi i64 [ 0, %112 ], [ %129, %115 ]
  %117 = phi <4 x i32> [ %113, %112 ], [ %127, %115 ]
  %118 = phi <4 x i32> [ zeroinitializer, %112 ], [ %128, %115 ]
  %119 = getelementptr i8, ptr %114, i64 %116
  %120 = getelementptr i8, ptr %119, i64 4
  %121 = load <4 x i8>, ptr %119, align 1, !tbaa !3
  %122 = load <4 x i8>, ptr %120, align 1, !tbaa !3
  %123 = icmp ne <4 x i8> %121, zeroinitializer
  %124 = icmp ne <4 x i8> %122, zeroinitializer
  %125 = zext <4 x i1> %123 to <4 x i32>
  %126 = zext <4 x i1> %124 to <4 x i32>
  %127 = add <4 x i32> %117, %125
  %128 = add <4 x i32> %118, %126
  %129 = add nuw i64 %116, 8
  %130 = icmp eq i64 %129, %103
  br i1 %130, label %131, label %115, !llvm.loop !6

131:                                              ; preds = %115
  %132 = add <4 x i32> %128, %127
  %133 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %132)
  br i1 %105, label %137, label %134

134:                                              ; preds = %109, %131
  %135 = phi i64 [ %95, %109 ], [ %104, %131 ]
  %136 = phi i32 [ %108, %109 ], [ %133, %131 ]
  br label %142

137:                                              ; preds = %142, %131, %106
  %138 = phi i32 [ %108, %106 ], [ %133, %131 ], [ %149, %142 ]
  %139 = add nsw i64 %107, 1
  %140 = trunc i64 %139 to i32
  %141 = icmp eq i32 %98, %140
  br i1 %141, label %153, label %106, !llvm.loop !10

142:                                              ; preds = %134, %142
  %143 = phi i64 [ %150, %142 ], [ %135, %134 ]
  %144 = phi i32 [ %149, %142 ], [ %136, %134 ]
  %145 = getelementptr i8, ptr %111, i64 %143
  %146 = load i8, ptr %145, align 1, !tbaa !3
  %147 = icmp ne i8 %146, 0
  %148 = zext i1 %147 to i32
  %149 = add nsw i32 %144, %148
  %150 = add nsw i64 %143, 1
  %151 = trunc i64 %150 to i32
  %152 = icmp eq i32 %96, %151
  br i1 %152, label %137, label %142, !llvm.loop !11

153:                                              ; preds = %137, %17
  %154 = phi i8 [ %20, %17 ], [ %76, %137 ]
  %155 = phi i32 [ %73, %17 ], [ %138, %137 ]
  %156 = icmp ne i8 %154, 0
  %157 = add i32 %155, -4
  %158 = icmp ult i32 %157, -2
  %159 = and i1 %156, %158
  %160 = icmp eq i8 %154, 0
  %161 = icmp eq i32 %155, 3
  %162 = and i1 %160, %161
  %163 = select i1 %162, i8 1, i8 %154
  %164 = select i1 %159, i8 0, i8 %163
  %165 = getelementptr inbounds i8, ptr %2, i64 %9
  store i8 %164, ptr %165, align 1, !tbaa !3
  %166 = add nuw nsw i64 %9, 1
  %167 = icmp eq i64 %166, 1000
  br i1 %167, label %168, label %8, !llvm.loop !12

168:                                              ; preds = %153
  call void @llvm.lifetime.end.p0(i64 1000, ptr nonnull %1) #5
  %169 = add nuw nsw i32 %5, 1
  %170 = icmp eq i32 %169, 100
  br i1 %170, label %6, label %4, !llvm.loop !13

171:                                              ; preds = %4, %171
  %172 = phi i64 [ 0, %4 ], [ %182, %171 ]
  %173 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %172
  %174 = load i8, ptr %173, align 1, !tbaa !3
  %175 = icmp eq i8 %174, 0
  %176 = trunc i64 %172 to i16
  %177 = udiv i16 %176, 25
  %178 = zext nneg i16 %177 to i32
  %179 = urem i16 %176, 25
  %180 = zext nneg i16 %179 to i32
  %181 = select i1 %175, i32 -1, i32 16751001
  tail call void @simPutDisplayPixel(i32 noundef %178, i32 noundef %180, i32 noundef %181, i32 noundef 40) #5
  %182 = add nuw nsw i64 %172, 1
  %183 = icmp eq i64 %182, 1000
  br i1 %183, label %7, label %171, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

declare dso_local void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

declare dso_local void @simFlush(...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #4

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind }

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
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
