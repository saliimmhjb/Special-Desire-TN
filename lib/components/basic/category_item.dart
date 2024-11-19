import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:specialdesire/constants/colors.dart';

class CategoryItem extends StatelessWidget {
  final String cateogryName;
  final Icon categoryIcon;
  const CategoryItem({super.key, required this.cateogryName, required this.categoryIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: itemBgColor,
            ),
            child: categoryIcon,
          ),
          Text(
            cateogryName,
            style: Theme.of(context)
                .textTheme
                .overline!
                .copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
