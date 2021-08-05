import 'dart:io';

import 'package:spacex/models/latest_launch_model.dart';
import 'package:spacex/services/http_service.dart';

class LaunchRepository {
  Future<LatestLaunchModel?> getLaunchWithParameter(String param) async {
    try {
      final response = await HttpService.getRequest("$param");

      if (response.statusCode == 200) {
        final result = latestLaunchModelFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
