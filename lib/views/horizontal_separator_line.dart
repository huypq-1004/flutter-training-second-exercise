import 'package:flutter/material.dart';

class HorizontalSeparatorLine extends StatelessWidget {
  const HorizontalSeparatorLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, width: double.infinity, color: Colors.black12);
  }
}
