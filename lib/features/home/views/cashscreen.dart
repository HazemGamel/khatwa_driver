import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_driver/core/widgets/custom_loading_widget.dart';
import '../../../controllers/cashcontroller.dart';
import '../../../core/class/statusrequst.dart';

class CashScreen extends StatelessWidget {
  const CashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(CashController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("كاش",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.greenAccent
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CashController>
          (builder: (controller)=>Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.statusRequest==StatusRequest.loading?
            const CustomLoadingWidget():Center(
              child: Container(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),),
                  color: Colors.green,
                  onPressed: (){
                    controller.sendPhone();
                  },
                  child: const Text("دفع الاشتراك الان",style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),),),
              ),
            )
          ],
        ),),
      ),
    );
  }
}
