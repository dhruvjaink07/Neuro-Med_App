import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page22 extends StatefulWidget {
  const Page22({super.key, required this.goToPreviousPage, required this.goToNextPage, });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page22> createState() => _Page22State();
}

class _Page22State extends State<Page22> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height,selectedBrand: "GAB-AT",),
      body: Center(
        child: Container(
              height: 768,
              width: 1024,
          // width: MediaQuery.of(context).size.width,
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/Page22/BG.png"),fit: BoxFit.contain)
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainPage()));
                    },
                    icon: Image.asset(
                      "assets/menu/6.png",
                      height: 25,
                    ),
                  ),]),
              Expanded(child: Stack(
                children: [
                   Positioned(
                        top: 40,
                        right: 30,
                        child: Image.asset(
                          "assets/Page22/Logo.png",
                          height: 70,
                        ).animate().shimmer(
                            duration: const Duration(milliseconds: 1500),
                            size: 0.08)),
        
                         Positioned(
                        top: 230,
                        left: 80,
                        child: Image.asset(
                          "assets/Page22/Text .png",
                          height: 20,
                          width: 730,
                          fit: BoxFit.fill,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 1500))),
                   Positioned(
                                bottom: 50,
                                left: 65,
                                child: InkWell(
                                  onTap: (){
                                    showOverlay(context, "assets/Page22/4.png");
                                  },
                                  child: Image.asset("assets/Page22/gif.gif",height: 460,width: 830,fit: BoxFit.fill,))),
                   Positioned(
                      left: 35,
                      bottom: 5,
                      child: Visibility(
                        visible: isOpen,
                        child: Image.asset(
                          "assets/Page22/3.png",
                          height: 40,
                        ).animate().fade(begin: -5).slide(
                            begin: const Offset(-1, 0),
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 300)),
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
              ),),
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
              onTap: () {}, // To prevent taps on the image from closing the overlay
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