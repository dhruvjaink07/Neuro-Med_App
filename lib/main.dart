import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // Get the application documents directory
  final appDocumentDir = await getApplicationDocumentsDirectory();
  // Set the Hive storage path
  Hive.init(appDocumentDir.path);
  // Open the Hive box for tappedImages (you can use a different name if needed)
  await Hive.openBox('tappedImages');
SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(
       MaterialApp(
        title: 'Your App Title',
        home: Builder(
          builder: (context) {
            return const MainPage();
          },
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
// class TappedImagesProvider extends ChangeNotifier {
//   Set<String> tappedImages = Set<String>();

//   void addTappedImage(String imageName) {
//     tappedImages.add(imageName);
//     notifyListeners();
//   }

//   void clearTappedImages() {
//     tappedImages.clear();
//     notifyListeners();
//   }
// }