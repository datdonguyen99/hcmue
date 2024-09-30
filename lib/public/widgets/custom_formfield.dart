import 'package:flutter/material.dart';

import 'package:hcmue/public/utils/constant.dart';

Widget customFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  String? errorText,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    onFieldSubmitted: (s) => onSubmit!(s),
    onChanged: (s) => onChange!(s),
    validator: validate,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(18),
      labelText: label,
      prefixIcon: Icon(
        prefix,
        color: lightGray,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: () => suffixPressed!(),
              icon: Icon(
                suffix,
                color: lightGray,
              ),
            )
          : null,
      errorText: errorText,
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: lightGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: darkTurquoise),
      ),
      floatingLabelStyle: const TextStyle(
        color: darkTurquoise,
      ),
      labelStyle: const TextStyle(color: lightGray),
    ),
  );
}
