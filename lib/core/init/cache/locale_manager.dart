// import 'package:shared_preferences/shared_preferences.dart';

// class LocaleManager {
//   static LocaleManager _instance = LocaleManager._init();

//   SharedPreferences _preferences;

//   static LocaleManager get instance => _instance;
// ***********ERROR**********
//   LocaleManager._init() {
//     SharedPreferences.getInstance().then((value) {
//       _preferences = value;
//     });
//   }

//   static preferencesInit() async {
//     if (instance._preferences == null) {
//       instance._preferences = await SharedPreferences.getInstance();
//     }
//     return;
//   }
// }
