import 'package:flutter/material.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isBorder,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool isBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.heightMultiplier * 7,
        width: SizeConfig.widthMultiplier * 90,
        decoration: BoxDecoration(
            color: isBorder ? null : kSecondaryColor,
            border: isBorder ? Border.all(color: kPrimaryColor, width: 2) : null,
            boxShadow: isBorder
                ? null
                : [
                    BoxShadow(
                        color: kPrimaryColor.withOpacity(0.5), blurRadius: 6)
                  ],
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.w700,
                color: isBorder ? kPrimaryColor : Colors.white),
          ),
        ),
      ),
    );
  }
}
