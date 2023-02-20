import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_advisor_app/core/base/view/base_view.dart';
import 'package:trip_advisor_app/core/constants/svg/svg_constants.dart';
import 'package:trip_advisor_app/core/extension/context_extension.dart';
import 'package:trip_advisor_app/core/extension/string_extension.dart';
import 'package:trip_advisor_app/core/init/lang/locale_keys.g.dart';
import 'package:trip_advisor_app/view/auth/login/viewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, value) => Scaffold(
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
                child: buildMailTextField(context),
              ),
              Expanded(
                flex: 2,
                child: buildPasswordTextField(context),
              ),
              Expanded(
                flex: 2,
                child: loginButton(context),
              ),
              Expanded(
                flex: 1,
                child: forgotText(context),
              ),
              Expanded(
                flex: 1,
                child: signupRow(context),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Row signupRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Spacer(),
        Text(
          LocaleKeys.login_first.locale,
          style: context.textTheme.bodyText2,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            LocaleKeys.login_signup.locale,
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

  Text forgotText(BuildContext context) {
    return Text(
      LocaleKeys.login_forgot.locale,
      style: context.textTheme.bodyText2,
    );
  }

  Padding loginButton(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: ElevatedButton(
        onPressed: () {},
        child: Center(
          child: Text(
            LocaleKeys.login_login.locale,
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

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.welcome);
}
