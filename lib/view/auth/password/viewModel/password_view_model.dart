import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:quickalert/quickalert.dart';
import 'package:trip_advisor_app/core/base/model/base_view_model.dart';
import 'package:trip_advisor_app/core/extension/context_extension.dart';
import 'package:trip_advisor_app/core/init/lang/locale_keys.g.dart';
import 'package:trip_advisor_app/core/extension/string_extension.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
part 'password_view_model.g.dart';

class PasswordViewModel = _PasswordViewModelBase with _$PasswordViewModel;

abstract class _PasswordViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
  void navigateToLogin() {
    navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
  }

  @observable
  bool isLockOpen = false;
  @action
  void isLockChange() {
    isLockOpen = !isLockOpen;
  }

  void showSuccessAlert(BuildContext context, {required String text, required String title}) {
    QuickAlert.show(
      type: QuickAlertType.success,
      context: context,
      text: text,
      title: title,
      backgroundColor: context.colors.background,
      textColor: context.colors.secondary,
      titleColor: context.colors.secondary,
      confirmBtnColor: context.colors.onSecondary,
    );
  }
}
