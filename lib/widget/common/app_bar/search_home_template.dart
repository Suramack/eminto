import 'package:emito/core/model/notification_response_model.dart';
import 'package:emito/resources/images.dart';
import 'package:emito/resources/strings.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchBarTemplate extends StatelessWidget {
  final Function searchOnTap, notificationOnTap, offersOntap;
  final NotificationResponseModel? notificationResponseModel;
  const HomeSearchBarTemplate({
    Key? key,
    required this.searchOnTap,
    required this.notificationOnTap,
    required this.offersOntap,
    required this.notificationResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => searchOnTap(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.lightGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Strings.searchForProducts),
                  const HorizontalSpace(width: 10),
                  SvgPicture.asset(Images.lensIcon)
                ],
              ),
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => notificationOnTap(),
          child: SizedBox(
            width: 45,
            height: 45,
            child: Stack(
              children: [
                Center(child: SvgPicture.asset(Images.bellIcon)),
                notificationResponseModel == null
                    ? const SizedBox()
                    : Positioned(
                        right: 2,
                        top: 5,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                              child: Text(
                                notificationResponseModel!.data.length > 9
                                    ? '9+'
                                    : notificationResponseModel!.data.length
                                        .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: AppColors.white,
                                      fontSize: 8,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
        const HorizontalSpace(width: 10),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => offersOntap(),
          child: SizedBox(
            width: 45,
            height: 45,
            child: Center(
              child: SvgPicture.asset(
                Images.slipIcon,
              ),
            ),
          ),
        )
      ],
    );
  }
}
