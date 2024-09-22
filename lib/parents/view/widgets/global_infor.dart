import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_style.dart';

class GlobalInfor extends StatelessWidget {
  const GlobalInfor({
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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Icon(icon, color: gray, size: 27),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                fullname,
                style: openSansMediumStyle(fontSize: 11, color: gray),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: width ?? 300.w,
                child: Text(
                  name,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: openSansMediumStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
