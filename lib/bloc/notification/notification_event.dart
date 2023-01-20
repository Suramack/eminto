part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class NotificationInitialEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}

class GetNotificationEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}
