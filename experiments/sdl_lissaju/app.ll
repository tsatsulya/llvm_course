; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  tail call void (...) @simInit() #2
  br label %2

1:                                                ; preds = %2
  tail call void (...) @simExit() #2
  ret void

2:                                                ; preds = %0, %2
  %3 = phi i32 [ 0, %0 ], [ %17, %2 ]
  %4 = trunc i32 %3 to i16
  %5 = mul i16 %4, 11
  %6 = add i16 %5, 1365
  %7 = tail call signext i16 @fpsin(i16 noundef signext %6) #2
  %8 = sdiv i16 %7, 100
  %9 = add nsw i16 %8, 50
  %10 = mul i16 %4, 5
  %11 = tail call signext i16 @fpsin(i16 noundef signext %10) #2
  %12 = sdiv i16 %11, 100
  %13 = add nsw i16 %12, 50
  %14 = tail call i32 @usleep(i32 noundef 10000) #2
  %15 = sext i16 %9 to i32
  %16 = sext i16 %13 to i32
  tail call void @simPutDisplayPixel(i32 noundef %15, i32 noundef %16, i32 noundef 16751001, i32 noundef 4) #2
  tail call void (...) @simFlush() #2
  %17 = add nuw nsw i32 %3, 10
  %18 = icmp ult i32 %3, 65526
  br i1 %18, label %2, label %1, !llvm.loop !3
}

declare dso_local void @simInit(...) local_unnamed_addr #1

declare dso_local signext i16 @fpsin(i16 noundef signext) local_unnamed_addr #1

declare dso_local i32 @usleep(i32 noundef) local_unnamed_addr #1

declare dso_local void @simPutDisplayPixel(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

declare dso_local void @simFlush(...) local_unnamed_addr #1

declare dso_local void @simExit(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 18.1.8 (Fedora 18.1.8-1.fc40)"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
