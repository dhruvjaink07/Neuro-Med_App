import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page23 extends StatefulWidget {
  const Page23({super.key, });
  //  final VoidCallback goToPreviousPage;
  //   final VoidCallback goToNextPage;

  @override
  State<Page23> createState() => _Page23State();
}

class _Page23State extends State<Page23> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(0),
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/Page23/1.png"),fit: BoxFit.contain)
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
                    "assets/Page23/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page23/6.png",
                    height: 25,
                  ),
                ),]),
            Expanded(child: Stack(
              children: [
                 Positioned(
                   bottom: 180,
                   right: -8,
                   child: InkWell(
                     onTap: (){},
                     child:Image.asset("assets/Page23/8.png",width: 430,height: 190,fit: BoxFit.fill),
                   ),
                 ),
                Positioned(
                  bottom: 180,
                  right: 280,
                  child: InkWell(
                    onTap: (){},
                    child:Image.asset("assets/Page23/7.png",width: 450,height: 190,fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 180,
                  left: -15,
                  child: InkWell(
                    onTap: (){},
                    child:Image.asset("assets/Page23/4.png",width: 430,height:190,fit: BoxFit.fill,),
                  ),
                ),
                 
                 
              Positioned(
                bottom: 20,
                left: 10,
                    child: InkWell(
                      onTap: (){
                        showOverlay(context, "assets/Page23/10.png");
                      },
                      child: Image.asset("assets/Page23/2.png",width: 150,)),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child:      InkWell(
                  onTap: (){
                    showOverlay(context, "assets/Page23/9.png");
                  },
                  child: Image.asset("assets/Page23/3.png",width: 150,)),)
              
              ]))
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
          color: const Color.fromARGB(196, 0, 0, 0),
          child: Center(
            child: GestureDetector(
              onTap: () {}, // To prevent taps on the image from closing the overlay
              child: Image(
                image: AssetImage(overlayImagePath),
                height: 500,
                width: 850,
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