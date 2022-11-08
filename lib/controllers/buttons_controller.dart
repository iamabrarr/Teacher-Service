import 'package:get/state_manager.dart';

class ButtonsController extends GetxController{
  //FOR AUTH
  RxBool passwordShow=false.obs;
  RxInt genderIndex=(-1).obs;

  //FOR BOTTOM NAV BAR
  RxInt bnbSelectedIndex=0.obs;

}