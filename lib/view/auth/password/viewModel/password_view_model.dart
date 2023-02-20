import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trip_advisor_app/core/base/model/base_view_model.dart';

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
}
