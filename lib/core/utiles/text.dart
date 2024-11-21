import 'package:abdelmoneam_create_an_animation_scroll/core/app_const/app_const.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle regularOxTitle = TextStyle(
    fontFamily: oxFont,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle mediumrOxTitle = TextStyle(
    fontFamily: oxFont,
    fontWeight: FontWeight.w500
  );
  static const TextStyle semiBoldrOxTitle = TextStyle(
    fontFamily: oxFont,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle regularIbmBody = TextStyle(
    fontFamily: ibmFont,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle mediumIbmBody = TextStyle(
    fontFamily: ibmFont,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle semiBoldIbmBody = TextStyle(
    fontFamily: ibmFont,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle boldIbmBody = TextStyle(
    fontFamily: ibmFont,
    fontWeight: FontWeight.bold,
  );
}
