import 'package:flutter/material.dart';
import 'package:specialdesire/constants/colors.dart';

class SizeTile extends StatelessWidget {
  final String size;
  const SizeTile({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: itemBgColor,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Center(
        child: Text(size, style: Theme.of(context).textTheme.overline!.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),),
      ),
    );
  }
}
