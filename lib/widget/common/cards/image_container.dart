import 'package:emito/themes/colors.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageContainer extends StatelessWidget {
  final String image, title;
  final String offerText;
  const ImageContainer({
    Key? key,
    required this.image,
    required this.title,
    this.offerText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGrey,
                blurRadius: 3,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(image),
              ),
              if (offerText.isNotEmpty) ...[
                Positioned(
                  right: 5,
                  top: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.purple,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      child: Text(
                        offerText,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.white,
                                  fontSize: 8,
                                ),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
        const VerticalSpace(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.greyBlack,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
        )
      ],
    );
  }
}
