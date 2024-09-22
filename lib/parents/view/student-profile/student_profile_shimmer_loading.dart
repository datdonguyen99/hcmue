import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'package:hcmue/parents/view/widgets/skeleton.dart';
import 'package:hcmue/public/utils/constant.dart';

class StudentProfileShimmerLoading extends StatelessWidget {
  const StudentProfileShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: loadingPrimarycolor,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Skeleton(
                    width: 135.w,
                    height: 135.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: white),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Skeleton(
              width: double.infinity,
              height: 60.h,
              decoration: const BoxDecoration(color: white),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Skeleton(
                  width: 160.w,
                  height: 60.h,
                  decoration: const BoxDecoration(color: white),
                ),
                SizedBox(width: 40.w),
                Skeleton(
                  width: 160.w,
                  height: 60.h,
                  decoration: const BoxDecoration(color: white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Skeleton(
              width: double.infinity,
              height: 80.h,
              decoration: const BoxDecoration(color: white),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Skeleton(
              width: double.infinity,
              height: 80.h,
              decoration: const BoxDecoration(color: white),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Skeleton(
              width: double.infinity,
              height: 100.h,
              decoration: const BoxDecoration(color: white),
            ),
          ),
        ],
      ),
    );
  }
}
