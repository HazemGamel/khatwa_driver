import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/statusrequst.dart';
import '../core/functions/global_function.dart';
import '../dataforcrud/cash.dart';

import '../core/functions/handlingdata.dart';
import '../features/home/views/cashwebview.dart';

class CashController extends GetxController{
  StatusRequest statusRequest = StatusRequest.none;

  CashDate cashDate =CashDate(Get.find());

  String ? url;

  sendPhone()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashDate.PostData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      //print(response['url']);
       url =response['url'];
       if(url!.isEmpty) return Get.defaultDialog(title: "تنبية",middleText: "من فضلك ادخل رقم هاتف علية محفظة ");
       //go to webview for cash
      navigateTo(CashWebViewScreen(url:url.toString(),));

    }else{
      
    }
    update();
  }


  @override
  void onInit() {

    super.onInit();
  }
}