import 'package:emito/resources/images.dart';
import 'package:emito/routes/routes.dart';
import 'package:emito/utils/navigations.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryTextButton extends StatelessWidget {
  final Function? onTap;
  final String title;
  final Widget? icon;
  const PrimaryTextButton({
    Key? key,
    this.onTap,
    required this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigation.pushNamed(
          context,
          Routes.dummyScreen,
          {'app_bar_title': title},
        );
      },
      child: Row(
        children: [
          Text(
            title,
          ),
          const HorizontalSpace(width: 10),
          if (icon == null) ...[
            SvgPicture.asset(
              Images.downArrowIcon,
            )
          ]
        ],
      ),
    );
  }
}
