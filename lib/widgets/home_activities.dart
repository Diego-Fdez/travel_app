import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomeActivities extends StatelessWidget {
  const HomeActivities({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var images = {
      'balloning.png': 'Balloning',
      'hiking.png': 'Hiking',
      'kayaking.png': 'Kayaking',
      'snorkling.png': 'Snorkling'
    };

    return Container(
      margin: EdgeInsets.only(top: height / 27),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(
                  text: 'Explore more',
                  size: 22,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: AppText(
                  text: 'See all',
                  color: AppColors.textColor1,
                ),
              )
            ],
          ),
          Container(
            height: height / 6,
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, int index) {
                  return Container(
                    margin:
                        EdgeInsets.only(right: 30, left: index == 0 ? 20 : 0),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'img/${images.keys.elementAt(index)}'),
                                  fit: BoxFit.cover)),
                        ),
                        Center(
                          child: AppText(
                              text: images.values.elementAt(index),
                              color: AppColors.textColor2),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
