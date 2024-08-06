import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:selivery_driver/controllers/homeviewcontroller.dart';

import 'package:selivery_driver/core/functions/global_function.dart';
import 'package:selivery_driver/core/helper/notifictions_helper.dart';
import 'package:selivery_driver/core/widgets/custom_loading_widget.dart';
import 'package:selivery_driver/features/home/views/payment.dart';

import '../../../core/contants/api.dart';
import '../../../core/services/cache_storage_services.dart';
import 'rental_sale_car_view/order_car_view.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../widgets/category_items.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


   getProfileDate() async {
    try {
      final response = await http.get(
        driverProfile,
        headers: authHeadersWithToken(CacheStorageServices().token),
      );
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        await CacheStorageServices().
        setDate(result['driver']['subscription_expiry']);
        handeldate();
        return "";
      } else {
        return "";
      }
    } catch (e) {
      print(e.toString());
      return "";
    }
  }

  //format date
handeldate(){
  String formattedDate = DateFormat('yyyy-MM-dd').
  format(DateTime.now());
  if(formattedDate == CacheStorageServices().date.split("T").first){
    Get.defaultDialog(
        title: "مرحبأ",
        middleText: "الرجاء الاشتراك في خدمتنا لكي يسمح لك باستخدام التطبيق والقيام بالرحالات ",
    onConfirm: (){
          navigateTo(const PaymentScreen());
    },
    textConfirm: "أشتراك",
        barrierDismissible: true);
  }else{

  }
}

  @override
  void initState() {
     getProfileDate();
    super.initState();

  }

  @override
  void dispose() {
     FirebaseMessagingService.streamController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     Get.put(HomeViewController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBarForHome(context),
      body: GetBuilder<HomeViewController>(
        builder: (controller){
          return Column(
            children:  [
              controller.kGooglePlex!=null?
                Expanded(child:
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      markers: controller.markers.toSet(),
                      onTap: (latlong){
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: controller.kGooglePlex!,
                      onMapCreated: (GoogleMapController mapcontroller) {
                        // controller.completercontroller!.complete(mapcontroller);
                        if (!controller.completercontroller!.isCompleted) {
                          controller.completercontroller!
                              .complete(mapcontroller);
                        }
                      },
                    ),


                  ],
                ) ):CustomLoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}
