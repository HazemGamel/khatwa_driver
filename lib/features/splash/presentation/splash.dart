import 'package:flutter/material.dart';
import '../../auth/presentation/views/login_view.dart';
import '../../../core/functions/global_function.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/services/cache_storage_services.dart';
import '../../home/views/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void splashNavTimer() {
    Future.delayed(const Duration(seconds: 5),
            () => checkAuth());
  }

  checkAuth() {
    final token = CacheStorageServices().token;
    if (token.isEmpty) {
      navigateOff(DriverLoginView());
    } else {
      navigateOff(MainView());
    }
  }

  @override
  void initState() {
    splashNavTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: splashBody(),
    );
  }

 Widget splashBody() {
   return SafeArea(
     child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             padding: EdgeInsets.all(4),
             decoration: BoxDecoration(
               color: Colors.grey[100],
               borderRadius: BorderRadius.circular(120),
             ),
             child: ClipRRect(
                 borderRadius: BorderRadius.circular(100),
                 child: Image.asset("assets/logo2.jpeg")),
           ),
           SizedBox(
             height: 10,
           ),
           Text(" مرحبأ بك في خطوة ",style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25,
               color: Colors.white
           ),)
         ],
       ),
     ),
   );
  }
}
