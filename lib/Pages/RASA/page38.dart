import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page38 extends StatefulWidget {
  const Page38({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page38> createState() => _Page38State();
}

class _Page38State extends State<Page38> {
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
          // height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page38/BG.png"),
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
                child: Stack(children: [
                  Positioned(
                      top: 70,
                      left: 290,
                      child: Image.asset(
                        "assets/Page38/Logo.png",
                        height: 150,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                    bottom: 80,
                    left: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Page38/2.png",
                          height: 300,
                        ).animate()
                          .fade(duration: const Duration(milliseconds: 1500)),
                        Image.asset(
                          "assets/Page38/3.png",
                          height: 300,
                        ).animate()
                          .fade(duration: const Duration(milliseconds: 1500)),
                      ],
                    ),
                  ),
                ]),
              )
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
