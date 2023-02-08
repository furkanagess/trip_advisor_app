import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor_app/core/constants/app/app_constants.dart';
import 'package:trip_advisor_app/core/init/lang/language_manager.dart';
import 'package:trip_advisor_app/core/init/notifier/app_provider.dart';
import 'package:trip_advisor_app/core/init/notifier/theme_notifier.dart';
import 'package:trip_advisor_app/view/onboard/view/onboard_view.dart';

void main() => runApp(
      EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: MaterialApp(
        theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
        home: OnboardView(),
      ),
    );
  }
}
