import 'package:emito/resources/images.dart';
import 'package:emito/resources/strings.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/utils/utils.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:emito/widget/common/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReferAndEarnWidget extends StatelessWidget {
  const ReferAndEarnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showToast(Strings.dymanicLinkInProgress);
      },
      child: Column(
        children: [
          const VerticalSpace(height: 10),
          Container(
            width: Utils.getScreenSize(context).width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        Strings.referAndEarn,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                      ),
                      Text(
                        Strings.inviteAndEarn,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(Images.giftImage)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
