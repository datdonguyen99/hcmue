import 'package:flutter/material.dart';

import 'package:hcmue/public/utils/constant.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
    this.size,
  });

  final double rating;
  final double? size;

  Color getStarColor() {
    if (rating >= 4.5) {
      return primaryColor;
    } else if (rating >= 3.5) {
      return Colors.yellow;
    } else if (rating >= 2.5) {
      return orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (idx) {
        if (idx < rating.floor()) {
          return Icon(
            Icons.star,
            size: size ?? 30.0,
            color: getStarColor(),
          );
        } else if (idx == rating.floor() && rating % 1 != 0) {
          return ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  getStarColor(),
                  gray,
                ],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: Icon(
              Icons.star_half,
              size: size ?? 30.0,
              color: white,
            ),
          );
        } else {
          return Icon(
            Icons.star_border,
            size: size ?? 30.0,
            color: gray,
          );
        }
      }),
    );
  }
}
