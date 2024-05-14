import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page6 extends StatefulWidget {
  final VoidCallback goToPreviousPage;
  final VoidCallback goToNextPage;
    final Function(int) changePageIndex; // Callback to change page index

  const Page6({
    super.key,
    required this.goToPreviousPage,
    required this.goToNextPage, required this.changePageIndex,
  });

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;

  @override
  void dispose() {
    count = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
     drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height, selectedBrand: 'OXET',),
      body: Center(
        child: Container(
           height: 768,
            width: 1024,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page6/7.png"), fit: BoxFit.contain)),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Image.asset(
                        "assets/menu/5.png",
                        height: 10,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const MainPage()));
                      },
                      icon: Image.asset(
                        "assets/menu/6.png",
                        height: 20,
                      ))
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        top: 30,
                        right: 150,
                        child: InkWell(
                          onTap: (){
                            widget.changePageIndex(0);
                          },
                          child: Image.asset(
                            "assets/Page6/11.png",
                            // width: 450,
                            height: 110,
                            // fit: BoxFit.fill,
                          ).animate().shimmer(
                              duration: const Duration(milliseconds: 1500),
                              size: 0.08),
                        )),
                    Positioned(
                        left: 100,
                        bottom: 130,
                        child: Image.asset(
                          "assets/Page6/8.png",
                          width: 800,
                          height: 330,
                          fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        right: 40,
                        bottom: 100,
                        child: Image.asset(
                          "assets/Page6/9.png",
                          height: 400,
                          width: 250,
                          fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        left: 100,
                        bottom: 230,
                        child: Image.asset(
                          "assets/Page6/10.png",
                          height: 270,
                        )
                            .animate()
                            .scale(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                      left: 35,
                      bottom: 5, // Slide down when isOpen is false
                      child: Visibility(
                        visible: isOpen,
                        child: Image.asset(
                          "assets/Page6/3.png",
                          height: 40,
                        ).animate().fade(begin: -10).slide(
                            begin: const Offset(-1, 0),
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 300)),
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
                    Positioned(
                      bottom: 5,
                      right: 50,
                      child: InkWell(
                        onTap: () {
                          showOverlay(context, "assets/Page5/12.png", 350);
                        },
                        child: Image.asset(
                          "assets/Page5/12.png",
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
    Overlay.of(context).insert(overlayEntry);
  }
}
