import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_style.dart';

class CardInfor extends StatelessWidget {
  const CardInfor({
    super.key,
    required this.fullname,
    required this.name,
    this.icon,
    this.width,
  });

  final String fullname;
  final String name;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: darkGray, size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              fullname,
              style: openSansMediumStyle(color: Colors.black),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: width ?? 200.w,
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: openSansMediumStyle(fontSize: 14, color: darkGray),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
