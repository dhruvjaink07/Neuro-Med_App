import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page33 extends StatefulWidget {
  const Page33({super.key, });
  //  final VoidCallback goToPreviousPage;
  //   final VoidCallback goToNextPage;

  @override
  State<Page33> createState() => _Page33State();
}

class _Page33State extends State<Page33> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/Page33/BG _2.png"),fit: BoxFit.contain)
        ),
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
                    "assets/Page33/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page33/6.png",
                    height: 25,
                  ),
                ),]),
            Expanded(child: Stack(
              children: [
                   Positioned(
                      top: 40,
                      right: 65,
                      child: Image.asset(
                        "assets/Page30/Logo .png",
                        height: 100,
                      )),
                      Positioned(
                      top: 240,
                      left: 80,
                      child: Image.asset(
                        "assets/Page33/text .png",
                        height: 20,
                        // width: 720,
                        // fit: BoxFit.fill,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                            Positioned(
                      bottom: 100,
                      left: 70,
                      child: Image.asset(
                        "assets/Page32/text 2.png",
                        height: 16,
                        // width: 720,
                        // fit: BoxFit.fill,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
               Positioned(
                left: 70,
                bottom: 140,
                child: InkWell(
                  onTap: (){
                    showOverlay(context,"assets/Page33/4.png",370);
                  },
                  child: Image.asset("assets/Page33/4.png",height: 310,))),
                 Positioned(
                                   left: isOpen ? 20 :  10, // Adjust this value as needed
                                   bottom: 5,
                                   child: Visibility(
                                     visible: isOpen,
                                     child: Image.asset(
                                       "assets/Page33/3.png",
                                       height: 40,
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 10,
                                   bottom: 5,
                                   child: InkWell(
                                     onTap: () {
                                       setState(() {
                                         isOpen = !isOpen;
                                       });
                                     },
                                     child: Image.asset(
                                       "assets/Page33/2.png",
                                       height: 45,
                                     ),
                                   ),
                                 ),
                                 Positioned(
                    bottom: 5,
                    right: 50,
                    child: InkWell(
                      onTap: () {
                        showOverlay(context, "assets/Page30/logo.png", 350);
                      },
                      child: Image.asset(
                        "assets/Page30/logo.png",
                        width: 170,
                      ),
                    ),
                  ),
              ],
            ),),
          ],
        ),
      ),
    );
  }
   void showOverlay(
      BuildContext context, String overlayImagePath, double height) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          overlayEntry!.remove();
        },
        child: Material(
          color: Color.fromARGB(196, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap:
                  () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: height,
                // width: 900,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)!.insert(overlayEntry);
  }
}
