import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page15 extends StatefulWidget {
  const Page15({super.key, required this.goToPreviousPage, required this.goToNextPage,  });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page15> createState() => _Page15State();
}

class _Page15State extends State<Page15> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
 drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height,selectedBrand: "BETA",),
      body: Center(
        child: Container(
           height: 768,
            width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page15/bg.png"),fit: BoxFit.contain)),
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
                      "assets/menu/5.png",
                      height: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                    },
                    icon: Image.asset(
                      "assets/menu/6.png",
                      height: 25,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                             children: [
                              Positioned(
                        top: 30,
                        right:80,
                        child: Image.asset(
                          "assets/Page15/Logo.png",
                          width: 430,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
                              Positioned(
                                top: 260,
                                left: 80,
                                child: Image.asset("assets/Page15/4.png",height: 300,).animate().fade(duration: const Duration(milliseconds: 1500))),
                             Positioned(
                                 left: 40, // Adjust this value as needed
                                 bottom: 5,
                                 child: Visibility(
                                   visible: isOpen,
                                   child: Image.asset(
                                     "assets/Page15/3.png",
                                     height: 40,
                                   ).animate().fade(begin: -5).slide(
                                begin: Offset(-1, 0),
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 320)),
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
                                     "assets/menu/2.png",
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