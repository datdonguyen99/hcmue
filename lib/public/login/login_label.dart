import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constant.dart';

class LoginLabel extends StatelessWidget {
  const LoginLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "LOGIN HCMUE",
        style: GoogleFonts.openSans(
          textStyle: const TextStyle(
            color: titleColor,
            fontWeight: FontWeight.w900,
            fontSize: 34,
          ),
        ),
      ),
    );
  }
}
