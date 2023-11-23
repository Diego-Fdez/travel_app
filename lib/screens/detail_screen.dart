import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is DetailState) {
          DetailState detail = state as DetailState;

          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: height / 2.6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://mark.bslmeiyu.com/uploads/${detail.place.img}'),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                    left: 20,
                    top: height / 16,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        )
                      ],
                    )),
                Positioned(
                    top: height / 3,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: height * 0.03),
                      width: width,
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: '\$ ${detail.place.price.toString()}',
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: AppColors.mainColor),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                  text: detail.place.location,
                                  color: AppColors.textColor1),
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                }),
                              ),
                              const SizedBox(width: 10),
                              AppText(
                                text: '${detail.place.stars.toString()}.0',
                                color: AppColors.textColor2,
                              )
                            ],
                          ),
                          SizedBox(height: height * 0.025),
                          AppLargeText(
                            text: 'People',
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(height: height * 0.005),
                          AppText(
                              text: 'Number of people in your group',
                              color: AppColors.mainTextColor),
                          SizedBox(height: height * 0.02),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    size: 50,
                                    text: (index + 1).toString(),
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: height * 0.02),
                          AppLargeText(
                            text: 'Description',
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(height: height * 0.02),
                          AppText(
                            text: detail.place.description,
                            color: AppColors.mainTextColor,
                          )
                        ],
                      ),
                    )),
                Positioned(
                    bottom: height * 0.02,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          size: 60,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        const SizedBox(width: 20),
                        ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    )),
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
