import 'package:emito/resources/images.dart';
import 'package:emito/routes/routes.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/utils/navigations.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:flutter/material.dart';

class TrendingStoreTile extends StatelessWidget {
  const TrendingStoreTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.pushNamed(context, Routes.dummyScreen,
            {'title': "Mithas Bhandar", 'app_bar_title': 'Trending'});
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Images.icescreamIcon,
                height: 88,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 3, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // This strings are fetching from API, will change
                    Text(
                      'Mithas Bhandar',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.greyBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      'Sweets, North Indian',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.greyBlack,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                    ),
                    Text(
                      '(store location) | 6.4 kms',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.greyBlack,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: AppColors.greyBlack,
                        ),
                        const HorizontalSpace(width: 5),
                        Text(
                          '4.1 | 45 mins',
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.greyBlack,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
