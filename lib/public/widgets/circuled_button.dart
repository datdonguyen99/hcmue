import 'package:flutter/material.dart';

import '../utils/constant.dart';

Widget circuledButton({
  required LinearGradient background,
  double height = 75,
  required String pic,
  required String text,
  required final Function press,
  required Color icontextcolor,
}) {
  return InkWell(
    onTap: () => press.call(),
    child: Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
        gradient: background,
        shape: BoxShape.circle,
        border: Border.all(color: gray),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              pic,
              height: 75,
              width: 75,
              fit: BoxFit.cover,
              color: icontextcolor,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: icontextcolor,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
