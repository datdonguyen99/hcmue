import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'package:hcmue/student/view/widgets/skeleton.dart';
import 'package:hcmue/public/utils/constant.dart';

class QuizResultShimmerLoading extends StatelessWidget {
  const QuizResultShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: List.generate(3, (idx) {
          return Card(
            elevation: 4,
            color: white,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: loadingPrimarycolor,
                child: Row(
                  children: [
                    Skeleton(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          width: 200.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Skeleton(
                          width: 100.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Skeleton(
                          width: 150.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Skeleton(
                          width: 200.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
