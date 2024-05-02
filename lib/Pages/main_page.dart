import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neuro_app/controllers/oxet_page_controller.dart';

int count = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List numbers = [];
  List<int> displayIndices=[];
    Set<String> pages = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details){
          if(details.primaryVelocity!= null){
            if(details.primaryVelocity! < 0){
              // Swiped Right
              setState(() {
                count = 0;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OxetPageControllerWidget(displayIndices: displayIndices)));
            }
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/MainPage/Background.png"),
                  fit: BoxFit.contain)),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  // Refresh Button
                  Positioned(
                      left: 20,
                      top: 5,
                      child: Image.asset(
                        "assets/MainPage/refresh button.png",
                        height: 60,
                      )),
                  // OXET
                  Positioned(
                      top: 67,
                      left: 460,
                      child: InkWell(
                          onTap: () {
                            var one = "Oxet";
                            pages.add(one);
                            displayIndices.add(0);
                            displayIndices.add(1);
                            displayIndices.add(2);
                            displayIndices.add(3);
                            displayIndices.add(4);
                            displayIndices.add(5);
                            increment();
                            // numbers.add(count);
                            print("Item Added 1");
                          },
                          child: Brand(assetName: "assets/MainPage/OXET.png",selectionNumber: count,))),
        
                  // VEN
                  Positioned(
                      top: 67,
                      right: 205,
                      child: InkWell(
                          onTap: () {
                            var two = "ven";
                            pages.add(two);
                            increment();
                            // numbers.add(count);
                            print("Item Added 2");
                          },
                          child: Brand(assetName: "assets/MainPage/VEN.png",selectionNumber: count))),
        
                  // PANA
                  Positioned(
                      top: 124,
                      right: 340,
                      child: InkWell(
                          onTap: () {
                            print("3");
                                 var three = "pana";
                            pages.add(three);
                            increment();
                            numbers.add(count);
                          },
                          child: Brand(assetName: "assets/MainPage/PANA.png",selectionNumber: count))),
        
                  // ETIR
                  Positioned(
                      top: 124,
                      right: 63,
                      child: InkWell(
                          onTap: () {
                            print("4");
                                 var four = "etr";
                            pages.add(four);
                            increment();
                            numbers.add(count);
                          },
                          child: Brand(assetName: "assets/MainPage/ETIR.png",selectionNumber: count))),
                  // LIOF
                  Positioned(
                      top: 180,
                      left: 460,
                      child: InkWell(
                          onTap: () {
                            print("5");
                            increment();
                                 var five = "liof";
                                 displayIndices.add(6);
                                 displayIndices.add(7);
                                 displayIndices.add(8);
                                 displayIndices.add(9);
                                 displayIndices.add(10);
                                 displayIndices.add(11);
                            pages.add(five);
                            // numbers.add(count);
                          },
                          child: Brand(assetName: "assets/MainPage/LIOF.png",selectionNumber: count))),
                  // LAMO
                  Positioned(
                      top: 180,
                      right: 205,
                      child: InkWell(
                          onTap: () {
                            print("6");
                          },
                          child: Brand(assetName: "assets/MainPage/LAMO.png"))),
                  // PAXI
                  Positioned(
                      top: 238,
                      right: 340,
                      child: InkWell(
                          onTap: () {
                            print("7");
                          },
                          child: Brand(assetName: "assets/MainPage/PAXI.png"))),
        
                  // LURA
                  Positioned(
                      top: 238,
                      right: 63,
                      child: InkWell(
                          onTap: () {
                            print("8");
                          },
                          child: Brand(assetName: "assets/MainPage/LURA.png"))),
                  // BETA
                  Positioned(
                      top: 296,
                      left: 460,
                      child: InkWell(
                          onTap: () {
                            print("9");
                            displayIndices.add(12);
                            displayIndices.add(13);
                            displayIndices.add(14);
                            displayIndices.add(15);
                            displayIndices.add(16);
                          },
                          child: Brand(assetName: "assets/MainPage/BETA.png"))),
                  // ZEFR
                  Positioned(
                      top: 296,
                      right: 205,
                      child: InkWell(
                          onTap: () {
                            print("10");
                          },
                          child: Brand(assetName: "assets/MainPage/ZEFR.png"))),
                  // RASA
                  Positioned(
                      top: 352,
                      right: 340,
                      child: InkWell(
                          onTap: () {
                            print("11");
                          },
                          child: Brand(assetName: "assets/MainPage/RASA.png"))),
        
                  // SIZO
                  Positioned(
                      top: 352,
                      right: 63,
                      child: InkWell(
                          onTap: () {
                            print("12");
                          },
                          child: Brand(assetName: "assets/MainPage/SIZO.png"))),
                  // PIRA
                  Positioned(
                      top: 410,
                      left: 460,
                      child: InkWell(
                          onTap: () {
                            print("13");
                          },
                          child: Brand(assetName: "assets/MainPage/PIRA.png"))),
                  // ADES
                  Positioned(
                      top: 410,
                      right: 205,
                      child: InkWell(
                          onTap: () {
                            print("14");
                          },
                          child: Brand(assetName: "assets/MainPage/ADES.png"))),
                  // SYNA
                  Positioned(
                      top: 467,
                      right: 340,
                      child: InkWell(
                          onTap: () {
                            print("15");
                          },
                          child: Brand(assetName: "assets/MainPage/SYNA.png"))),
        
                  // NEU-D3
                  Positioned(
                      top: 467,
                      right: 63,
                      child: InkWell(
                          onTap: () {
                            print("16");
                          },
                          child: Brand(assetName: "assets/MainPage/NEU-D3.png"))),
                  // PARK
                  Positioned(
                      top: 522,
                      left: 460,
                      child: InkWell(
                          onTap: () {
                            print("17");
                          },
                          child: Brand(assetName: "assets/MainPage/PARK.png"))),
                  // ATTE
                  Positioned(
                      top: 522,
                      right: 205,
                      child: InkWell(
                          onTap: () {
                            print("18");
                          },
                          child: Brand(assetName: "assets/MainPage/ATTE.png"))),
                  // TOPI
                  Positioned(
                      top: 580,
                      right: 340,
                      child: InkWell(
                          onTap: () {
                            print("19");
                          },
                          child: Brand(assetName: "assets/MainPage/TOPI.png"))),
        
                  // CARI
                  Positioned(
                      top: 580,
                      right: 63,
                      child: InkWell(
                          onTap: () {
                            print("20");
                          },
                          child: Brand(assetName: "assets/MainPage/CARI.png"))),
                  // GAB-AT
                  Positioned(
                      top: 637,
                      left: 460,
                      child: InkWell(
                          onTap: () {
                            print("21");
                          },
                          child: Brand(assetName: "assets/MainPage/GAB-AT.png"))),
                  // IVE
                  Positioned(
                      top: 637,
                      right: 205,
                      child: InkWell(
                          onTap: () {
                            print("22");
                          },
                          child: Brand(assetName: "assets/MainPage/IVE.png"))),
        
                  
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      count = count + 1;
    });
  }
}

class Brand extends StatelessWidget {
  Brand({
    super.key,
    required this.assetName,
    this.selectionNumber =0
  });
  final String assetName;
  int selectionNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Image.asset(
        assetName,
        height: 70,
      ),
      Positioned(
        left: 0,
        child: 
        (selectionNumber != 0 && selectionNumber <= 24)?
        Image.asset("assets/MainPage/$selectionNumber.png",height: 25,):const SizedBox())
      ]
    );
  }
}
