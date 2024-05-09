import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page19 extends StatefulWidget {
  const Page19({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page19> createState() => _Page19State();
}

class _Page19State extends State<Page19> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Page19/BG.png"),
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
                  "assets/Page19/5.png",
                  height: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                icon: Image.asset(
                  "assets/Page19/6.png",
                  height: 25,
                ),
              ),
            ]),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 20,
                      right: 80,
                      child: Image.asset(
                        "assets/Page19/Logo.png",
                        width: 430,
                      ).animate().shimmer(
                          duration: const Duration(milliseconds: 1500),
                          size: 0.08)),
                  Positioned(
                      bottom: 200,
                      left: 395,
                      child: Image.asset(
                        "assets/Page19/Circle cerebrovascular.png",
                        height: 220,
                      )
                          .animate()
                          .scale(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      top: 270,
                      left: 108,
                      child: Image.asset(
                        "assets/Page19/Motor capacity .png",
                        height: 120,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      top: 270,
                      right: 115,
                      child: Image.asset(
                        "assets/Page19/Space- time .png",
                        height: 120,
                      ) .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      bottom: 160,
                      left: 108,
                      child: Image.asset(
                        "assets/Page19/Degree of consciousness.png",
                        height: 120,
                      ) .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                      bottom: 170,
                      right: 110,
                      child: Image.asset(
                        "assets/Page19/Language & general .png",
                        height: 120,
                      ) .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                  Positioned(
                    left: 35,
                    bottom: 5,
                    child: Visibility(
                      visible: isOpen,
                      child: Image.asset(
                        "assets/Page19/3.png",
                        height: 40,
                      ).animate().fade(begin: -5).slide(
                          begin: Offset(-1, 0),
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 300)),
                    ),
                  ),
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
                        "assets/Page19/2.png",
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
    );
  }
}
