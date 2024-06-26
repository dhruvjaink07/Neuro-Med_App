import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page45 extends StatefulWidget {
  const Page45({
    super.key, required this.goToPreviousPage, required this.goToNextPage, required this.changePageIndex,
  });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
      final Function(int) changePageIndex; // Callback to change page index


  @override
  State<Page45> createState() => _Page45State();
}

class _Page45State extends State<Page45> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height,selectedBrand: "TOPI",),
      body: Center(
        child: Container(
              height: 768,
                width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Page45/1.png"), fit: BoxFit.contain)),
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
                        top: 260,
                        left: 150,
                        child: InkWell(
                          onTap: (){
                            widget.changePageIndex(45);
                          },
                          child: Image.asset(
                            "assets/Page45/2.png",
                            height: 350,
                          )
                              .animate()
                              .scale(duration: const Duration(milliseconds: 1500)),
                        )),
                    Positioned(
                        top: 260,
                        left: 400,
                        child: InkWell(
                          onTap: (){
                            widget.changePageIndex(46);
                          },
                          child: Image.asset("assets/Page45/3.png", height: 350)
                              .animate()
                              .scale(duration: const Duration(milliseconds: 1500)),
                        )),
                    Positioned(
                        top: 260,
                        left: 650,
                        child: InkWell(
                          onTap: (){
                            widget.changePageIndex(47);
                          },
                          child: Image.asset("assets/Page45/4.png", height: 305)
                              .animate()
                              .scale(duration: const Duration(milliseconds: 1500)),
                        ))
                  ],
                ),
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
          color: const Color.fromARGB(196, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap:
                  () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 430,
                width: 900,
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
