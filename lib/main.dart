import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/animationTry.dart';


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
      home: MainPage(),
      // home: EaseInAnimationDemo(),
      // home: LiofPageControllerWidget(),
      // home: Page62(),
      // home : OxetPageControllerWidget()
      // home: MainPageControllerWidget(),

    );
  }
}
