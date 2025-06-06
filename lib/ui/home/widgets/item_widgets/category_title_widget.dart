import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String? title;
  final Function? onTap;

  const CategoryTitleWidget({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!, style: stySectionTitle),
              IconButton(
                iconSize: 32,
                onPressed: onTap as void Function()?,
                icon: const Icon(
                  Icons.arrow_right_alt_outlined,
                  color: clrWhite,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
