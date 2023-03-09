import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:demo/app/core/theme/color_theme.schemes.g.dart';
import 'package:demo/app/core/theme/text_theme.schemes.g.dart';
import 'package:demo/app/modules/Home/Home.Binding.dart';
import 'package:demo/app/modules/Home/Home.Page.dart';
import 'package:demo/app/routes/pages.dart';
import 'package:demo/app/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.INITIAL,
          initialBinding: HomeBinding(),
          defaultTransition: Transition.fade,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            colorScheme: lightColorScheme,
            useMaterial3: true,
            textTheme: textThemeScheme,
          ),
          getPages: AppPages.pages,
          home: HomePage(),
        );
      },
    );
  }
}
