import 'package:qotoon/Shared/Constants/app_strings.dart';
import 'package:qotoon/Shared/storage.dart';

Map<String, dynamic> headersMapWithoutToken() {
  Map<String, dynamic> headersData = {
    'Content-Type': 'multipart/form-data;',
    "Accept": "application/json",
  };
  return headersData;
}

Map<String, dynamic> headersMapWithToken() {
  Map<String, dynamic> headersData = {
    "Accept": "application/json",
    "Authorization":
        "Bearer ${AppSharedPreferences.getString(key: AppStrings.accessToken)}"
  };
  return headersData;
}

Map<String, String> headersData = {
  "Accept": "application/json",
  "Authorization":
      "Bearer ${AppSharedPreferences.getString(key: AppStrings.accessToken)}"
};
// Future<Map<String, dynamic>> headersMap() async {
//   await Prefs.init();
//   Map<String, dynamic> headersData = {
//     'Authorization': 'Bearer ${Prefs.getString("Token")}',
//     "Accept": "application/json;*/*",
//     "Accept-Language": Prefs.getString('language').isNotEmpty
//         ? Prefs.getString('language')
//         : 'ar'
//   };
//   return headersData;
// }
