import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/constants/icons.dart';
import 'package:teacher_service/constants/images.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/widgets/recomended_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //BLUE CONTAINER
            Positioned(
              top: 0,
              child: Container(
                height: SizeConfig.heightMultiplier * 50,
                width: SizeConfig.widthMultiplier * 100,
                color: kSecondaryColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 6,
                    ),
                    //APPBAR
                    const HomeAppBar(),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1,
                    ),
                    //UPPER IMAGE
                    Image.asset(
                      "assets/images/homeUpperImg.png",
                      height: SizeConfig.heightMultiplier * 25,
                    ),
                  ],
                ),
              ),
            ),

            //WHITE BODY CONTAINER
            Positioned(
              top: SizeConfig.heightMultiplier * 34,
              child: Container(
                height: SizeConfig.heightMultiplier*55,
                width: SizeConfig.widthMultiplier * 100,
                decoration: const BoxDecoration(
                    color: kauthScaffoldColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 5,
                      ),
                      //UPPER ITEMS
                      const HomeUpperItems(),
                      FadeIn(
                        duration: const Duration(seconds: 1),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.heightMultiplier * 2,
                                horizontal: SizeConfig.widthMultiplier * 5),
                            child: Text("Search by category",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: SizeConfig.textMultiplier * 2.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black))),
                      ),
                      const SearchByCategoryItems(),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      FadeIn(
                        duration: const Duration(seconds: 1),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthMultiplier * 5),
                            child: Text("Recomended for you",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: SizeConfig.textMultiplier * 2.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black))),
                      ),
                
                      //RECOMMENDED COURSES
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: AnimationLimiter(
                          child: Row(
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 375),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                horizontalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                              children: [
                                ...List.generate(
                                    6,
                                    (index) => RecomendedTiles(
                                      isHomeRecommended: true,
                                          index: index,
                                        ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: SizeConfig.heightMultiplier * 30, child: HomeSearchBar())
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Lorem Ipsum",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 2.2),
          ),
          CircleAvatar(
            radius: SizeConfig.widthMultiplier * 5,
            backgroundImage: const NetworkImage(staticProfileImage),
          ),
        ],
      ),
    );
  }
}

class SearchByCategoryItems extends StatelessWidget {
  const SearchByCategoryItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map searchByCategoryItems = {
      0: {"Name": "Lessons", "Icon": coursesImage},
      1: {"Name": "Teachers", "Icon": teacherImage},
      2: {"Name": "Trainings", "Icon": trainingImage},
      3: {"Name": "Services", "Icon": servicesImage}
    };
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: AnimationLimiter(
        child: Row(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              ...List.generate(
                  searchByCategoryItems.length,
                  (index) => Container(
                        height: SizeConfig.heightMultiplier * 14,
                        width: SizeConfig.widthMultiplier * 30,
                        margin: EdgeInsets.only(
                            left: index == 0
                                ? SizeConfig.widthMultiplier * 5
                                : SizeConfig.widthMultiplier * 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200, blurRadius: 4)
                            ]),
                        child: Column(
                          children: [
                            Container(
                              height: SizeConfig.heightMultiplier * 10,
                              width: SizeConfig.widthMultiplier * 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          searchByCategoryItems[index]["Icon"]),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 0.7,
                            ),
                            Text(
                              searchByCategoryItems[index]["Name"],
                              style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

class HomeUpperItems extends StatelessWidget {
  const HomeUpperItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final upperItems = {
      0: {"Name": "Planings", "Icon": planings},
      1: {"Name": "Orders", "Icon": orders},
      2: {"Name": "Lessons", "Icon": courses},
      3: {"Name": "Settings", "Icon": settings}
    };
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              upperItems.length,
              (index) => Column(
                    children: [
                      Image.asset(
                        upperItems[index]!["Icon"]!,
                        height: SizeConfig.heightMultiplier * 4,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1,
                      ),
                      Text(
                        upperItems[index]!["Name"]!,
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      )
                    ],
                  ))
        ],
      ),
    );
  }
}
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kauthScaffoldColor,
//       body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         SizedBox(
//           height: SizeConfig.widthMultiplier * 10,
//         ),
//         const HomeAppBar(),
//         SizedBox(
//           height: SizeConfig.heightMultiplier * 3,
//         ),
//         FadeIn(
//           duration: const Duration(seconds: 1),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.widthMultiplier * 5),
//             child: RichText(
//                 text: TextSpan(children: [
//               TextSpan(
//                   text: "Explore ",
//                   style: TextStyle(
//                       fontFamily: "Nunito",
//                       fontSize: SizeConfig.textMultiplier * 3.5,
//                       fontWeight: FontWeight.w700,
//                       color: kPrimaryColor)),
//               TextSpan(
//                   text: "For You",
//                   style: TextStyle(
//                       fontFamily: "Nunito",
//                       fontSize: SizeConfig.textMultiplier * 3.5,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.grey.shade400))
//             ])),
//           ),
//         ),
//         const FadeIn(duration: Duration(seconds: 1), child: HomeSearchBar()),
//         SizedBox(
//           height: SizeConfig.heightMultiplier * 1,
//         ),
//         const FadeIn(
//             duration: Duration(seconds: 1), child: BelowSearchBarItems()),
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: SizeConfig.widthMultiplier * 5,
//               vertical: SizeConfig.heightMultiplier * 2),
//           child: Text(
//             "Search By Category",
//             style: TextStyle(
//                 fontSize: SizeConfig.textMultiplier * 2.3,
//                 fontWeight: FontWeight.w700),
//           ),
//         ),
//         SizedBox(
//           height: SizeConfig.heightMultiplier * 1,
//         ),
//         const SearchByCategoryItems(),
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: SizeConfig.widthMultiplier * 5,
//               vertical: SizeConfig.heightMultiplier * 2),
//           child: Text(
//             "Recomended For You",
//             style: TextStyle(
//                 fontSize: SizeConfig.textMultiplier * 2.3,
//                 fontWeight: FontWeight.w700),
//           ),
//         ),
//       ]),
//     );
//   }
// }

class BelowSearchBarItems extends StatelessWidget {
  const BelowSearchBarItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map belowSearchBarItems = {
      0: {"Name": "Planings", "Icon": planings},
      1: {"Name": "Orders", "Icon": orders},
      2: {"Name": "Courses", "Icon": courses}
    };
    return Row(
      children: [
        ...List.generate(
            belowSearchBarItems.length,
            (index) => Container(
                  margin: EdgeInsets.only(
                      left: index == 0
                          ? SizeConfig.widthMultiplier * 5
                          : SizeConfig.widthMultiplier * 3),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4,
                      vertical: SizeConfig.heightMultiplier * 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        belowSearchBarItems[index]["Icon"],
                        height: SizeConfig.heightMultiplier * 2.2,
                        color: colors[index].withOpacity(0.8),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2,
                      ),
                      Text(
                        belowSearchBarItems[index]["Name"],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.textMultiplier * 1.7,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ))
      ],
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 0.6),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5,
          vertical: SizeConfig.heightMultiplier * 1),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
      child: Row(
        children: [
          Icon(FeatherIcons.search, color: Colors.grey.shade400),
          SizedBox(
            width: SizeConfig.widthMultiplier * 3,
          ),
          const Text(
            "Search here... ",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
