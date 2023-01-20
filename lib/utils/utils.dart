import 'dart:convert';

import 'package:emito/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Utils {
  Utils._();

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static String handleErrorResponse(
    Response response,
  ) {
    if (response.statusCode == 500) {
      return Strings.pleaseTryAgain;
    } else if (response.statusCode == 404) {
      return Strings.inProgress;
    } else {
      return getErrorMessage(response.body);
    }
  }

  static String getErrorMessage(String body) {
    var parsedBody = json.decode(body);
    return parsedBody['message'] ?? Strings.pleaseTryAgain;
  }
}
