import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page16 extends StatefulWidget {
  const Page16({super.key,});
//  final VoidCallback goToPreviousPage;
//     final VoidCallback goToNextPage;
  @override
  State<Page16> createState() => _Page16State();
}

class _Page16State extends State<Page16> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page16/1.png"),fit: BoxFit.contain)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Image.asset(
                    "assets/Page16/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page16/6.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                           children: [
                            Positioned(
                              bottom: 110,
                              left: 70,
                              child: Image.asset("assets/Page16/4.png",height: 350)),
                           Positioned(
                               left: isOpen ? 20 :  10, // Adjust this value as needed
                               bottom: 5,
                               child: Visibility(
                                 visible: isOpen,
                                 child: Image.asset(
                                   "assets/Page16/3.png",
                                   height: 40,
                                 ),
                               ),
                             ),
                             Positioned(
                               left: 20,
                               bottom: 5,
                               child: InkWell(
                                 onTap: () {
                                   setState(() {
                                     isOpen = !isOpen;
                                   });
                                 },
                                 child: Image.asset(
                                   "assets/Page16/2.png",
                                   height: 45,
                                 ),
                               ),
                             ),
                           ],
                         ),
            ), 
           
          ],
        ),
      ),

    );
  }
   void showOverlay(BuildContext context, String overlayImagePath) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          overlayEntry!.remove();
        },
        child: Material(
          color: const Color.fromARGB(145, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap: () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 550,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)!.insert(overlayEntry);
  }
}