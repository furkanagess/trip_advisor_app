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
          padding: context.paddingLow,
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
                  decoration: InputDecoration(),
                ),
                TextFormField(),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
