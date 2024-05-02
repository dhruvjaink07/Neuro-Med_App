import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page21 extends StatefulWidget {
  const Page21({super.key, required this.goToPreviousPage, required this.goToNextPage, });
   final VoidCallback goToPreviousPage;
    final VoidCallback goToNextPage;

  @override
  State<Page21> createState() => _Page21State();
}

class _Page21State extends State<Page21> {
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
          image: DecorationImage(image: AssetImage("assets/Page21/1.png"),fit: BoxFit.contain)
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
                    "assets/Page21/5.png",
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  icon: Image.asset(
                    "assets/Page21/6.png",
                    height: 25,
                  ),
                ),]),
            Expanded(child: Stack(
              children: [
                 Positioned(
                                   left: isOpen ? 20 :  10, // Adjust this value as needed
                                   bottom: 5,
                                   child: Visibility(
                                     visible: isOpen,
                                     child: Image.asset(
                                       "assets/Page21/3.png",
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
                                       "assets/Page21/2.png",
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
}