import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hcmue/public/utils/constant.dart';

class LoginLabel extends StatelessWidget {
  const LoginLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Đăng nhập hệ thống E-learning",
        style: GoogleFonts.openSans(
          textStyle: const TextStyle(
            color: darkTurquoise,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
