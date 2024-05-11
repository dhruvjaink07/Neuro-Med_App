import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page7 extends StatefulWidget {
  const Page7({
    super.key, required this.goToNextPage, required this.goToPreviousPage,
  });
   final VoidCallback goToNextPage;
   final VoidCallback goToPreviousPage;
  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = Duration(milliseconds: 1500);
  final Curve _animationCurve = Curves.easeIn;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: _animationDuration,
        animationBehavior: AnimationBehavior.preserve);

    // Trigger the ease-in animation directly
    _controller.forward();
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
      body: Center(
        child: Container(
           height: 768,
              width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page7/12.png"), fit: BoxFit.contain)),
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
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    icon: Image.asset(
                      "assets/menu/6.png",
                      height: 25,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Stack(children: [
                  Positioned(
                    top: 230,
                    left: 400,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _controller.value * 5,
                          child: Image.asset(
                            'assets/Page7/20.png', // Replace 'your_image.jpg' with your image asset path
                            width: 200,
                            height: 200,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 230,
                      child: InkWell(
                          onTap: () {
                            showOverlay(context, "assets/Page7/11.png");
                          },
                          child: Image.asset(
                            "assets/Page7/10.png",
                            height: 200,
                          ))),
                ]),
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
          color: const Color.fromARGB(145, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap:
                  () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 550,
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
