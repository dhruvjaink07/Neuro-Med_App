import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page2 extends StatefulWidget {
  const Page2(
      {super.key,  });
  // final VoidCallback goToPreviousPage;
  // final VoidCallback goToNextPage;
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Adjust the duration as needed
    );

    _animation = Tween<double>(
      begin: 0.4, // Starting scale
      end: 1.0, // Final scale
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Page2/10.png"), fit: BoxFit.contain)),
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
                    "assets/Page1/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page1/6.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 50,
                      right: 50,
                      child: Image.asset(
                        "assets/Page2/12.png",
                        width: 450,
                      ).animate().shimmer(
                          duration: const Duration(milliseconds: 1500),
                          size: 0.08)),
                  Positioned(
                    bottom: 5,
                    right: 50,
                    child: InkWell(
                      onTap: () {
                        showOverlay(context, "assets/Page2/15.png", 350);
                      },
                      child: Image.asset(
                        "assets/Page2/15.png",
                        width: 200,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 100,
                      left: 67,
                      child: InkWell(
                          onTap: () {
                            showOverlay(context, "assets/Page2/4.png", 450);
                          },
                          child: ScaleTransition(
                            scale: _animation,
                            child: Image.asset(
                              "assets/Page2/4.png",
                              width: 600,
                              height: 310,
                              fit: BoxFit.fill,
                            ),
                          ))),
                  Positioned(
                      bottom: 170,
                      right: 110,
                      child: ScaleTransition(
                        scale: _animation,
                        child: Image.asset(
                          "assets/Page2/14.png",
                          height: 170,
                        ),
                      )),
                  Positioned(
                      top: 170,
                      right: 23,
                      child: ScaleTransition(
                        scale: _animation,
                        child: Image.asset(
                          "assets/Page2/9.png",
                          height: 230,
                        ),
                      )),
                  Stack(
                    children: [
                      Positioned(
                        //  left: isOpen ? 25 :  30, // Adjust this value as needed
                        left: 35,
                        bottom: 5,
                        child: Visibility(
                          visible: isOpen,
                          child: Image.asset(
                            "assets/Page2/3.png",
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
                            "assets/Page2/2.png",
                            height: 45,
                          ),
                        ),
                      ),
                    ],
                  )
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
