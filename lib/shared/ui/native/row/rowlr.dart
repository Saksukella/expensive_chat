import 'package:flutter/material.dart';

class RowLR extends StatelessWidget {
  const RowLR({super.key, required this.l, required this.r, this.padding = 0});

  final Widget l;
  final Widget r;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          l,
          r,
        ],
      ),
    );
  }
}
