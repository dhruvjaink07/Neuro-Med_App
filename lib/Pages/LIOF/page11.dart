import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page11 extends StatefulWidget {
  const Page11({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page11> createState() => _Page11State();
}

class _Page11State extends State<Page11> {
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
                image: AssetImage("assets/Page11/bg.png"),
                fit: BoxFit.contain)),
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
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
                      top: 28,
                      right: 150,
                      child: Image.asset(
                        "assets/Page11/Logo.png",
                        width: 330,
                      ).animate().shimmer(
                          duration: const Duration(milliseconds: 1500),
                          size: 0.08)),
                  Positioned(
                      top: 240,
                      left: 100,
                      child: Image.asset(
                        "assets/Page11/Text .png",
                        height: 20,
                        // width: 380,
                        fit: BoxFit.fill,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      right: 0,
                      bottom: 200,
                      child: InkWell(
                          onTap: () {
                            showOverlay(context, "assets/Page11/11.png", 550);
                          },
                          child: Image.asset(
                            "assets/Page11/10.png",
                            height: 190,
                            width: 70,
                          ))),
                  Positioned(
                    top: 280,
                    left: 70,
                    child: InkWell(
                        onTap: () {
                          showOverlay(context, "assets/Page11/4.png", 550);
                        },
                        child: Image.asset("assets/Page11/4.png")),
                    height: 300,
                  ),
                  Positioned(
                    top: 280,
                    right: 120,
                    child: InkWell(
                        onTap: () {
                          showOverlay(context, "assets/Page11/7.png", 550);
                        },
                        child: Image.asset("assets/Page11/7.png")),
                    height: 300,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        //  left: isOpen ? 25 :  30, // Adjust this value as needed
                        left: 35,
                        bottom: 5,
                        child: Visibility(
                          visible: isOpen,
                          child: Image.asset(
                            "assets/Page11/3.png",
                            height: 40,
                          ).animate().fade(begin: -15).slide(
                              begin: Offset(-1, 0),
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 300)),
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
                  Positioned(
                    bottom: 5,
                    right: 50,
                    child: InkWell(
                      onTap: () {
                        showOverlay(
                            context, "assets/Page11/Small logo .png", 300);
                      },
                      child: Image.asset(
                        "assets/Page11/Small logo .png",
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

  void showOverlay(
      BuildContext context, String overlayImagePath, double height) {
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
