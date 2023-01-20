import 'package:emito/resources/images.dart';
import 'package:emito/resources/strings.dart';
import 'package:emito/screen/01_home_screen/home_screen.dart';
import 'package:emito/screen/02_cart_screen/cart_screen.dart';
import 'package:emito/screen/03_my_orders_screen/my_orders_screen.dart';
import 'package:emito/screen/04_profile_screen/profile_screen.dart';
import 'package:emito/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseLayout extends StatefulWidget {
  final bool showAppBar, showBottomNavBar;
  final Widget screen;
  const BaseLayout({
    super.key,
    required this.showAppBar,
    required this.showBottomNavBar,
    required this.screen,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController();

  int currentIndex = 0;

  bottomNavBarOnTap(int value) {
    currentIndex = value;
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 1),
      curve: Curves.bounceIn,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: widget.showAppBar ? AppBar() : null,
        body: widget.showBottomNavBar
            ? PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  HomeScreen(),
                  CartScreen(),
                  MyOrdersScreen(),
                  ProfileScreen(),
                ],
              )
            : widget.screen,
        bottomNavigationBar: widget.showBottomNavBar
            ? BottomNavigationBar(
                onTap: (value) {
                  bottomNavBarOnTap(value);
                },
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.homeIcon,
                      color: currentIndex == 0
                          ? AppColors.primaryColor
                          : AppColors.primaryGrey,
                    ),
                    label: Strings.home,
                    tooltip: Strings.home,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.cartIcon,
                      color: currentIndex == 1
                          ? AppColors.primaryColor
                          : AppColors.primaryGrey,
                    ),
                    label: Strings.cart,
                    tooltip: Strings.cart,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.myOrdersIcon,
                      color: currentIndex == 2
                          ? AppColors.primaryColor
                          : AppColors.primaryGrey,
                    ),
                    label: Strings.myOrder,
                    tooltip: Strings.myOrder,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.profileIcon,
                      color: currentIndex == 3
                          ? AppColors.primaryColor
                          : AppColors.primaryGrey,
                    ),
                    label: Strings.profile,
                    tooltip: Strings.profile,
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
