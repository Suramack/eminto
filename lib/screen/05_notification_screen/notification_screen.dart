import 'dart:math';

import 'package:emito/bloc/notification/notification_bloc.dart';
import 'package:emito/core/model/notification_response_model.dart';
import 'package:emito/resources/images.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:emito/widget/common/loader/loading_widet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationBloc _notificationBloc;

  bool isLoading = true;
  NotificationResponseModel? notificationResponseModel;
  @override
  void initState() {
    _notificationBloc =
        BlocProvider.of<NotificationBloc>(context, listen: false);
    fetchNotification();
    super.initState();
  }

  Future<void> fetchNotification() async {
    _notificationBloc.add(GetNotificationEvent());
  }

  List<String> notificationThumbnail = [
    Images.orderAssignedIcon,
    Images.outOfStockIcon,
    Images.adIconOne,
    Images.adIconTwo,
    Images.orderCancelIcon,
    Images.orderDeliveryIcon,
  ];

  int getRandomIndex() {
    return Random().nextInt(6);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _notificationBloc,
      listener: (context, state) {
        if (state is NotificationLoadingState) {
          isLoading = true;
        } else if (state is GetNotificationState) {
          notificationResponseModel = state.notificationResponseModel;
          isLoading = false;
        } else if (state is NotificationErrorState) {
          isLoading = false;
        }
      },
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return isLoading
            ? const LoaderWidget()
            : ListView.separated(
                itemBuilder: (context, index) => InkWell(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: SvgPicture.asset(
                          notificationThumbnail[getRandomIndex()],
                        ),
                      ),
                      const HorizontalSpace(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notificationResponseModel!.data[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.greyBlack,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Text(
                              notificationResponseModel!.data[index].body,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.shadeGrey,
                                    fontWeight: FontWeight.w200,
                                  ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: notificationResponseModel!.data.length,
              );
      },
    );
  }
}
