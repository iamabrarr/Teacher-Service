import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/constants/icons.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/pages/auth%20flow/forget%20password/forget_password.dart';
import 'package:teacher_service/views/pages/auth%20flow/signup/signup.dart';
import 'package:teacher_service/views/pages/bottom%20nav%20bar/bottom_nav_bar.dart';
import 'package:teacher_service/views/widgets/custom_button.dart';
import 'package:teacher_service/views/widgets/custom_textfield.dart';
import 'components/continue_with_widget.dart';
import 'components/social_button.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kauthScaffoldColor,
      body:  AnimationLimiter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4),
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
                      height: SizeConfig.heightMultiplier * 10,
                    ),
                    Text(
                      "Hello Again!",
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.8,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.5,
                    ),
                    Text(
                      "Welcome back you've\nbeen missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.2,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5,
                    ),
                    CustomTextField(
                        controller: emailCont,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    CustomTextField(
                        controller: passCont,
                        hintText: "Password",
                        keyboardType: TextInputType.emailAddress),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(()=>ForgotPasswordPage(),transition: Transition.leftToRight);
                        },
                        child: Text(
                          "Recovery Password?",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.6,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    CustomButton(
                        text: "Sign in", isBorder: false, onTap: () {
                          Get.to(()=>const BottomNavBar(),transition: Transition.leftToRight);
                        }),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 6,
                    ),
                    const ContinueWithWidget(),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 6,
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
                      height: SizeConfig.heightMultiplier * 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2,
                              color: Colors.grey.shade700),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => SignupPage(),
                                  transition: Transition.downToUp);
                            },
                            child: Text(
                              "Sign Up",
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
