import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/pages/auth%20flow/otp/components/otp_textfield.dart';
import 'package:teacher_service/views/pages/bottom%20nav%20bar/bottom_nav_bar.dart';
import 'package:teacher_service/views/widgets/custom_button.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key, required this.numberOrEmail, required this.isNumber})
      : super(key: key);
  final String numberOrEmail;
  final bool isNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:SafeArea(
          child:
          AnimationLimiter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier * 2,
                horizontal: SizeConfig.widthMultiplier * 5),
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
                     Align(alignment: Alignment.topLeft, child: BackButton(onPressed: (){
                      Get.back();
                     },)),
               
                Text(
                  "Verification",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 3,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Text(
                  "A 4-digit code has been sent to",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  numberOrEmail,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      OtpField(first: true, last: false),
                      OtpField(first: false, last: false),
                      OtpField(first: false, last: false),
                      OtpField(first: false, last: true),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                CustomButton(text: "Submit",isBorder: false, onTap: () {Get.to(()=>const BottomNavBar(),transition: Transition.leftToRight);}),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                const Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                  ],
                ),
              ),
            ),
          ),
           
      ),
    );
  }
}
