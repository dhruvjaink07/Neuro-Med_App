import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page25 extends StatefulWidget {
  const Page25({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page25> createState() => _Page25State();
}

class _Page25State extends State<Page25> {
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
                image: AssetImage("assets/Page25/BG_2.png"),
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
                  "assets/Page25/5.png",
                  height: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                icon: Image.asset(
                  "assets/Page25/6.png",
                  height: 25,
                ),
              ),
            ]),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 40,
                      right: 20,
                      child: Image.asset(
                        "assets/Page23/Logo.png",
                        height: 80,
                      )),
                  Positioned(
                      top: 240,
                      left: 70,
                      child: Image.asset(
                        "assets/Page25/Text .png",
                        height: 20,
                        // width: 750,
                        // fit: BoxFit.fill,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      bottom: 100,
                      left: 70,
                      child: InkWell(
                          onTap: () {
                            showOverlay(context, "assets/Page25/4.png", 400);
                          },
                          child: Image.asset(
                            "assets/Page25/4.png",
                            height: 350,
                            width: 750,
                            fit: BoxFit.fill,
                          ))),
                  Positioned(
                      right: 60,
                      bottom: 130,
                      child: Image.asset(
                        "assets/Page25/Scanner.png",
                        height: 150,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                    left: 35,
                    bottom: 5,
                    child: Visibility(
                      visible: isOpen,
                      child: Image.asset(
                        "assets/Page25/3.png",
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
                        "assets/Page25/2.png",
                        height: 45,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 50,
                    child: InkWell(
                      onTap: () {
                        showOverlay(
                          context,
                          "assets/Page24/Small.png",350
                        );
                      },
                      child: Image.asset(
                        "assets/Page24/Small.png",
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
