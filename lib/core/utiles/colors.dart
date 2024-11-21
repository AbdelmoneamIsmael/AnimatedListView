import 'package:abdelmoneam_create_an_animation_scroll/local/shared_preferances.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const blackColor = Color(0xFF333940);
  static const whiteColor = Color(0xFFF2F5FA);

  static Color get backgroundColor {
    return cheeckLightTheme()
        ? const Color(0xffFFF0F5)
        : const Color(0xFF35374B);
  }

  static Color get titleTextColor {
    return cheeckLightTheme() ? const Color(0xffFBA1B7) : const Color(0xff868B91);
  }

  static Color get normalTextColor {
    return cheeckLightTheme()
        ? const Color(0xffFBA1B7)
        : const Color(0xff868B91);
  }

  static Color get informationContainer {
    return cheeckLightTheme()
        ? const Color(0xffFFF0F5)
        : const Color(0xffC5D3E8);
  }

  static Color get captionTextColor {
    return const Color(0xFF9C9A9A);
  }

  static Color get iconActiveColors {
    return cheeckLightTheme() ? blackColor : whiteColor;
  }

  static Color get iconInActiveColors {
    return const Color(0xFF9C9A9A);
  }

  static Color get forgroundColor {
    return cheeckLightTheme() ? Colors.black : Colors.white;
  }

  static bool cheeckLightTheme() {
    return CacheHelper.getData(key: CacheKey.lightTheme);
  }
}
