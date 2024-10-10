import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'package:hcmue/student/view/widgets/skeleton.dart';
import 'package:hcmue/public/utils/constant.dart';

class QuestionShimmerLoading extends StatelessWidget {
  const QuestionShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: List.generate(3, (idx) {
          return Card(
            elevation: 4.0,
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
                      decoration: const BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          width: 120.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Skeleton(
                          width: 60.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        const SizedBox(height: 20.0),
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
