import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page46 extends StatefulWidget {
  const Page46({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page46> createState() => _Page46State();
}

class _Page46State extends State<Page46> {
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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page46/BG.png"),
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
                        MaterialPageRoute(builder: (context) => const MainPage()));
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
                        right: 40,
                        child: Image.asset(
                          "assets/Page46/Logo.png",
                          height: 110,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
                    Positioned(
                        top: 250,
                        left: 180,
                        child: Image.asset(
                          "assets/Page46/Proven .png",
                          height: 50,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 320,
                        left: 180,
                        child: Image.asset(
                          "assets/Page46/Novel .png",
                          height: 50,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 400,
                        left: 250,
                        child: Image.asset(
                          "assets/Page46/Recommended.png",
                          height: 20,
                          // width: 720,
                          // fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        bottom: 180,
                        left: 248,
                        child: Image.asset(
                          "assets/Page46/AAN.png",
                          height: 100,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        bottom: 180,
                        right: 245,
                        child: Image.asset(
                          "assets/Page46/AHS.png",
                          height: 100,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                      left: 35,
                      bottom: 5,
                      child: Visibility(
                        visible: isOpen,
                        child: Image.asset(
                          "assets/Page46/3.png",
                          height: 40,
                        ).animate().fade(begin: -5).slide(
                            begin: const Offset(-1, 0),
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 300)),
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
          color: const Color.fromARGB(196, 0, 0, 0),
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
    Overlay.of(context).insert(overlayEntry);
  }
}
