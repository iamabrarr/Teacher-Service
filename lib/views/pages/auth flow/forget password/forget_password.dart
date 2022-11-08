import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/pages/auth%20flow/otp/otp.dart';
import 'package:teacher_service/views/widgets/custom_button.dart';
import 'package:teacher_service/views/widgets/custom_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  TextEditingController forgotPassCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
     AnimationLimiter(
            child: Padding(
                padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 100.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                     SizedBox(
                height: SizeConfig.heightMultiplier * 8,
              ),
              const Align(alignment: Alignment.topLeft, child: BackButton()),
              
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 3,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              Text(
                "Type in your registered email address\nbelow",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              CustomTextField(
                  controller: forgotPassCont,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email"),
              SizedBox(
                height: SizeConfig.heightMultiplier * 6,
              ),
              CustomButton(
                  text: "Next",
                  isBorder: false,
                  onTap: () {
                    Get.to(()=>OtpPage(numberOrEmail: forgotPassCont.text, isNumber: false),transition: Transition.leftToRight);
                  })
                  ],
                ),
              ),
            ),
          ),
      
      
    );
  }
}