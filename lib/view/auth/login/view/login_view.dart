import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_advisor_app/core/base/view/base_view.dart';
import 'package:trip_advisor_app/core/constants/svg/svg_constants.dart';
import 'package:trip_advisor_app/core/extension/context_extension.dart';
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
                child: SvgPicture.asset(SVGConstants.instance.welcome),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  cursorColor: context.colors.onSecondary,
                  decoration: InputDecoration(
                    focusColor: context.colors.onSecondary,
                    labelText: "Mail",
                    icon: Icon(
                      Icons.mail_outline,
                      size: 30,
                      color: context.colors.onSecondary,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  cursorColor: context.colors.onSecondary,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      size: 30,
                      color: context.colors.onSecondary,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: context.paddingNormal,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: context.textTheme.headline6?.copyWith(
                          color: context.colors.background,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: context.paddingLow,
                      shape: StadiumBorder(),
                      backgroundColor: context.colors.onSecondary,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Forgot Password ?",
                  style: context.textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    Text(
                      "Here for the first time ?   ",
                      style: context.textTheme.bodyText2,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Sign up",
                        style: context.textTheme.bodyText1?.copyWith(
                          color: context.colors.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
