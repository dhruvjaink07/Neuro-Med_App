import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page17 extends StatefulWidget {
  const Page17({super.key, required this.goToPreviousPage, required this.goToNextPage,});
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page17> createState() => _Page17State();
}

class _Page17State extends State<Page17> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page17/1.png"),fit: BoxFit.contain)),
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
                    "assets/Page17/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page17/6.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                           children: [
                            Positioned(
                              bottom: 150,
                              left: 70,
                              child: InkWell(
                                onTap: (){
                                  showOverlay(context, "assets/Page17/4.png");
                                },
                                child: Image.asset("assets/Page17/4.png",height: 300,width: 700,fit: BoxFit.fill,))),
                           Positioned(
                               left: isOpen ? 20 :  10, // Adjust this value as needed
                               bottom: 5,
                               child: Visibility(
                                 visible: isOpen,
                                 child: Image.asset(
                                   "assets/Page17/3.png",
                                   height: 40,
                                 ),
                               ),
                             ),
                             Positioned(
                               left: 15,
                               bottom: 5,
                               child: InkWell(
                                 onTap: () {
                                   setState(() {
                                     isOpen = !isOpen;
                                   });
                                 },
                                 child: Image.asset(
                                   "assets/Page17/2.png",
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
                height: 450,
                width: 800,
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