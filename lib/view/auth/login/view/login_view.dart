import 'package:flutter/material.dart';
import 'package:trip_advisor_app/core/base/view/base_view.dart';
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
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_backspace_outlined,
              color: context.iconTheme.color,
              size: context.iconTheme.size,
            ),
          ),
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text(
                        "Log in",
                        style: context.textTheme.headline3?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.secondary,
                        ),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    icon: Icon(
                      Icons.person_outline_outlined,
                      size: 30,
                    ),
                    hintText: "Enter your name",
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: context.textTheme.headline5?.copyWith(
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
                SizedBox(
                  height: context.dynamicHeight(0.03),
                ),
                Text(
                  "Forgot Password ?",
                  style: context.textTheme.bodyText1,
                ),
                SizedBox(
                  height: context.dynamicHeight(0.03),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    Text(
                      "Here for the first time ?   ",
                      style: context.textTheme.bodyText1,
                    ),
                    Text(
                      "Sign up",
                      style: context.textTheme.bodyText1?.copyWith(
                        color: context.colors.onSecondary,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
