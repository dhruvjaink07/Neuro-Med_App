import 'package:flutter/material.dart';
import 'package:neuro_app/controllers/oxet_page_controller.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: 86, // Adjust drawer width
      child: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/menu/SIDEBAR.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 52,),
              buildMenuItem("assets/menu/OXET.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [0, 1, 2, 3, 4, 5])));
                  
              }),
              // SizedBox(height: 20,),
              buildMenuItem("assets/menu/LIOF.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [6,7,8,9,10,11])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/BETA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [12,13,14,15,16])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PIRA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [17,18,19])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PARK.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [22,23,24,25,26,27,28])));
              }),
              //  SizedBox(height: 14,),
              buildMenuItem("assets/menu/GAB-AT.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [20,21])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PANA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [29,30,31,32])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/PAXI.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [33,34,35,36])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/RASA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [37,38,39,40])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/SYNA.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [41,42,43])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/TOPI.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [44,45,46,47])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/VEN.png", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [48,49])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/LAMO.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [50])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ZEFR.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [51,52])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ADES.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [53])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ATTE.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [54])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/IVE.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [55])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/ETIR.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [56])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/LURA.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [57])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/SIZO.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [58])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/NEU-D3.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [59])));
              }),
              //  SizedBox(height: 18,),
              buildMenuItem("assets/menu/CARI.png", () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OxetPageControllerWidget(
                            displayIndices: [60,61])));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(String assetsImage, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        child: Image.asset(
          assetsImage,
          height: 15,
        ),
      ),
    );
  }
}
