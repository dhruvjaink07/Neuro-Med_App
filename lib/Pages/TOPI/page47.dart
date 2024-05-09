import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page47 extends StatefulWidget {
  const Page47({super.key, required this.goToPreviousPage, required this.goToNextPage, });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page47> createState() => _Page47State();
}

class _Page47State extends State<Page47> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/Page47/BG _12.png"),fit: BoxFit.contain)
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/menu/6.png",
                    height: 25,
                  ),
                ),]),
            Expanded(child: Stack(
              children: [
                 Positioned(
                      top: 30,
                      right: 40,
                      child: Image.asset(
                        "assets/Page46/Logo.png",
                        height: 110,
                      ).animate().shimmer(
                          duration: const Duration(milliseconds: 1500),
                          size: 0.08)),
                        Positioned(
                      top: 230,
                      left: 80,
                      child: Image.asset(
                        "assets/Page47/Text.png",
                        height: 20,
                        // width: 720,
                        // fit: BoxFit.fill,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 1500))),
                   Positioned(
                left: 70,
                bottom: 160,
                child: InkWell(
                  onTap: (){
                    showOverlay(context,"assets/Page47/4.png");
                  },
                  child: Image.asset("assets/Page47/gif1.gif",width: 420,))),
                  Positioned(
                right: 70,
                bottom: 160,
                child: InkWell(
                  onTap: (){
                    showOverlay(context,"assets/Page47/7.png");
                  },
                  child: Image.asset("assets/Page47/gif2.gif",width: 420,))),
                 Positioned(
                    left: 30,
                    bottom: 5,
                    child: Visibility(
                      visible: isOpen,
                      child: Image.asset(
                        "assets/Page47/3.png",
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
                                       "assets/menu/2.png",
                                       height: 45,
                                     ),
                                   ),
                                 ),

                                 Positioned(
                                  bottom: 20,
                                  right: 60,
                                  child: Image.asset("assets/Page47/Approved .png",height: 120,).animate().fade(duration: const Duration(milliseconds: 1500)))
              ],
            ),),
          ],
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
          color: Color.fromARGB(196, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap: () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 500,
                width: 700,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)!.insert(overlayEntry);
  }

}