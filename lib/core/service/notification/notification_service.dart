import 'package:emito/core/model/notification_response_model.dart';
import 'package:emito/core/service/end_points/end_points.dart';
import 'package:emito/core/service/service_base/service_base.dart';
import 'package:emito/utils/local_storage.dart';
import 'package:emito/utils/utils.dart';

class NotificationService {
  Future<NotificationResponseModel> getNotification() async {
    var response = await ServiceBase.get(
      url: EndPoints.notification,
    );
    if (response.statusCode == 200) {
      LocalStorage.setNotification(response.body);
      return notificationResponseModelFromJson(response.body);
    } else {
      throw Utils.handleErrorResponse(response);
    }
  }
}
