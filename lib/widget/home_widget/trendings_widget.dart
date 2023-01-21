import 'package:emito/resources/strings.dart';
import 'package:emito/utils/utils.dart';
import 'package:emito/widget/common/button/primary_text_button.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:emito/widget/common/tile/tile.dart';
import 'package:emito/widget/common/title/title_widget.dart';
import 'package:flutter/material.dart';

class Trendings extends StatelessWidget {
  const Trendings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingContainer(title: Strings.trending),
            PrimaryTextButton(
              title: Strings.sellAll,
              icon: const SizedBox(),
            )
          ],
        ),
        SizedBox(
          width: Utils.getScreenSize(context).width,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) => SizedBox(
              width: Utils.getScreenSize(context).width * 0.7,
              child: Column(
                children: const [
                  TrendingStoreTile(),
                  VerticalSpace(height: 10),
                  TrendingStoreTile(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
