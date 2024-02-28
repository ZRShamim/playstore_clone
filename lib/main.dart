import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:playstore_clone/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 780),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Play Store Clone',
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: widget!,
          );
        },
        theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        initialRoute: Routes.playstorePage,
        getPages: Routes.list,
        navigatorKey: Get.key,
        // home: LocalStorage.isTokenAvailable() ? HomePage() : LoginPage(),
      ),
    );
  }
}
