import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86,
      child: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/menu/SIDEBAR.png"),fit: BoxFit.fitHeight)),
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
              buildMenuItem( "assets/menu/OXET.png",() { }),
              // SizedBox(height: 20,),
              buildMenuItem( "assets/menu/LIOF.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/BETA.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/PIRA.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/PARK.png",() { }),
                //  SizedBox(height: 14,),
              buildMenuItem( "assets/menu/GAB-AT.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/PANA.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/PAXI.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/RASA.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/SYNA.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/TOPI.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/VEN.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/LAMO.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/ZEFR.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/ADES.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/ATTE.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/IVE.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/ETIR.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/LURA.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/SIZO.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/NEU-D3.png",() { }),
                //  SizedBox(height: 18,),
              buildMenuItem( "assets/menu/CARI.png",() { }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(String assetsImage, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(assetsImage,height: 14,),
    );
  }
}
