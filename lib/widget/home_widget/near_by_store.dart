import 'package:emito/resources/strings.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/widget/common/button/primary_text_button.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:flutter/material.dart';

import '../common/title/title_widget.dart';

class NearByStoreWidget extends StatelessWidget {
  const NearByStoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingContainer(title: Strings.nearbystores),
            PrimaryTextButton(
              title: Strings.sellAll,
              icon: const SizedBox(),
            )
          ],
        ),
        Text(
          Strings.inProgress,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        Text(
          Strings.itCanBeHappen,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.black.withOpacity(0.2),
                fontWeight: FontWeight.w200,
                fontSize: 12,
              ),
        ),
        const VerticalSpace(height: 10),
      ],
    );
  }
}
