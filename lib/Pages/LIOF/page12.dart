import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page12 extends StatefulWidget {
  const Page12({super.key, required this.goToPreviousPage, required this.goToNextPage, });
 final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;
  @override
  State<Page12> createState() => _Page12State();
}

class _Page12State extends State<Page12> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page12/1.png"),fit: BoxFit.contain)),
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
                //  left: isOpen ? 25 :  30, // Adjust this value as needed
                left: 35,
                 bottom: 5,
                 child: Visibility(
                   visible: isOpen,
                   child: Image.asset(
                     "assets/Page12/3.png",
                     height: 40,
                   ).animate().fade(begin: -15).slide(begin: Offset(-1,0),curve: Curves.easeInOut,duration: Duration(milliseconds: 350)),
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
                                   "assets/Page12/2.png",
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
  }}