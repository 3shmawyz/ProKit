import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @observable
  Color scaffoldBackground;

  @observable
  Color backgroundColor;

  @observable
  Color backgroundSecondaryColor;

  @observable
  Color textPrimaryColor;

  @observable
  Color appColorPrimaryLightColor;

  @observable
  Color textSecondaryColor;

  @observable
  Color appBarColor;

  @observable
  Color iconColor;

  @observable
  Color iconSecondaryColor;

  @observable
  String selectedLanguage = 'en';

  @action
  Future<void> setDarkMode(bool aIsDarkModeOn) async {
    isDarkModeOn = aIsDarkModeOn;

    if (aIsDarkModeOn) {
      scaffoldBackground = appBackgroundColorDark;

      appBarColor = cardBackgroundBlackDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = cardBackgroundBlackDark;

      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = appShadowColorDark;
    } else {
      scaffoldBackground = appWhite;

      appBarColor = appWhite;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      appColorPrimaryLightColor = appColorPrimaryLight;

      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;

      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;

      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
      shadowColorGlobal = appShadowColor;
    }

    await setBool(isDarkModeOnPref, aIsDarkModeOn);
  }

  @action
  void setLanguage(String aLanguage) => selectedLanguage = aLanguage;
}
