import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page8 extends StatefulWidget {
  const Page8({
    super.key, required this.goToPreviousPage, required this.goToNextPage, required this.changePageIndex, 
  });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
         final Function(int) changePageIndex; // Callback to change page index

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
       drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height,selectedBrand: "LIOF",),
      body: Center(
        child: Container(
           height: 768,
              width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page8/Bg.png"), fit: BoxFit.contain)),
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
                        right: 190,
                        child: InkWell(
                          onTap: (){
                            widget.changePageIndex(6);
                          },
                          child: Image.asset(
                            "assets/Page8/Logo.png",
                            width: 300,
                          ).animate().shimmer(
                              duration: const Duration(milliseconds: 1500),
                              size: 0.08),
                        )),
                    Positioned(
                        top: 220,
                        left: 80,
                        child: Image.asset(
                          "assets/Page8/text .png",
                          height: 25,
                          width: 650,
                          fit: BoxFit.fill,
                        ).animate().fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 265,
                        left: 80,
                        child: Image.asset(
                          "assets/Page8/text 2.png",
                          height: 17,
                          width: 810,
                          fit: BoxFit.fill,
                        ).animate().fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        right: 0,
                        bottom: 230,
                        child: InkWell(
                            onTap: () {
                              showOverlay(context, "assets/Page8/11.png", 350,800);
                            },
                            child: Image.asset(
                              "assets/Page8/10.png",
                              // height: 200,
                              width: 70,
                            ).animate().animate().fade(duration: const Duration(milliseconds: 1500)))),
                    Positioned(
                        bottom: 5,
                        left: 70,
                        child: InkWell(
                            onTap: () {
                              showOverlay(context, "assets/Page8/4.png", 450,900);
                            },
                            child: Image.asset(
                              "assets/Page8/gif.gif",
                              width: 860,
                              height:490,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                            ))),
                    Stack(
                      children: [
                        Positioned(
                          left: 35,
                          bottom: 5,
                          child: Visibility(
                            visible: isOpen,
                            child: Image.asset(
                              "assets/Page8/3.png",
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
                              context, "assets/Page8/Small logo .png", 350, 500);
                        },
                        child: Image.asset(
                          "assets/Page8/Small logo .png",
                          width: 150,
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
    Overlay.of(context).insert(overlayEntry);
  }
}
