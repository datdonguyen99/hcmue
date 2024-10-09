import 'package:flutter/material.dart';

import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.title,
    this.bgColor,
    this.style,
    required this.press,
  });

  final double? width;
  final double? height;
  final String title;
  final LinearGradient? bgColor;
  final TextStyle? style;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press.call(),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width / 2,
        height: height ?? 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: bgColor ?? gradientColor,
        ),
        child: Center(
          child: Text(
            title,
            style: style ?? openSansMediumStyle(fontSize: 16.0, color: white),
          ),
        ),
      ),
    );
  }
}
