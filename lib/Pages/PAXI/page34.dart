import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page34 extends StatefulWidget {
  const Page34({
    Key? key,
    required this.goToPreviousPage,
    required this.goToNextPage,
    required this.changePageIndex,
  }) : super(key: key);

  final Function(int) changePageIndex; // Callback to change page index
  final VoidCallback goToPreviousPage;
  final VoidCallback goToNextPage;

  @override
  State<Page34> createState() => _Page34State();
}

class _Page34State extends State<Page34> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(
        screenHeight: MediaQuery.of(context).size.height,
        selectedBrand: 'PAXI',
      ),
      body: Center(
        child: Container(
          height: 768,
          width: 1024,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Page34/BG _3.png"),
              fit: BoxFit.contain,
            ),
          ),
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
                child: Center(
                  child: Container(
                    height: 650,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Page34/Bg.png"),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 408,
                          child: InkWell(
                            onTap: () {
                              widget.changePageIndex(35);
                            },
                            child: Image.asset(
                              "assets/Page34/2.png",
                              height: 220,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          left: 165,
                          child: InkWell(
                            onTap: () {
                              widget.changePageIndex(34);
                            },
                            child: Image.asset(
                              'assets/Page34/1.png',
                              height: 220,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 160,
                          child: InkWell(
                            onTap: () {
                              widget.changePageIndex(36);
                            },
                            child: Image.asset(
                              "assets/Page34/3.png",
                              height: 220,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().scale(duration: const Duration(milliseconds: 1500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
