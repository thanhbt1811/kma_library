import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';

import 'app_pages.dart';
import 'theme/theme_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return GetMaterialApp(
          smartManagement: SmartManagement.onlyBuilder,
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          initialRoute: AppRoutes.splash,
          getPages: myPages,
          translations: AppTranslations(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: appSupportedLocales,
          locale: appSupportedLocales.first,
          fallbackLocale: appSupportedLocales.first,
          theme: appTheme,
          builder: (context, child) {
            var a = Navigator();
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                hideKeyboard();
              },
              child: child,
            );
          },
        );
      },
    );
  }
}
