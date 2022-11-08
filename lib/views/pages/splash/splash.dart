import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/icons.dart';
import 'package:teacher_service/controllers/buttons_controller.dart';
import 'package:teacher_service/views/pages/auth%20flow/select%20login/select_login.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Get.put(ButtonsController());
    Future.delayed(const Duration(seconds: 3),()=>Get.off(()=> SelectLoginPage(),transition:Transition.leftToRight));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: Image.asset(appIconGif),),
    );
  }
}