import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuro_app/Pages/ADES/page54.dart';
import 'package:neuro_app/Pages/ATTE/page55.dart';
import 'package:neuro_app/Pages/BETA/page13.dart';
import 'package:neuro_app/Pages/BETA/page14.dart';
import 'package:neuro_app/Pages/BETA/page15.dart';
import 'package:neuro_app/Pages/BETA/page16.dart';
import 'package:neuro_app/Pages/BETA/page17.dart';
import 'package:neuro_app/Pages/CARI/page61.dart';
import 'package:neuro_app/Pages/CARI/page62.dart';
import 'package:neuro_app/Pages/ETI/page57.dart';
import 'package:neuro_app/Pages/GABAT/page21.dart';
import 'package:neuro_app/Pages/GABAT/page22.dart';
import 'package:neuro_app/Pages/IVE/page56.dart';
import 'package:neuro_app/Pages/LAMO/page51.dart';
import 'package:neuro_app/Pages/LIOF/page10.dart';
import 'package:neuro_app/Pages/LIOF/page11.dart';
import 'package:neuro_app/Pages/LIOF/page12.dart';
import 'package:neuro_app/Pages/LIOF/page7.dart';
import 'package:neuro_app/Pages/LIOF/page8.dart';
import 'package:neuro_app/Pages/LIOF/page9.dart';
import 'package:neuro_app/Pages/LURA/page58.dart';
import 'package:neuro_app/Pages/NEU-D3/page60.dart';
import 'package:neuro_app/Pages/OXET/page1.dart';
import 'package:neuro_app/Pages/OXET/page2.dart';
import 'package:neuro_app/Pages/OXET/page3.dart';
import 'package:neuro_app/Pages/OXET/page4.dart';
import 'package:neuro_app/Pages/OXET/page5.dart';
import 'package:neuro_app/Pages/OXET/page6.dart';
import 'package:neuro_app/Pages/PANA/page30.dart';
import 'package:neuro_app/Pages/PANA/page31.dart';
import 'package:neuro_app/Pages/PANA/page32.dart';
import 'package:neuro_app/Pages/PANA/page33.dart';
import 'package:neuro_app/Pages/PARK/page23.dart';
import 'package:neuro_app/Pages/PARK/page24.dart';
import 'package:neuro_app/Pages/PARK/page25.dart';
import 'package:neuro_app/Pages/PARK/page26.dart';
import 'package:neuro_app/Pages/PARK/page27.dart';
import 'package:neuro_app/Pages/PARK/page28.dart';
import 'package:neuro_app/Pages/PARK/page29.dart';
import 'package:neuro_app/Pages/PAXI/page34.dart';
import 'package:neuro_app/Pages/PAXI/page35.dart';
import 'package:neuro_app/Pages/PAXI/page36.dart';
import 'package:neuro_app/Pages/PAXI/page37.dart';
import 'package:neuro_app/Pages/PIRA/page18.dart';
import 'package:neuro_app/Pages/PIRA/page19.dart';
import 'package:neuro_app/Pages/PIRA/page20.dart';
import 'package:neuro_app/Pages/RASA/page38.dart';
import 'package:neuro_app/Pages/RASA/page39.dart';
import 'package:neuro_app/Pages/RASA/page40.dart';
import 'package:neuro_app/Pages/RASA/page41.dart';
import 'package:neuro_app/Pages/SIZO/page59.dart';
import 'package:neuro_app/Pages/SYNA/page42.dart';
import 'package:neuro_app/Pages/SYNA/page43.dart';
import 'package:neuro_app/Pages/SYNA/page44.dart';
import 'package:neuro_app/Pages/TOPI/page45.dart';
import 'package:neuro_app/Pages/TOPI/page46.dart';
import 'package:neuro_app/Pages/TOPI/page47.dart';
import 'package:neuro_app/Pages/TOPI/page48.dart';
import 'package:neuro_app/Pages/VEN/page49.dart';
import 'package:neuro_app/Pages/VEN/page50.dart';
import 'package:neuro_app/Pages/ZEFR/page52.dart';
import 'package:neuro_app/Pages/ZEFR/page53.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/Pages/splashScreen.dart';
import 'package:neuro_app/components/chatbubble.dart';


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
      home: const SplashScreen(),
// home: Page5(),
    );
  }
}
