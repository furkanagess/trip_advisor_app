import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor_app/core/constants/app/app_constants.dart';
import 'package:trip_advisor_app/core/init/lang/language_manager.dart';
import 'package:trip_advisor_app/core/init/navigation/navigation_router.dart';
import 'package:trip_advisor_app/core/init/navigation/navigation_service.dart';
import 'package:trip_advisor_app/core/init/notifier/app_provider.dart';
import 'package:trip_advisor_app/core/init/notifier/theme_notifier.dart';
import 'package:trip_advisor_app/view/onboard/view/onboard_view.dart';

void main() => runApp(
      MultiProvider(
        providers: [...ApplicationProvider.instance.dependItems],
        child: EasyLocalization(
          child: MyApp(),
          supportedLocales: LanguageManager.instance.supportedLocales,
          path: ApplicationConstants.LANG_ASSET_PATH,
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: OnboardView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
