import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page53 extends StatefulWidget {
  const Page53({super.key, required this.goToPreviousPage, required this.goToNextPage,});
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page53> createState() => _Page53State();
}

class _Page53State extends State<Page53> {
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
          image: DecorationImage(image: AssetImage("assets/Page53/1.png"),fit: BoxFit.contain)
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
                    "assets/Page53/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page53/6.png",
                    height: 25,
                  ),
                ),]),
            Expanded(child: Stack(
              children: [
                   Positioned(
                left: 75,
                bottom: 105,
                child: InkWell(
                  onTap: (){
                    showOverlay(context,"assets/Page53/4.png");
                  },
                  child: Image.asset("assets/Page53/4.png",height: 330,))),
                 Positioned(
                                   left: isOpen ? 20 :  10, // Adjust this value as needed
                                   bottom: 5,
                                   child: Visibility(
                                     visible: isOpen,
                                     child: Image.asset(
                                       "assets/Page53/3.png",
                                       height: 40,
                                     ),
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
                                       "assets/Page53/2.png",
                                       height: 45,
                                     ),
                                   ),
                                 ),
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
                height: 430,
                width: 900,
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