import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page10 extends StatefulWidget {
  const Page10({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page10> createState() => _Page10State();
}

class _Page10State extends State<Page10> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
       drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height,selectedBrand: "LIOF",),
      body: Center(
        child: Container(
           height: 768,
            width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page10/bg.png"),
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
                          MaterialPageRoute(builder: (context) => const MainPage()));
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
                        top: 20,
                        right: 150,
                        child: Image.asset(
                          "assets/Page10/Logo.png",
                          width: 370,
                          height: 120,
                          fit: BoxFit.fill,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
                    Positioned(
                        top: 240,
                        left: 80,
                        child: Image.asset(
                          "assets/Page10/text .png",
                          height:20,
                          width: 810,
                          fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 350,
                        right: 120,
                        child: Image.asset(
                          "assets/Page10/remarkable .png",
                          width: 250,
                        )
                            .animate()
                            .scale(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        right: 0,
                        bottom: 230,
                        child: InkWell(
                            onTap: () {
                              showOverlay(context, "assets/Page10/11.png", 550);
                            },
                            child: Image.asset(
                              "assets/Page10/10.png",
                              height: 170,
                              width: 60,
                            ))),
                    Positioned(
                      left: 50,
                      top: 280,
                      child: InkWell(
                        onTap: (){
                          showOverlay(context, "assets/Page10/4.png", 550);
                        },
                        child: Image.asset(
                          "assets/Page10/gif.gif",
                          height: 360,
                          width: 640,
                          fit: BoxFit.fill,
                        ),
                      ),
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
                              "assets/Page10/3.png",
                              height: 40,
                            ).animate().fade(begin: -5).slide(
                                begin: const Offset(-1, 0),
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 350)),
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
                              context, "assets/Page10/Small logo .png", 300);
                        },
                        child: Image.asset(
                          "assets/Page10/Small logo .png",
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
