import 'package:flutter/material.dart';
import 'package:selivery_driver/core/helper/notifictions_helper.dart';
import 'package:selivery_driver/core/widgets/custom_loading_widget.dart';
import '../../features/home/views/mytripsscreen.dart';
import '../../features/home/views/trips.dart';
import 'custom_image.dart';
import 'responsive_text.dart';
import '../functions/global_function.dart';
import '../rescourcs/app_colors.dart';

PreferredSize customAppBar(context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150),
    child: Container(
      width: screenSize(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),
              // Container(
              //   height: 40,
              //   width: screenSize(context).width,
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(
              //       color: AppColors.primaryColor,
              //       borderRadius: BorderRadius.circular(20),
              //       border: Border.all(color: Colors.white, width: 2)),
              //   child: const TextField(
              //     decoration: InputDecoration(
              //         suffixIcon: Icon(
              //           Icons.search,
              //           color: AppColors.white,
              //           size: 25,
              //         ),
              //         contentPadding: EdgeInsets.only(right: 20),
              //         hintText: 'ابحث',
              //         hintStyle: TextStyle(color: AppColors.white),
              //         enabledBorder: InputBorder.none,
              //         border: InputBorder.none,
              //         disabledBorder: InputBorder.none),
              //   ),
              // ),
              Image.asset(
                'assets/logo2.jpeg',
                height: 80,
                fit: BoxFit.fill,
              ),
            ],
          ),
          // Positioned(
          //   bottom: 5,
          //   left: 5,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Visibility(
          //         visible:true,// sharedPreferences.getBool(isDriver) ?? false,
          //         child: Positioned(
          //           bottom: 5,
          //           left: 5,
          //           child: InkWell(
          //             onTap:(){
          //               navigateTo(const TripsScreen());
          //             },// () => navigateTo(const OrdersView()),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 const ResponsiveText(
          //                   text: 'الطلبات',
          //                   scaleFactor: .03,
          //                   color: AppColors.white,
          //                 ),
          //                 Stack(
          //                   alignment: Alignment.topRight,
          //                   children: [
          //                     Card(
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(5.0),
          //                         child: CustomAssetsImage(
          //                           path: 'assets/Uber Taxi.png',
          //                         ),
          //                       ),
          //                     ),
          //                      StreamBuilder<int>(
          //                        stream: FirebaseMessagingService.not,
          //                        builder: (context,AsyncSnapshot<int> snapshot) {
          //                          print("notifications ${snapshot.data}");
          //                          if(snapshot.hasData){
          //                            return CircleAvatar(
          //                              backgroundColor: Colors.red,
          //                              radius: 8,
          //                              child: ResponsiveText(
          //                                text: '${snapshot.data}',
          //                                scaleFactor: .02,
          //                                color: AppColors.white,
          //                              ),
          //                            );
          //                          }else if(snapshot.hasError){
          //                            return Container();
          //                          }else{
          //                            return Container();;
          //                          }
          //
          //                        }
          //                      ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Visibility(
          //         visible:true,// sharedPreferences.getBool(isDriver) ?? false,
          //         child: Positioned(
          //           bottom: 5,
          //           left: 5,
          //           child: InkWell(
          //             onTap:(){
          //               navigateTo(const MyTripsScreen());
          //             },// () => navigateTo(const OrdersView()),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 const ResponsiveText(
          //                   text: 'الرحالات',
          //                   scaleFactor: .03,
          //                   color: AppColors.white,
          //                 ),
          //                 Stack(
          //                   alignment: Alignment.topRight,
          //                   children: [
          //                     Card(
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(5.0),
          //                         child: CustomAssetsImage(
          //                           path: 'assets/Uber Taxi.png',
          //                         ),
          //                       ),
          //                     ),
          //                      Container(),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}


  // PreferredSize customAppBarForHome(context) {
  //   return PreferredSize(
  //     preferredSize: const Size.fromHeight(150),
  //     child: Container(
  //       width: screenSize(context).width,
  //       decoration: const BoxDecoration(
  //         color: AppColors.primaryColor,
  //         borderRadius: BorderRadius.only(
  //           bottomLeft: Radius.circular(20),
  //           bottomRight: Radius.circular(20),
  //         ),
  //       ),
  //       child: Stack(
  //         children: [
  //           Column(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               const SizedBox(height: 50),
  //               // Container(
  //               //   height: 40,
  //               //   width: screenSize(context).width,
  //               //   margin: const EdgeInsets.symmetric(horizontal: 10),
  //               //   decoration: BoxDecoration(
  //               //       color: AppColors.primaryColor,
  //               //       borderRadius: BorderRadius.circular(20),
  //               //       border: Border.all(color: Colors.white, width: 2)),
  //               //   child: const TextField(
  //               //     decoration: InputDecoration(
  //               //         suffixIcon: Icon(
  //               //           Icons.search,
  //               //           color: AppColors.white,
  //               //           size: 25,
  //               //         ),
  //               //         contentPadding: EdgeInsets.only(right: 20),
  //               //         hintText: 'ابحث',
  //               //         hintStyle: TextStyle(color: AppColors.white),
  //               //         enabledBorder: InputBorder.none,
  //               //         border: InputBorder.none,
  //               //         disabledBorder: InputBorder.none),
  //               //   ),
  //               // ),
  //               Image.asset(
  //                 'assets/logo.png',
  //                 height: 80,
  //                 fit: BoxFit.fill,
  //               ),
  //             ],
  //           ),
  //           Positioned(
  //             bottom: 5,
  //             left: 5,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 Visibility(
  //                   visible:true,// sharedPreferences.getBool(isDriver) ?? false,
  //                   child: Positioned(
  //                     bottom: 5,
  //                     left: 5,
  //                     child: InkWell(
  //                       onTap:(){
  //                         navigateTo(const TripsScreen());
  //                       },// () => navigateTo(const OrdersView()),
  //                       child: Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           const ResponsiveText(
  //                             text: 'الطلبات',
  //                             scaleFactor: .03,
  //                             color: AppColors.white,
  //                           ),
  //                           Stack(
  //                             alignment: Alignment.topRight,
  //                             children: [
  //                               Card(
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.all(5.0),
  //                                   child: CustomAssetsImage(
  //                                     path: 'assets/Uber Taxi.png',
  //                                   ),
  //                                 ),
  //                               ),
  //                               StreamBuilder<int>(
  //                                   stream: FirebaseMessagingService.not,
  //                                   builder: (context,AsyncSnapshot<int> snapshot) {
  //                                     print("notifications ${snapshot.data}");
  //                                     if(snapshot.hasData){
  //                                       return CircleAvatar(
  //                                         backgroundColor: Colors.red,
  //                                         radius: 8,
  //                                         child: ResponsiveText(
  //                                           text: '${snapshot.data}',
  //                                           scaleFactor: .02,
  //                                           color: AppColors.white,
  //                                         ),
  //                                       );
  //                                     }else if(snapshot.hasError){
  //                                       return Container();
  //                                     }else{
  //                                       return Container();
  //                                     }

  //                                   }
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Visibility(
  //                   visible:true,// sharedPreferences.getBool(isDriver) ?? false,
  //                   child: Positioned(
  //                     bottom: 5,
  //                     left: 5,
  //                     child: InkWell(
  //                       onTap:(){
  //                         navigateTo(const MyTripsScreen());
  //                       },// () => navigateTo(const OrdersView()),
  //                       child: Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           const ResponsiveText(
  //                             text: 'الرحالات',
  //                             scaleFactor: .03,
  //                             color: AppColors.white,
  //                           ),
  //                           Stack(
  //                             alignment: Alignment.topRight,
  //                             children: [
  //                               Card(
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.all(5.0),
  //                                   child: CustomAssetsImage(
  //                                     path: 'assets/Uber Taxi.png',
  //                                   ),
  //                                 ),
  //                               ),
  //                               Container(),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  PreferredSize customAppBarForHome(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/logo2.jpeg',
                height: 100,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: true,
                  child: InkWell(
                    onTap: () {
                      navigateTo(const TripsScreen());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ResponsiveText(
                          text: 'الطلبات',
                          scaleFactor: .03,
                          color: AppColors.white,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CustomAssetsImage(
                                  path: 'assets/Uber Taxi.png',
                                ),
                              ),
                            ),
                            StreamBuilder<int>(
                              stream: FirebaseMessagingService.not,
                              builder: (context, AsyncSnapshot<int> snapshot) {
                                if (snapshot.hasData) {
                                  return CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 8,
                                    child: ResponsiveText(
                                      text: '${snapshot.data}',
                                      scaleFactor: .02,
                                      color: AppColors.white,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Container();
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: InkWell(
                    onTap: () {
                      navigateTo(const MyTripsScreen());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ResponsiveText(
                          text: 'الرحالات',
                          scaleFactor: .03,
                          color: AppColors.white,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CustomAssetsImage(
                                  path: 'assets/Uber Taxi.png',
                                ),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
