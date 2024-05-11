import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page54 extends StatefulWidget {
  const Page54({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page54> createState() => _Page54State();
}

class _Page54State extends State<Page54> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Center(
        child: Container(
          // width: MediaQuery.of(context).size.width,
        
         height: 768,
              width: 1024,        decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page54/BG _18.png"),
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
                        top: 20,
                        right: 60,
                        child: Image.asset(
                          "assets/Page54/Logo.png",
                          height: 130,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
                    Positioned(
                        top: 540,
                        left: 100,
                        child: Image.asset(
                          "assets/Page54/4.png",
                          height: 120,
                          // width: 720,
                          // fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 440,
                        right: 70,
                        child: Image.asset(
                          "assets/Page54/3 2.png",
                          height: 120,
                          // width: 720,
                          // fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 340,
                        left: 110,
                        child: Image.asset(
                          "assets/Page54/2 2.png",
                          height: 140,
                          // width: 720,
                          // fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 250,
                        left: 105,
                        child: Image.asset(
                          "assets/Page54/1 2.png",
                          height: 140,
                          // width: 720,
                          // fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                      left: 30,
                      bottom: 5,
                      child: Visibility(
                        visible: isOpen,
                        child: Image.asset(
                          "assets/Page54/3.png",
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
