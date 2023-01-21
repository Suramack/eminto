import 'package:emito/resources/images.dart';
import 'package:emito/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationHomeWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  const LocationHomeWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Images.locationIcon,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: 140,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.greyBlack,
                        fontSize: 12,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SvgPicture.asset(
              Images.downArrowIcon,
            ),
          ],
        ),
      ),
    );
  }
}
