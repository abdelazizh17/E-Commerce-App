import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DeviceHelper {
  static Future<bool> isTablet(BuildContext context) async {
    if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      return iosInfo.model.toLowerCase().contains("ipad");
    } else {
      var shortestSide = MediaQuery.of(context).size.shortestSide;

      return shortestSide > 600;
    }
  }
}
