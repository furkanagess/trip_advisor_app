import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/quickalert.dart';
import 'package:trip_advisor_app/core/base/view/base_view.dart';
import 'package:trip_advisor_app/core/extension/context_extension.dart';
import 'package:trip_advisor_app/core/extension/string_extension.dart';
import 'package:trip_advisor_app/view/auth/password/viewModel/password_view_model.dart';

import '../../../../core/constants/svg/svg_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../signup/viewModel/signup_view_model.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PasswordViewModel>(
      viewModel: PasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, PasswordViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: context.colors.background,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              viewModel.navigateToLogin();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: context.iconTheme.size,
              color: context.iconTheme.color,
            ),
          ),
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 5,
                child: buildSVG(),
              ),
              Spacer(
                flex: 1,
              ),
              // Add dynamic eye icon for obscure password using Mobx
              Expanded(
                flex: 2,
                child: buildPasswordTextField(context, viewModel),
              ),
              // When click to resetButton it will show up a alertDialog about Succesfully Reset Password with Lottie.
              Expanded(
                flex: 2,
                child: resetButton(context, viewModel),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding resetButton(BuildContext context, PasswordViewModel viewModel) {
    return Padding(
      padding: context.paddingNormal,
      child: ElevatedButton(
        onPressed: () {
          viewModel.showSuccessAlert(
            context,
            text: LocaleKeys.alert_succes_password_text.locale,
            title: LocaleKeys.alert_succes_password_title.locale,
          );
        },
        child: Center(
          child: Text(
            LocaleKeys.reset.locale,
            style: context.textTheme.headline6?.copyWith(
              color: context.colors.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: context.paddingLow,
          shape: StadiumBorder(),
          backgroundColor: context.colors.onSecondary,
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context, PasswordViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        cursorColor: context.colors.onSecondary,
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              viewModel.isLockChange();
            },
            child: Observer(
              builder: (_) {
                return Icon(
                  viewModel.isLockOpen ? Icons.visibility_off : Icons.visibility,
                  color: context.iconTheme.color,
                );
              },
            ),
          ),
          labelText: LocaleKeys.login_password.locale,
          icon: Icon(
            Icons.lock_outline_rounded,
            size: 30,
            color: context.colors.onSecondary,
          ),
        ),
      );
    });
  }

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.forgotPassword);
}
