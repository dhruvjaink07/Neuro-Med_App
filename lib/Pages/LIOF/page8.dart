import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page8 extends StatefulWidget {
  const Page8({
    super.key, required this.goToPreviousPage, required this.goToNextPage, 
  });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Page8/BG.png"), fit: BoxFit.contain)),
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
                    "assets/Page8/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page8/6.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 28,
                      right: 190,
                      child: Image.asset(
                        "assets/Page8/Logo.png",
                        width: 300,
                      ).animate().shimmer(
                          duration: const Duration(milliseconds: 1500),
                          size: 0.08)),
                  Positioned(
                      top: 240,
                      left: 100,
                      child: Image.asset(
                        "assets/Page8/text .png",
                        height: 25,
                        width: 650,
                        fit: BoxFit.fill,
                      ).animate().fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      top: 280,
                      left: 90,
                      child: Image.asset(
                        "assets/Page8/text 2.png",
                        height: 16,
                      ).animate().fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      right: 0,
                      bottom: 200,
                      child: InkWell(
                          onTap: () {
                            showOverlay(context, "assets/Page8/11.png", 450,800);
                          },
                          child: Image.asset(
                            "assets/Page8/10.png",
                            height: 200,
                          ).animate().animate().fade(duration: const Duration(milliseconds: 1500)))),
                  Positioned(
                      bottom: 120,
                      left: 70,
                      child: InkWell(
                          onTap: () {
                            showOverlay(context, "assets/Page8/4.png", 450,900);
                          },
                          child: Image.asset(
                            "assets/Page8/gif.gif",
                            width: 830,
                            height: 290,
                            fit: BoxFit.fill,
                          ))),
                  Stack(
                    children: [
                      Positioned(
                        //  left: isOpen ? 25 :  30, // Adjust this value as needed
                        left: 35,
                        bottom: 5,
                        child: Visibility(
                          visible: isOpen,
                          child: Image.asset(
                            "assets/Page8/3.png",
                            height: 40,
                          ).animate().fade(begin: -5).slide(
                              begin: Offset(-1, 0),
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 350)),
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
                            "assets/Page8/2.png",
                            height: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    right: 50,
                    child: InkWell(
                      onTap: () {
                        showOverlay(
                            context, "assets/Page8/Small logo .png", 350, 500);
                      },
                      child: Image.asset(
                        "assets/Page8/Small logo .png",
                        width: 170,
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

  void showOverlay(BuildContext context, String overlayImagePath, double height,
      double width) {
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
              onTap:
                  () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: height,
                width: width,
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
