import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/constants/images.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/widgets/custom_button.dart';

import 'components/row_info.dart';

class ProfilePage extends StatelessWidget {
  TextEditingController cityCont = TextEditingController(text: "Islamabad");
  TextEditingController stateCont = TextEditingController(text: "Punjab");
  TextEditingController zipCode = TextEditingController(text: "65400");
  TextEditingController streetAddress =
      TextEditingController(text: "Model Town");
  TextEditingController streetAddressTwo =
      TextEditingController(text: "Street # 2");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 6),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "   My Profile",
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 3,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                CircleAvatar(
                  backgroundColor: kPrimaryColor.withOpacity(0.1),
                  radius: SizeConfig.widthMultiplier * 11,
                  backgroundImage: NetworkImage(staticProfileImage),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Text(
                  "Lorem Ipsum",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 2.5,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit Name",
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 1.8,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Container(
                  color: Colors.white,
                  width: SizeConfig.widthMultiplier * 100,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * 3,
                      horizontal: SizeConfig.widthMultiplier * 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileRowInfo(
                        title: "Email",
                        subtitle: "Lorem@gmail.com",
                        onTap: () {
                          //Simple to use, no global configuration
                          // showToast("hello styled toast", context: context);
                        },
                      ),
                       ProfileRowInfo(
                        title: "Occupation",
                        subtitle: "Student",
                        onTap: () {
                          // showModalBottomSheet(
                          //     isScrollControlled: true,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(15)),
                          //     context: context,
                          //     builder: (_) => EditInfoBottomSheet(
                          //           controller: streetAddress,
                          //           heading: "Street address",
                          //           onEdit: () {},
                          //         ));
                        },
                      ),
                      ProfileRowInfo(
                        title: "Address",
                        subtitle:"Update",
                        onTap: () {
                          // showModalBottomSheet(
                          //     isScrollControlled: true,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(15)),
                          //     context: context,
                          //     builder: (_) => EditInfoBottomSheet(
                          //           controller: cityCont,
                          //           heading: "City",
                          //           onEdit: () {},
                          //         ));
                        },
                      ),
                      
                      ProfileRowInfo(
                        title: "Zip Code",
                        subtitle: "Update",
                        onTap: () {
                          // showModalBottomSheet(
                          //     isScrollControlled: true,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(15)),
                          //     context: context,
                          //     builder: (_) => EditInfoBottomSheet(
                          //           controller: zipCode,
                          //           heading: "Zip Code",
                          //           onEdit: () {},
                          //         ));
                        },
                      ),
                      
                      // ProfileRowInfo(
                      //   title: "Street address two",
                      //   subtitle: "Update",
                      //   onTap: () {
                      //     showModalBottomSheet(
                      //         isScrollControlled: true,
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(15)),
                      //         context: context,
                      //         builder: (_) => EditInfoBottomSheet(
                      //               controller: streetAddressTwo,
                      //               heading: "Street address two",
                      //               onEdit: () {},
                      //             ));
                      //   },
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 6,
                ),
                CustomButton(
                  onTap: () async {},
                  text: "Log out",
                  isBorder: false,
                )
              ],
            )));
  }
}
