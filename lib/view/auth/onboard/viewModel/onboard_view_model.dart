import 'package:mobx/mobx.dart';
import 'package:trip_advisor_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:trip_advisor_app/core/constants/enums/locale_keys_enum.dart';
import 'package:trip_advisor_app/core/constants/navigation/navigation_constants.dart';
import 'package:trip_advisor_app/core/constants/svg/svg_constants.dart';
import 'package:trip_advisor_app/core/extension/string_extension.dart';
import 'package:trip_advisor_app/core/init/lang/locale_keys.g.dart';
import 'package:trip_advisor_app/core/init/navigation/navigation_service.dart';
import 'package:trip_advisor_app/view/auth/onboard/model/onboard_model.dart';
part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  List<OnBoardModel> onBoardPages = [];
  @override
  void init() {
    onBoardPages.addAll(
      [
        OnBoardModel(
          title: LocaleKeys.onBoard_page1_title.locale,
          description: LocaleKeys.onBoard_page1_description.locale,
          imagePath: SVGConstants.instance.travel.locale,
        ),
        OnBoardModel(
          title: LocaleKeys.onBoard_page2_title.locale,
          description: LocaleKeys.onBoard_page2_description.locale,
          imagePath: SVGConstants.instance.travelExplore.locale,
        ),
        OnBoardModel(
          title: LocaleKeys.onBoard_page3_title.locale,
          description: LocaleKeys.onBoard_page3_description.locale,
          imagePath: SVGConstants.instance.travelWorld.locale,
        ),
      ],
    );
  }

  Future<void> completeToOnBoard() async {
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);

    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    }
  }
}
