import 'package:emito/bloc/notification/notification_bloc.dart';
import 'package:emito/core/model/notification_response_model.dart';
import 'package:emito/resources/strings.dart';
import 'package:emito/routes/routes.dart';
import 'package:emito/utils/local_storage.dart';
import 'package:emito/utils/navigations.dart';
import 'package:emito/widget/common/app_bar/search_home_template.dart';
import 'package:emito/widget/common/button/location_button.dart';
import 'package:emito/widget/common/free_space/free_space.dart';
import 'package:emito/widget/common/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as location;

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with WidgetsBindingObserver {
  late NotificationBloc _notificationBloc;

  NotificationResponseModel? notificationResponseModel;

  PermissionStatus? permissionStatus;

  double? lat, long;

  List<Placemark> currentAddress = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _notificationBloc =
        BlocProvider.of<NotificationBloc>(context, listen: false);
    fetchLocation();
    fetchNotification();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      fetchLocation();
    } else if (state == AppLifecycleState.paused) {
      LocalStorage.clearNotification();
    }
    super.didChangeAppLifecycleState(state);
  }

  Future<void> fetchLocation() async {
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      permissionStatus = await Permission.location.request();
      if (permissionStatus == PermissionStatus.permanentlyDenied) {
        showToast(Strings.pleaseEnableLocation);
        await openAppSettings();
      } else {
        var k = await location.Location().getLocation();
        getAddress(k.latitude, k.longitude);
      }
    } else {
      await location.Location().requestService();
    }
  }

  Future<void> getAddress(double? latitude, double? longitude) async {
    currentAddress = await placemarkFromCoordinates(latitude!, longitude!);
// TODO: need to convert bloc,
    setState(() {});
  }

  void searchBarOnTap() {
    Navigation.pushNamed(context, Routes.dummyScreen, {
      'title': 'Search option in progress',
      'app_bar_title': 'search',
    });
  }

  void offersOnTap() {
    Navigation.pushNamed(context, Routes.dummyScreen, {
      'title': 'offers will be soon',
      'app_bar_title': 'offers',
    });
  }

  Future<void> notificationOnTap() async {
    Navigation.pushNamed(context, Routes.notificationScreen, {
      "app_bar_title": Strings.notifications,
    });
  }

  void fetchNotification() async {
    var localNotification = await LocalStorage.getNotification();
    if (localNotification.isEmpty) {
      _notificationBloc.add(GetNotificationEvent());
    } else {
      notificationResponseModel =
          notificationResponseModelFromJson(localNotification);
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _notificationBloc,
      listener: (context, state) {
        if (state is NotificationLoadingState) {
        } else if (state is GetNotificationState) {
          notificationResponseModel = state.notificationResponseModel;
        } else if (state is NotificationErrorState) {}
      },
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocationHomeWidget(
              title: currentAddress.isEmpty
                  ? Strings.waitingForLocation
                  : '${currentAddress[0].name!}, ${currentAddress[0].locality}',
              onTap: () {
                showToast(Strings.locationCantBeChangedRightNow);
              },
            ),
            const VerticalSpace(height: 20),
            HomeSearchBarTemplate(
              searchOnTap: () {
                searchBarOnTap();
              },
              notificationOnTap: () {
                notificationOnTap();
              },
              offersOntap: () {
                offersOnTap();
              },
              notificationResponseModel: notificationResponseModel,
            ),
          ],
        );
      },
    );
  }
}
