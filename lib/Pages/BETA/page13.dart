import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page13 extends StatefulWidget {
  const Page13({Key? key, required this.goToPreviousPage, required this.goToNextPage, required this.changePageIndex});

  final VoidCallback goToPreviousPage;
  final VoidCallback goToNextPage;
  final Function(int) changePageIndex; // Callback to change page index

  @override
  State<Page13> createState() => _Page13State();
}

class _Page13State extends State<Page13> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/Page13/1.png"),fit: BoxFit.contain)),
        child: Stack(
          children:[ 
              Positioned(
                top: 5,
                left: 5,
                child: Row(
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
              ),
            Positioned(
            right: 45,
            top: 75,
            child: Column(
              children: [InkWell(
  onTap: () {
    widget.changePageIndex(13); // Change to index 13 (Page 14)
  },
  child: Image.asset("assets/Page13/2.png", width: 503),
),

              InkWell(
                onTap: (){
                  widget.changePageIndex(14);
                },
                child: Image.asset("assets/Page13/3.png",width: 495,)),
              const SizedBox(height: 5,),
              InkWell(
                onTap: (){
                  widget.changePageIndex(15);
                },
                child: Image.asset("assets/Page13/4.png",width: 495,)),
              InkWell(
                onTap: (){
                  widget.changePageIndex(16);
                },
                child: Image.asset("assets/Page13/7.png",width: 503,)),
              ],
            ),
          ),]
        ),
      ),
    );
  }
}