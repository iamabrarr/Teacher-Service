import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/icons.dart';
import 'package:teacher_service/controllers/buttons_controller.dart';
import '../../utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.keyboardType})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    final cont = Get.find<ButtonsController>();
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 1),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(6, 6))
      ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        obscureText: hintText == "Password" || hintText == "Confirm Password"
            ? cont.passwordShow.value
            : false,
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: hintText == "Password"
                ? IconButton(
                    onPressed: () {
                      cont.passwordShow.value=!cont.passwordShow.value;
                    },
                    icon: Obx(
                      ()=> Image.asset(
                      cont.passwordShow.value?  passwordEye:passwordEyeOff,
                        height: SizeConfig.heightMultiplier * 3,
                        color: Colors.grey.shade400,
                      ),
                    ))
                : null,
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey.shade500)),
      ),
    );
  }
}
