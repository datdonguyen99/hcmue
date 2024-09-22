import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    this.msg,
  });

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(msg ?? 'Something goes wrong please try again!'),
    );
  }
}
