import 'package:flutter/material.dart';
import 'package:trip_advisor_app/core/base/view/base_widget.dart';
import 'package:trip_advisor_app/view/login/viewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, value) => Scaffold(),
    );
  }
}
