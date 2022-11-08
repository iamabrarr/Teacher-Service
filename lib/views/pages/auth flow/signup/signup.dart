import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/constants/icons.dart';
import 'package:teacher_service/controllers/buttons_controller.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/pages/auth%20flow/login/components/continue_with_widget.dart';
import 'package:teacher_service/views/pages/auth%20flow/login/components/social_button.dart';
import 'package:teacher_service/views/pages/auth%20flow/otp/otp.dart';
import 'package:teacher_service/views/widgets/custom_button.dart';
import 'package:teacher_service/views/widgets/custom_textfield.dart';

import 'components/choose_gender.dart';

class SignupPage extends StatelessWidget {
  TextEditingController nameCont = TextEditingController();
  TextEditingController occupationCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<ButtonsController>();
    return Scaffold(
      backgroundColor: kauthScaffoldColor,
      body: AnimationLimiter(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: SizeConfig.heightMultiplier * 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: BackButton(
                            onPressed: () {
                              Get.back();
                            },
                          )),
                      Text(
                        "Create account!",
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2.8,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  CustomTextField(
                      controller: nameCont,
                      hintText: "Name",
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  CustomTextField(
                      controller: emailCont,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  CustomTextField(
                      controller: occupationCont,
                      hintText: "Occupation",
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  CustomTextField(
                      controller: passCont,
                      hintText: "Password",
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " Select Gender",
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.2,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  const SelectGender(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  CustomButton(
                      text: "Sign up",
                      isBorder: false,
                      onTap: () {
                        Get.to(
                            () => const OtpPage(
                                numberOrEmail: "Lorem@gmail.com",
                                isNumber: false),
                            transition: Transition.rightToLeft);
                      }),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  const ContinueWithWidget(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        onTap: () {},
                        icon: googleIcon,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 4,
                      ),
                      SocialLoginButton(
                        onTap: () {},
                        icon: facebookIcon,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: Colors.grey.shade700),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2,
                                color: kPrimaryColor,
                                decoration: TextDecoration.underline),
                          ))
                    ],
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
