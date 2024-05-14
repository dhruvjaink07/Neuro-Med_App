import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page1 extends StatefulWidget {
  final VoidCallback goToNextPage;
  final Function(int) changePageIndex; // Callback to change page index

  const Page1({
    super.key,
    required this.goToNextPage,
    required this.changePageIndex,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(seconds: 1);
  final Curve _animationCurve = Curves.easeIn;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    // Start the animation immediately
    _controller.forward();

    // Add a listener to restart the animation when the page is loaded again
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height, selectedBrand: 'OXET',),
      body: Center(
        child: Container(
           height: 768,
              width: 1024,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Page1/8.png"),
              fit: BoxFit.contain,
            ),
          ),
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
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainPage()),
                      );
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
                    right: 10,
                    child: Image.asset("assets/Page1/9.png",height: 120,).animate().fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      top: 50,
                      left: 130,
                      child: Image.asset(
                        "assets/Page1/7.png",
                        height: 540,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child: InkWell(
                      onTap: ()=>widget.changePageIndex(1),
                      child: Image.asset("assets/Page1/2.png", height: 140)
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500)),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 350,
                    child: InkWell(
                      onTap: ()=>widget.changePageIndex(3),
                      child: Image.asset("assets/Page1/3.png", height: 140)
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500)),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: InkWell(
                      onTap: ()=>widget.changePageIndex(5),
                      child: Image.asset("assets/Page1/4.png", height: 140)
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500)),
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
}
