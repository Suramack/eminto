import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emito/core/service/interceptor_header/interceptor_header.dart';
import 'package:emito/resources/strings.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class ServiceBase {
   static String apiBaseUrl = 'https://raw.githubusercontent.com/';

  static Future<http.Response> get({
    String? url,
    String? baseUrl,
    Map<String, String>? headers,
  }) async {
    var networkStataus = await checkConnectionStatus();
    if (networkStataus) {
      String apiUrl = (baseUrl!.isEmpty ? apiBaseUrl : baseUrl) + url!;
      final response =
          await InterceptedHttp.build(interceptors: [InterceptorHeader()]).get(
        Uri.parse(apiUrl),
        headers: headers,
      );
      return response;
    }
    throw Strings.noInternetAvailable;
  }
}

Future<bool> checkConnectionStatus() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
