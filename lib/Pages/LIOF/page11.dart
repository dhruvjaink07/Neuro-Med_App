import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page11 extends StatefulWidget {
  const Page11({super.key, required this.goToPreviousPage, required this.goToNextPage, });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page11> createState() => _Page11State();
}

class _Page11State extends State<Page11> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page11/1.png"),fit: BoxFit.contain)),
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
                    "assets/Page11/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page11/6.png",
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
                              bottom: 280,
                              child:InkWell(
                                onTap: (){
                                  showOverlay(context, "assets/Page11/11.png");
                                },
                                child: Image.asset("assets/Page11/10.png",height: 200,width: 80,))),

                                Positioned(
                                  left: 60,
                                  top: 300,
                                  child: Row(
                                    children: [InkWell(
                                      onTap: (){
                                        showOverlay(context, "assets/Page11/4.png");
                                      },
                                      child: Image.asset("assets/Page11/4.png",height: 300,)),const SizedBox(width: 30,),
                                      InkWell(
                                        onTap: (){
                                              showOverlay(context, "assets/Page11/7.png");
                                        },
                                        child: Image.asset("assets/Page11/7.png",height: 300,width: 400,))],
                                  ),
                                ),
                         Stack(
             children: [
             Positioned(
                 left: isOpen ? 20 :  10, // Adjust this value as needed
                 bottom: 5,
                 child: Visibility(
                   visible: isOpen,
                   child: Image.asset(
                     "assets/Page11/3.png",
                     height: 40,
                   ),
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
                     "assets/Page11/2.png",
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