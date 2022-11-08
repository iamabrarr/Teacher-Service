import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 9,
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(6, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 5,
          right: SizeConfig.widthMultiplier * 5,
          bottom: SizeConfig.heightMultiplier * 1),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
      child: Stack(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: SizeConfig.heightMultiplier * 3.5,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    backgroundImage: const NetworkImage(
                        "https://pgc.edu/wp-content/uploads/2021/05/How-to-Become-a-Special-Education-Teacher.jpg"),
                  ),
                  index == 0 || index == 3
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: SizeConfig.widthMultiplier * 2,
                            backgroundColor: Colors.green,
                          ))
                      : const SizedBox()
                ],
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Will smith",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: SizeConfig.textMultiplier * 1.6,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        index != 0
                            ? FeatherIcons.arrowUpRight
                            : FeatherIcons.arrowDownRight,
                        color: index == 0 ? kPrimaryColor : Colors.blueGrey,
                        size: 14,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 60,
                        child: Text(
                          "Hey Sir, I am interested in your work...",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: SizeConfig.textMultiplier * 1.5,
                              fontWeight: FontWeight.w500,
                              color:
                                  index == 0 ? kPrimaryColor : Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
              top: SizeConfig.heightMultiplier * 1.5,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "9 minutes ago",
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.2),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  index == 0
                      ? Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier * 2),
                          child: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: SizeConfig.widthMultiplier * 1,
                          ),
                        )
                      : const SizedBox()
                ],
              ))
        ],
      ),
    );
  }
}
