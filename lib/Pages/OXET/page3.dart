import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page3 extends StatefulWidget {
    final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  const Page3({super.key, required this.goToPreviousPage, required this.goToNextPage, });

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin{
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
      begin: 0.5, // Starting scale
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
      body: Center(
        child: Container(
           height: 768,
              width: 1024,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page3/11.png"), fit: BoxFit.contain)),
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
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
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
                        top: 47,
                        right: 100,
                        child: Image.asset(
                          "assets/Page3/4.png",
                          height: 100,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
                       Positioned(
                        top: 170,
                        right: 23,
                        child: ScaleTransition(
                          scale: _animation,
                          child: Image.asset(
                            "assets/Page3/14.png",
                            height: 230,
                          ),
                        )),
                        Positioned(top:266,left:185,child: Image.asset("assets/Page3/7.png",height: 50,width: 600,fit: BoxFit.fill,).animate().fade(duration: Duration(milliseconds: 1500))),
                        Positioned(top: 360,left: 330,child: Image.asset("assets/Page3/8.png",height: 50,width: 500,fit: BoxFit.fill,).animate().fade(duration: Duration(milliseconds: 1500))),
                        Positioned(top: 455,left: 327,child: Image.asset("assets/Page3/9.png",height: 50,width: 500,fit: BoxFit.fill,).animate().fade(duration: Duration(milliseconds: 1500),)),
                        Positioned(top: 548,left: 185,child: Image.asset("assets/Page3/10.png",height: 50,width: 600,fit: BoxFit.fill,).animate().fade(duration: Duration(milliseconds:1500))),
                    Positioned(
                      left: 70,
                      bottom: 130,
                      child: ScaleTransition(
                        scale: _animation,
                        child: Image.asset("assets/Page3/13.png",height: 330,))),
                 Positioned(
                          //  left: isOpen ? 25 :  30, // Adjust this value as needed
                          left: 35,
                          bottom: 5,
                          child: Visibility(
                            visible: isOpen,
                            child: Image.asset(
                              "assets/Page3/3.png",
                              height: 40,
                            ).animate().fade(begin: -5).slide(
                                begin: Offset(-1, 0),
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 350)),
                          ),
                        ),
                     Positioned(
                      bottom: 5,
                      right: 50,
                      child: InkWell(
                        onTap: () {
                          showOverlay(context, "assets/Page3/12.png", 350);
                        },
                        child: Image.asset(
                          "assets/Page3/12.png",
                          width: 200,
                        ),
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
    Overlay.of(context)!.insert(overlayEntry);
  }
}

