import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/main_page.dart';
import 'package:neuro_app/components/cDrawer.dart';

class Page4 extends StatefulWidget {
    final VoidCallback goToPreviousPage;
     final VoidCallback goToNextPage;
  const Page4({super.key, required this.goToPreviousPage, required this.goToNextPage, });

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      bool isOpen = false;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(screenHeight: MediaQuery.of(context).size.height),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Page4/11.png"), fit: BoxFit.contain)),
                child: Column(
                  children: [
                     Row(
              children: [
                IconButton(
                    onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Image.asset(
                      "assets/Page4/5.png",
                      height: 20,
                    )),
                IconButton(
                    onPressed: () {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                    },
                    icon: Image.asset(
                      "assets/Page4/6.png",
                      height: 25,
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.27,
            ),
            Container(
              height: 100,
              margin: const EdgeInsets.only(left: 20, top: 15),
              alignment: Alignment.bottomLeft,
              child: Stack(
                children: [
                Positioned(
                    left:   10, // Adjust this value as needed
                    bottom: 0,
                    child: Visibility(
                      visible: isOpen,
                      child: Image.asset(
                        "assets/Page4/3.png",
                        height: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      child: Image.asset(
                        "assets/Page4/2.png",
                        height: 45,
                      ),
                    ),
                  ),
                ],
              ),
            )
                  ],
                ),
      ),
    );
  }
}