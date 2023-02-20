import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trip_advisor_app/core/base/model/base_view_model.dart';
import 'package:trip_advisor_app/core/constants/navigation/navigation_constants.dart';
part 'signup_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
  void navigateToLogin() {
    navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
  }
}
