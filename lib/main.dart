import 'package:educate/local/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'view/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize()
  //     .then(
  //       (InitializationStatus status) {
  //     MobileAds.instance.updateRequestConfiguration(
  //       RequestConfiguration(
  //         tagForChildDirectedTreatment:
  //         TagForChildDirectedTreatment.unspecified,
  //         testDeviceIds: <String>[
  //           '6F6B68AF130C3A6D75319E22673A1A41',
  //         ],
  //       ),
  //     );
  //     debugPrint('Initialization done: ${status.adapterStatuses}');
  //   },
  // )
  ;
  await Firebase.initializeApp();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}