import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trip_advisor_app/core/extension/string_extension.dart';
import 'package:trip_advisor_app/core/init/lang/locale_keys.g.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(LocaleKeys.welcome.locale),
        ],
      ),
    );
  }
}
