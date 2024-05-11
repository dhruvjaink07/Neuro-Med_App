import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/StateManagement/selectedBrandModelProvider.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(
    ChangeNotifierProvider(
      create: (context) => SelectedBrandsModel(),
      child: MaterialApp(
        title: 'Your App Title',
        home: Builder(
          builder: (context) {
            return MainPage();
          },
        ),
      ),
    ),
  );
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
      home: const MainPage()
    );
  }
}
