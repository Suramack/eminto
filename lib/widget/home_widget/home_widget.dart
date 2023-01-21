import 'package:emito/widget/common/app_bar/home_app_bar.dart';
import 'package:emito/widget/common/cards/top_picks_container.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:emito/widget/home_widget/devilery_options_widget.dart';
import 'package:emito/widget/home_widget/near_by_store.dart';
import 'package:emito/widget/home_widget/refer_and_earn_widget.dart';
import 'package:emito/widget/home_widget/trendings_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(height: 50),
          const HomeAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  VerticalSpace(height: 30),
                  DeliveryOptionsWidget(),
                  VerticalSpace(height: 10),
                  TopPicksContainer(),
                  Trendings(),
                  CrazyDealsContainer(),
                  ReferAndEarnWidget(),
                  NearByStoreWidget(),
                ],
              ),
            ),
          ),
          const VerticalSpace(height: 70),
        ],
      ),
    );
  }
}
