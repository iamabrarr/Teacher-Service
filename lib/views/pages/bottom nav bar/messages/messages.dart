import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/utils/size_config.dart';
import 'package:teacher_service/views/widgets/recomended_tile.dart';

import 'components/message_tile.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kauthScaffoldColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 5,
          ),
          MessageSearchBar(),
          Text(
            "   Recommended For You",
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2.5,
                fontWeight: FontWeight.w700),
          ),
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
                          isHomeRecommended: false,
                              index: index,
                            ))
                  ],
                ),
              ),
            ),
          ),
          // Text(
          //   "   Messages",
          //   style: TextStyle(
          //       fontSize: SizeConfig.textMultiplier * 2.5,
          //       fontWeight: FontWeight.w700),
          // ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          Expanded(
            child: AnimationLimiter(
                child: ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 2500),
                      child:
                          //IF MESSAGES IS LOADED

                          GestureDetector(
                        onTap: () {},
                        child: MessageTile(
                          index: index,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
          )
        ]));
  }
}


class MessageSearchBar extends StatelessWidget {
  TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1),
      child: Row(
        children: [
          const BackButton(),
          SizedBox(
            width: SizeConfig.widthMultiplier * 2,
          ),
          Container(
            height: SizeConfig.heightMultiplier * 6,
            width: SizeConfig.widthMultiplier * 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            margin:
                EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 3),
            child: Row(
              children: [
                Icon(FeatherIcons.search, color: Colors.grey.shade400),
                SizedBox(
                  width: SizeConfig.textMultiplier * 2,
                ),
                Expanded(
                  child: TextField(
                    controller: searchCont,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here...",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.filter))
        ],
      ),
    );
  }
}
