import 'package:emito/resources/images.dart';
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
                children: [
                  HomeScreen(),
                  CartScreen(),
                  MyOrderScreen(),
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
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.cartIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.myOrdersIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.profileIcon,
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
