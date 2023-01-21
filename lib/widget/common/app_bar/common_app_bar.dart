import 'package:emito/resources/images.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar commonAppbar({required BuildContext context, required String title}) {
  return AppBar(
    leading: InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        Navigation.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.primaryColor,
          ),
          child: Center(
            child: SvgPicture.asset(Images.leftIcon),
          ),
        ),
      ),
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.greyBlack,
            fontSize: 16,
          ),
    ),
  );
}
