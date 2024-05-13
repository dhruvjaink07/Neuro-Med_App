import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key, required this.goToNextPage, required this.goToPreviousPage, required this.changePageIndex});
   final VoidCallback goToNextPage;
   final VoidCallback goToPreviousPage;
     final Function(int) changePageIndex; // Callback to change page index
  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height, selectedBrand: 'LIOF',),
      body: Center(
        child: Container(
        width: 1024,
        height: 768,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page7/111.png"),fit: BoxFit.contain)),
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
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 170,
                      child: InkWell(
                        onTap: () {
                         widget.changePageIndex(7);
                          print("Test 1");
                        },
                        child: Image.asset("assets/Page7/2.png",height: 250,))),
                        Positioned(
                          left: 29,
                          top: 170,
                          child: Image.asset("assets/Page7/3.png",height: 150,)),
                        Positioned(
                          right: 143,
                          top: 175,
                          child: InkWell(
                            onTap: (){
                               widget.changePageIndex(9);
                              print("Test 2");
                            },
                            child: Image.asset("assets/Page7/4.png",height: 280,))),
                            Positioned(
                            right: 110,
                            bottom: 260,
                              child: Image.asset("assets/Page7/7.png",height: 120,)),
                              Positioned(
                                right: 0,
                                bottom: 200,
                                child:InkWell(
                                  onTap: (){
                                    showOverlay(context, "assets/Page7/11.png");
                                  },
                                  child: Image.asset("assets/Page7/10.png",width: 70,))),
                            Positioned(
                              left: 225,
                              bottom: 95,
                              child: InkWell(
                                onTap: (){
                                   widget.changePageIndex(11);
                                  print("Test 3");
                                },
                                child: Image.asset("assets/Page7/8.png",height: 240,))),
                                Positioned(
                                  bottom: 50,
                                  left: 150,
                                  child: Image.asset("assets/Page7/9.png",height: 170,))
                  ],
                ),
              )
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