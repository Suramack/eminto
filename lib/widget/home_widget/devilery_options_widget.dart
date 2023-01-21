import 'package:emito/resources/images.dart';
import 'package:emito/resources/strings.dart';
import 'package:emito/routes/routes.dart';
import 'package:emito/utils/navigations.dart';
import 'package:emito/widget/common/button/primary_text_button.dart';
import 'package:emito/widget/common/cards/image_container.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:emito/widget/common/title/title_widget.dart';
import 'package:flutter/material.dart';

class DeliveryOptionsWidget extends StatefulWidget {
  const DeliveryOptionsWidget({super.key});

  @override
  State<DeliveryOptionsWidget> createState() => _DeliveryOptionsWidgetState();
}

class _DeliveryOptionsWidgetState extends State<DeliveryOptionsWidget> {
  List<String> imageList = [
    Images.burgerColaIcon,
    Images.medicineIcon,
    Images.petsIcon,
    Images.giftsIcon,
    Images.meetIcon,
    Images.cosmeticIcon,
    Images.stationeryIcon,
    Images.storeIcon,
  ];
  List<String> titleList = [
    Strings.foodDelivery,
    Strings.medicines,
    Strings.petSupplies,
    Strings.gifts,
    Strings.meat,
    Strings.cosmetic,
    Strings.stationery,
    Strings.stores,
  ];

  List<String> offersText = [
    '',
    '10% off',
    '10% off',
    '10% off',
    '',
    '10% off',
    '',
    '',
  ];

  void gotoNavigation(int index) {
    Navigation.pushNamed(
        context, Routes.dummyScreen, {'app_bar_title': titleList[index]});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingContainer(title: Strings.whatWouldYouLike),
        const VerticalSpace(height: 10),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: imageList.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              gotoNavigation(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ImageContainer(
                image: imageList[index],
                title: titleList[index],
                offerText: offersText[index],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryTextButton(title: Strings.more),
          ],
        )
      ],
    );
  }
}
