import 'package:emito/themes/colors.dart';
import 'package:flutter/material.dart';

class HeadingContainer extends StatelessWidget {
  final String title;
  const HeadingContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.shadeGrey,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
        ),
      ],
    );
  }
}
