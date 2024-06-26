import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page18 extends StatefulWidget {
  const Page18({
    super.key, required this.goToPreviousPage, required this.goToNextPage,
  });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page18> createState() => _Page18State();
}

class _Page18State extends State<Page18> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
     drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height, selectedBrand: 'PIRA',),
      body: Center(
        child: Container(
           height: 768,
              width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page18/bg.png"),
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
                        MaterialPageRoute(builder: (context) => const MainPage()));
                  },
                  icon: Image.asset(
                    "assets/menu/6.png",
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
                          "assets/Page18/Logo.png",
                          width: 430,
                        )),
                    //Novel Combination of potent
                    Positioned(
                        top: 240,
                        left: 200,
                        child: Image.asset(
                          "assets/Page18/Novel Combination of potent .png",
                          // height: 25,
                          width: 650,
                          fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        bottom: 150,
                        left: 180,
                        child: Image.asset(
                          "assets/Page18/alpha.png",
                          width: 220,
                        )
                            .animate()
                            .scale(duration: const Duration(milliseconds: 1000))),
                    Positioned(
                        top: 290,
                        right: 175,
                        child: Image.asset(
                          "assets/Page18/Provides 2x.png",
                          height: 120,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        top: 410,
                        right: 170,
                        child: Image.asset(
                          "assets/Page18/Acts faster .png",
                          height: 120,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                        right: 180,
                        bottom: 75,
                        child: Image.asset(
                          "assets/Page18/Improves patients .png",
                          height: 120,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                    Positioned(
                      left: 35,
                      bottom: 5,
                      child: Visibility(
                        visible: isOpen,
                        child: Image.asset(
                          "assets/Page18/3.png",
                          height: 40,
                        ).animate().fade(begin: -5).slide(
                            begin: const Offset(-1, 0),
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 350)),
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
                          "assets/menu/2.png",
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
      ),
    );
  }
}
