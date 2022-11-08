import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/pages/auth%20flow/login/login.dart';
import 'package:teacher_service/views/pages/auth%20flow/otp/otp.dart';
import 'package:teacher_service/views/pages/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              theme: ThemeData(
                primaryColor: kPrimaryColor,
                
                  fontFamily: 'Lato', scaffoldBackgroundColor: Colors.white),
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
            );
          },
        );
      },
    );
  }
}
