import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/controllers/buttons_controller.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/pages/bottom%20nav%20bar/annouces/announces.dart';
import 'package:teacher_service/views/pages/bottom%20nav%20bar/courses/courses.dart';
import 'package:teacher_service/views/pages/bottom%20nav%20bar/home/home.dart';
import 'package:teacher_service/views/pages/bottom%20nav%20bar/messages/messages.dart';
import 'package:teacher_service/views/pages/bottom%20nav%20bar/profile/profile.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<ButtonsController>();
    List<Widget> classes =  [
      const HomePage(),
      MessagesPage(),
     const CoursesPage(),
     const AnnoucesPage(),
      ProfilePage()
    ];
    return Obx(
      () => Scaffold(
        body: classes.elementAt(cont.bnbSelectedIndex.value),
        bottomNavigationBar: FlashyTabBar(
          height: SizeConfig.heightMultiplier * 7,
          selectedIndex: cont.bnbSelectedIndex.value,
          showElevation: true,
          onItemSelected: (index) => cont.bnbSelectedIndex.value = index,
          items: [
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: const Icon(
                FeatherIcons.home,
              ),
              title: const Text(
                'Home',
              ),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: const Icon(FeatherIcons.messageCircle),
              title: const Text('Message'),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: const Icon(FeatherIcons.bookOpen),
              title: const Text('Courses'),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: const Icon(FeatherIcons.bell),
              title: const Text('Announces'),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: const Icon(FeatherIcons.user),
              title: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
