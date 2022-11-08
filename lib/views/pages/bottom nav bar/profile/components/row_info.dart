import 'package:flutter/material.dart';
import 'package:teacher_service/constants/colors.dart';
import '../../../../../utils/size_config.dart';

class ProfileRowInfo extends StatelessWidget {
  const ProfileRowInfo({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);
  final String title, subtitle;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.widthMultiplier*100,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title == "Email" || title == "Type" || title == "Website" || title=="Policy Name" || title=="Name"
                ? const SizedBox()
                : Divider(
                    color: kauthScaffoldColor,
                    thickness: 1,
                    height: SizeConfig.heightMultiplier * 5,
                  ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.8,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.8,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}