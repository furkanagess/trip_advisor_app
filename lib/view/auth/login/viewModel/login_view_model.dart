import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trip_advisor_app/core/base/model/base_view_model.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
  void navigateToSignup() {
    navigation.navigateToPage(path: NavigationConstants.SIGNUP_VIEW);
  }

  @observable
  bool isLockOpen = false;
  @action
  void isLockChange() {
    isLockOpen = !isLockOpen;
  }

  void navigateToPassword() {
    navigation.navigateToPage(path: NavigationConstants.PASSWORD_VIEW);
  }
}
