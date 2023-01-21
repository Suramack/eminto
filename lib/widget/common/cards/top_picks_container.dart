import 'package:emito/resources/images.dart';
import 'package:emito/resources/strings.dart';
import 'package:emito/routes/routes.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/utils/navigations.dart';
import 'package:emito/utils/utils.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:emito/widget/common/title/title_widget.dart';
import 'package:flutter/material.dart';

class TopPicksContainer extends StatefulWidget {
  const TopPicksContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<TopPicksContainer> createState() => _TopPicksContainerState();
}

class _TopPicksContainerState extends State<TopPicksContainer> {
  List<String> picksTitile = [
    'DISCOUNT 25% ALL FRUITS',
    'DISCOUNT 10% ALL MEDICINE',
  ];
  List<Color> colorsList = [AppColors.primaryColor, AppColors.purple];

  PageController pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingContainer(title: Strings.topPicsForYou),
        const VerticalSpace(height: 10),
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            itemCount: 2,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigation.pushNamed(context, Routes.dummyScreen, {
                  'title': picksTitile[index],
                  'app_bar_title': 'top picks'
                });
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: Utils.getScreenSize(context).width,
                    height: 190,
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    decoration: BoxDecoration(
                      color: colorsList[index],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Center(
                            child: Image.asset(
                              width: 200,
                              Images.icescream,
                            ),
                          ),
                        ),
                        Text(
                          picksTitile[index].replaceAll(' ', '\n'),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CrazyDealsContainer extends StatefulWidget {
  const CrazyDealsContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<CrazyDealsContainer> createState() => _CrazyDealsContainer();
}

class _CrazyDealsContainer extends State<CrazyDealsContainer> {
  List<String> picksTitile = [
    'Customer favourite',
    'Customer favourite brand',
  ];
  List<Color> colorsList = [
    AppColors.greyBlack,
    AppColors.purple,
  ];

  PageController pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingContainer(title: Strings.crazeDeals),
        const VerticalSpace(height: 10),
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            itemCount: 2,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigation.pushNamed(context, Routes.dummyScreen, {
                  'title': picksTitile[index],
                  'app_bar_title': 'Crazy deals'
                });
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: Utils.getScreenSize(context).width,
                    height: 190,
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    decoration: BoxDecoration(
                      color: colorsList[index],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Center(
                            child: Image.asset(
                              width: 150,
                              Images.vegitablesImage,
                            ),
                          ),
                        ),
                        Text(
                          picksTitile[index].replaceAll(' ', '\n'),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
