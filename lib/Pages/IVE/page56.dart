import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page56 extends StatefulWidget {
  const Page56({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page56> createState() => _Page56State();
}

class _Page56State extends State<Page56> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Page56/BG _2.png"),
                fit: BoxFit.contain)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                icon: Image.asset(
                  "assets/menu/6.png",
                  height: 25,
                ),
              ),
            ]),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 30,
                      right: 130,
                      // LOGO
                      child: Image.asset(
                        "assets/Page56/Logo .png",
                        height: 100,
                      ).animate().shimmer(
                          duration: const Duration(milliseconds: 1500),
                          size: 0.08)),
                  Positioned(
                      top: 240,
                      left: 80,
                      child: Image.asset(
                        "assets/Page56/Text 1.png",
                        height: 17,
                        // width: 720,
                        // fit: BoxFit.fill,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      top: 280,
                      left: 80,
                      child: Image.asset(
                        "assets/Page56/text 2.png",
                        height: 17,
                        // width: 720,
                        // fit: BoxFit.fill,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      left: 70,
                      top: 365,
                      child: Image.asset(
                        "assets/Page56/11.png",
                        height: 55,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      left: 70,
                      top: 425,
                      child: Image.asset(
                        "assets/Page56/12.png",
                        height: 55,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      left: 70,
                      top: 485,
                      child: Image.asset(
                        "assets/Page56/13.png",
                        height: 55,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),

                  // Right
                  Positioned(
                      right: 30,
                      top: 425,
                      child: Image.asset(
                        "assets/Page56/15.png",
                        height: 55,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      right: 30,
                      top: 485,
                      child: Image.asset(
                        "assets/Page56/16.png",
                        height: 55,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      right: 30,
                      top: 365,
                      child: Image.asset(
                        "assets/Page56/14.png",
                        height: 55,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Stack(children: [
                    Positioned(
                        top: 350,
                        left: 360,
                        child: Image.asset(
                          "assets/Page56/Text BG .png",
                          height: 200,
                        )),
                    Positioned(
                        top: 380,
                        left: 410,
                        child: Image.asset(
                          "assets/Page56/text  in red.png",
                          height: 140,
                        ).animate().scale(
                            duration: const Duration(milliseconds: 1500)))
                  ]),
                  Positioned(
                    left: 30,
                    bottom: 5,
                    child: Visibility(
                      visible: isOpen,
                      child: Image.asset(
                        "assets/Page56/3.png",
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
          color: Color.fromARGB(196, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap:
                  () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 430,
                width: 900,
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
