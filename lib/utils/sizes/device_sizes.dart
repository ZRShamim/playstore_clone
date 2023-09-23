import 'package:flutter/material.dart';

class DeviceSizes {
  static double getDeviceWidth(BuildContext ctx) {
    return MediaQuery.of(ctx).size.width;
  }

  static double getDeviceHeight(BuildContext ctx) {
    return MediaQuery.of(ctx).size.height;
  }
}
