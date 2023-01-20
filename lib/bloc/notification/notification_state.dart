part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {}

class NotificationInitialState extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationLoadingState extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationErrorState extends NotificationState {
  final dynamic error;
  NotificationErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class GetNotificationState extends NotificationState {
  final NotificationResponseModel notificationResponseModel;
  GetNotificationState(this.notificationResponseModel);
  @override
  List<Object?> get props => [notificationResponseModel];
}
