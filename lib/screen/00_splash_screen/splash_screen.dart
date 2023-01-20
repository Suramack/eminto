import 'package:emito/resources/lottie_files.dart';
import 'package:emito/resources/strings.dart';
import 'package:emito/routes/routes.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/utils/navigations.dart';
import 'package:emito/utils/utils.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigation.pushReplacementNamed(context, Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const VerticalSpace(height: 20),
          SizedBox(
            height: Utils.getScreenSize(context).width,
            child: Lottie.asset(
              LottieFiles.splash,
            ),
          ),
          Column(
            children: [
              Text(
                Strings.eminto,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 30,
            child: Lottie.asset(
              LottieFiles.loading,
            ),
          ),
          const VerticalSpace(height: 20),
        ],
      ),
    );
  }
}
