import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuro_app/Pages/BETA/page13.dart';
import 'package:neuro_app/Pages/BETA/page14.dart';
import 'package:neuro_app/Pages/BETA/page15.dart';
import 'package:neuro_app/Pages/BETA/page16.dart';
import 'package:neuro_app/Pages/BETA/page17.dart';
import 'package:neuro_app/Pages/LIOF/page10.dart';
import 'package:neuro_app/Pages/LIOF/page11.dart';
import 'package:neuro_app/Pages/LIOF/page12.dart';
import 'package:neuro_app/Pages/LIOF/page7.dart';
import 'package:neuro_app/Pages/LIOF/page8.dart';
import 'package:neuro_app/Pages/LIOF/page9.dart';
import 'package:neuro_app/Pages/OXET/page2.dart';
import 'package:neuro_app/Pages/OXET/page1.dart';
import 'package:neuro_app/Pages/OXET/page3.dart';
import 'package:neuro_app/Pages/OXET/page4.dart';
import 'package:neuro_app/Pages/OXET/page5.dart';
import 'package:neuro_app/Pages/OXET/page6.dart';
import 'package:neuro_app/Pages/PIRA/page18.dart';
import 'package:neuro_app/Pages/PIRA/page19.dart';
import 'package:neuro_app/Pages/PIRA/page20.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/controllers/liof_page_controller.dart';
// import 'package:neuro_app/controllers/mainPageController.dart';
import 'package:neuro_app/controllers/oxet_page_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MainPage(),
      // home: LiofPageControllerWidget(),
      home: Page20(),
      // home : OxetPageControllerWidget()
      // home: MainPageControllerWidget(),

    );
  }
}
