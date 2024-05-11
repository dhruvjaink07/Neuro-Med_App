import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page60 extends StatefulWidget {
  const Page60({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page60> createState() => _Page60State();
}

class _Page60State extends State<Page60> {
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
              width: 1024,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page60/BG.png"),
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
                        top: 40,
                        right: 70,
                        // LOGO
                        child: Image.asset(
                          "assets/Page60/Neuro logo .png",
                          height: 100,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
                    Positioned(
                        top: 250,
                        left: 70,
                        child: Image.asset(
                          "assets/Page60/Act as.png",
                          height: 130,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 390,
                        left: 70,
                        child: Image.asset(
                          "assets/Page60/Promotes .png",
                          height: 130,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 530,
                        left: 70,
                        child: Image.asset(
                          "assets/Page60/treats.png",
                          height: 130,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 230,
                        right: 100,
                        child: Image.asset(
                          "assets/Page60/Object .png",
                          height: 400,
                        )
                            .animate()
                            .scale(duration: const Duration(milliseconds: 1500))),
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
