import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'package:hcmue/parents/view/widgets/skeleton.dart';
import 'package:hcmue/public/utils/constant.dart';

class StudentHistoryShimmerLoading extends StatelessWidget {
  const StudentHistoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: loadingPrimarycolor,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Skeleton(
              width: 200.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(7, (idx) {
            return Column(
              children: [
                _buildSkeletonItem(),
                const SizedBox(height: 10),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSkeletonItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Skeleton(
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
