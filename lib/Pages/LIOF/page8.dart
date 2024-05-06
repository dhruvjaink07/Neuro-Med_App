import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page8 extends StatefulWidget {
  const Page8({super.key, required this.goToPreviousPage, required this.goToNextPage});
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page8/1.png"),fit: BoxFit.contain)),
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
                    "assets/Page1/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page1/6.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                
                         
                            Positioned(
                              right: 0,
                              bottom: 200,
                              child:InkWell(
                                onTap: (){
                                  showOverlay(context, "assets/Page8/11.png");
                                },
                                child: Image.asset("assets/Page8/10.png",height: 200,))),

                                Positioned(
                                  bottom: 80,
                                  left: 70,
                                  child: Image.asset("assets/Page8/POP.gif",width: 750,height: 330,fit: BoxFit.fill,)),
                         Stack(
             children: [
             Positioned(
                //  left: isOpen ? 25 :  30, // Adjust this value as needed
                left: 35,
                 bottom: 5,
                 child: Visibility(
                   visible: isOpen,
                   child: Image.asset(
                     "assets/Page8/3.png",
                     height: 40,
                   ).animate().fade(begin: -5).slide(begin: Offset(-1,0),curve: Curves.easeInOut,duration: Duration(milliseconds: 350)),
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
                     "assets/Page8/2.png",
                     height: 45,
                   ),
                 ),
               ),
             ],
           )
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
          color: const Color.fromARGB(145, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap: () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 550,
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