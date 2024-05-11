import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page29 extends StatefulWidget {
  const Page29({super.key, required this.goToPreviousPage, required this.goToNextPage,});
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page29> createState() => _Page29State();
}

class _Page29State extends State<Page29> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Center(
        child: Container(
              height: 768,
              width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/Page29/bg.png"),fit: BoxFit.contain)
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
                  ),]),
              Expanded(child: Stack(
                children: [
                   Positioned(
                        top: 40,
                        right: 57,
                        child: Image.asset(
                          "assets/Page23/Logo.png",
                          height: 80,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
                   Positioned(
                                bottom: 90,
                                left: 90,
                                child: InkWell(
                                  onTap: (){
                                    showOverlay(context, "assets/Page29/8.png",650);
                                  },
                                  child: Image.asset("assets/Page29/4.png",height: 400,width: 500,fit: BoxFit.fill,))),
                                  Positioned(
                                bottom:100,
                                left:500,
                                child: InkWell(
                                  onTap: (){
                                    showOverlay(context, "assets/Page29/9.png",650);
                                  },
                                  child: Image.asset("assets/Page29/gif.gif",height: 400,width: 500,fit: BoxFit.fill,))),
                    Positioned(
                      left: 35,
                      bottom: 5,
                      child: Visibility(
                        visible: isOpen,
                        child: Image.asset(
                          "assets/Page29/3.png",
                          height: 40,
                        ).animate().fade(begin: -5).slide(
                            begin: Offset(-1, 0),
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 300)),
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
                                         "assets/menu/2.png",
                                         height: 45,
                                       ),
                                     ),
                                   ),
                                   Positioned(
                      bottom: 5,
                      right: 50,
                      child: InkWell(
                        onTap: () {
                          showOverlay(context, "assets/Page24/Small.png", 350);
                        },
                        child: Image.asset(
                          "assets/Page24/Small.png",
                          width: 170,
                        ),
                      ),
                    ),
                ],
              ),),
            ],
          ),
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
