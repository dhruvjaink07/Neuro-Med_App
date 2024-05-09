import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page4 extends StatefulWidget {
  final VoidCallback goToPreviousPage;
  final VoidCallback goToNextPage;
  const Page4({
    super.key,
    required this.goToPreviousPage,
    required this.goToNextPage,
  });

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> with SingleTickerProviderStateMixin {
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
      begin: 0.3, // Starting scale
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
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Page4/4.png"), fit: BoxFit.contain)),
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
                      height: 20,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    icon: Image.asset(
                      "assets/menu/6.png",
                      height: 25,
                    ))
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 28,
                      right: 80,
                      child: Image.asset(
                        "assets/Page4/7.png",
                        height: 100,
                        width: 450,
                        fit: BoxFit.fitWidth,
                      ).animate().shimmer(
                          duration: const Duration(milliseconds: 1500),
                          size: 0.08)),
                  Positioned(
                      top: 290,
                      left: 180,
                      child: ScaleTransition(
                          scale: _animation,
                          child: Image.asset(
                            "assets/Page4/9.png",
                            fit: BoxFit.fill,
                            height: 300,
                            width: 680,
                          ))),
                  Positioned(
                      top: 230,
                      left: 240,
                      child: ScaleTransition(
                          scale: _animation,
                          child: Image.asset(
                            "assets/Page4/12.png",
                            width: 550,
                          ))),
                          Positioned(
                    left: 35,
                    bottom: 5, // Slide down when isOpen is false
                    child: Visibility(
                      visible: isOpen,
                      child: Image.asset(
                        "assets/Page4/3.png",
                        height: 40,
                      ).animate().fade(begin: -10).slide(
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
                  Positioned(
                    bottom: 5,
                    right: 50,
                    child: InkWell(
                      onTap: () {
                        showOverlay(context, "assets/Page4/8.png", 350);
                      },
                      child: Image.asset(
                        "assets/Page4/8.png",
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
