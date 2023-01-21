import 'dart:io';
import 'package:emito/core/model/notification_response_model.dart';
import 'package:emito/core/service/notification/notification_service.dart';
import 'package:emito/resources/strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationService notificationService;
  NotificationBloc({required this.notificationService})
      : super(NotificationInitialState()) {
    on<NotificationInitialEvent>(loadInitialEvent);
    on<GetNotificationEvent>(getNotification);
  }
  void loadInitialEvent(NotificationInitialEvent event, Emitter emitter) {
    emitter(NotificationInitialState);
  }

  void getNotification(NotificationEvent event, Emitter emitter) async {
    emitter(NotificationLoadingState());
    try {
      emitter(
        GetNotificationState(await notificationService.getNotification()),
      );
    } on SocketException {
      emitter(NotificationErrorState(Strings.noInternetAvailable));
    } on HttpException {
      emitter(NotificationErrorState(Strings.httpAlert));
    } on Exception catch (e) {
      emitter(NotificationErrorState(e.toString()));
    }
  }
}
