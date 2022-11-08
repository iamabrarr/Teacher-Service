import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/constants/icons.dart';
import 'package:teacher_service/controllers/buttons_controller.dart';
import 'package:teacher_service/utils/size_config.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<ButtonsController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            2,
            (index) => Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 3),
                  child: GestureDetector(
                    onTap: () {
                      cont.genderIndex.value = index;
                    },
                    child: Obx(
                      () => SizedBox(
                        width: SizeConfig.widthMultiplier * 12,
                        child: Stack(
                          children: [
                            Image.asset(
                              index == 0 ? male : female,
                              height: SizeConfig.heightMultiplier * 5,
                            ),
                            Positioned(
                              right: 0,
                              child: cont.genderIndex.value == index
                                  ? CircleAvatar(
                                      radius: SizeConfig.widthMultiplier * 2.5,
                                      backgroundColor: kSecondaryColor,
                                      child: const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    )
                                  : const SizedBox(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
      ],
    );
  }
}
