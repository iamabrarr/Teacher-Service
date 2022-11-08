import 'package:flutter/material.dart';
import 'package:teacher_service/utils/size_config.dart';


class ContinueWithWidget extends StatelessWidget {
  const ContinueWithWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 2,
          width: SizeConfig.widthMultiplier * 30,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey.shade100,
                Colors.grey.shade200,
                Colors.grey.shade400,
                Colors.grey.shade600
              ]),
              borderRadius: BorderRadius.circular(10)),
        ),
        Text(
          "Or continue with",
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.6,
              fontWeight: FontWeight.w700,
              color: Colors.grey),
        ),
        Container(
          height: 2,
          width: SizeConfig.widthMultiplier * 30,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey.shade600,
                Colors.grey.withOpacity(0.4),
                Colors.grey.withOpacity(0.2),
                Colors.grey.withOpacity(0.1)
              ]),
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    );
  }
}
