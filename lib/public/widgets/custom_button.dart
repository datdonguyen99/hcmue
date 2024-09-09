import 'package:flutter/material.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.press,
  });

  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press.call(),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.0),
          gradient: gradientColor,
        ),
        child: Center(
          child: Text(
            'Đăng nhập',
            style: openSansMediumStyle(fontSize: 16, color: white),
          ),
        ),
      ),
    );
  }
}
