import 'package:flutter/material.dart';
import 'package:teacher_service/constants/colors.dart';
import 'package:teacher_service/utils/size_config.dart';

class RecomendedTiles extends StatelessWidget {
  const RecomendedTiles({
    Key? key,
    required this.index,
    required this.isHomeRecommended,
  }) : super(key: key);
  final int index;
  final bool isHomeRecommended;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 15,
      width: SizeConfig.widthMultiplier * 30,
      margin: EdgeInsets.only(
          left: index == 0
              ? SizeConfig.widthMultiplier * 5
              : SizeConfig.widthMultiplier * 3,
          top: SizeConfig.heightMultiplier * 1.5,
          bottom: SizeConfig.heightMultiplier * 1.5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
          borderRadius: isHomeRecommended
              ? BorderRadius.circular(5)
              : BorderRadius.circular(12)),
      child: Column(
        children: [
          //LESSON IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: SizedBox(
              height: SizeConfig.heightMultiplier * 7,
              width: SizeConfig.widthMultiplier * 30,
              child: Image.network(
                "https://www.teachervision.com/sites/default/files/styles/scale600w/public/vocab-intro-images/subjects-featured-image.png?itok=RUVRAri0964599",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1,
          ),
          //LESSON NAME
          Text(
            "Formations",
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 1.8,
                fontWeight: FontWeight.w700),
          ),
          //RATINGS AND AVIS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: SizeConfig.widthMultiplier * 3,
              ),
              Text(
                " 4.2",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.2,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                " (53 avis)",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: SizeConfig.textMultiplier * 1.2,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 0.5,
          ),
          //PRICE AND TIME INFO
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "10 hours",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.1,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "30\$",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.1,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
