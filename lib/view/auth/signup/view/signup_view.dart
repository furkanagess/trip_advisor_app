import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_advisor_app/core/base/view/base_view.dart';
import 'package:trip_advisor_app/core/extension/context_extension.dart';
import 'package:trip_advisor_app/core/extension/string_extension.dart';
import 'package:trip_advisor_app/view/auth/signup/viewModel/signup_view_model.dart';

import '../../../../core/constants/svg/svg_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SignUpViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: context.colors.background,
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
              Expanded(
                flex: 2,
                child: buildNameTextField(context),
              ),
              Expanded(
                flex: 2,
                child: buildMailTextField(context),
              ),
              // Add dynamic eye icon for obscure password using Mobx
              Expanded(
                flex: 2,
                child: buildPasswordTextField(context),
              ),
              // When click to signupButton it will show up a alertDialog about Succesfully Register with Lottie.
              Expanded(
                flex: 2,
                child: signupButton(context),
              ),
              Expanded(
                flex: 1,
                child: loginRow(context, viewModel),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Row loginRow(BuildContext context, SignUpViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Spacer(),
        Text(
          LocaleKeys.signup_account.locale,
          style: context.textTheme.bodyText2,
        ),
        InkWell(
          onTap: () {
            viewModel.navigateToLogin();
          },
          child: Text(
            LocaleKeys.login_login.locale,
            style: context.textTheme.bodyText1?.copyWith(
              color: context.colors.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Padding signupButton(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: ElevatedButton(
        onPressed: () {},
        child: Center(
          child: Text(
            LocaleKeys.login_signup.locale,
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

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      cursorColor: context.colors.onSecondary,
      obscureText: true,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_password.locale,
        icon: Icon(
          Icons.lock_outline_rounded,
          size: 30,
          color: context.colors.onSecondary,
        ),
      ),
    );
  }

  TextFormField buildNameTextField(BuildContext context) {
    return TextFormField(
      cursorColor: context.colors.onSecondary,
      decoration: InputDecoration(
        focusColor: context.colors.onSecondary,
        labelText: LocaleKeys.signup_name.locale,
        icon: Icon(
          Icons.person_outline_outlined,
          size: 30,
          color: context.colors.onSecondary,
        ),
      ),
    );
  }

  TextFormField buildMailTextField(BuildContext context) {
    return TextFormField(
      cursorColor: context.colors.onSecondary,
      decoration: InputDecoration(
        focusColor: context.colors.onSecondary,
        labelText: LocaleKeys.login_mail.locale,
        icon: Icon(
          Icons.mail_outline,
          size: 30,
          color: context.colors.onSecondary,
        ),
      ),
    );
  }

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.mobileLogin);
}
