import 'package:flutter/material.dart';
import 'package:neuro_app/Pages/ADES/page54.dart';
import 'package:neuro_app/Pages/ATTE/page55.dart';
import 'package:neuro_app/Pages/BETA/page13.dart';
import 'package:neuro_app/Pages/BETA/page14.dart';
import 'package:neuro_app/Pages/BETA/page15.dart';
import 'package:neuro_app/Pages/BETA/page16.dart';
import 'package:neuro_app/Pages/BETA/page17.dart';
import 'package:neuro_app/Pages/CARI/page61.dart';
import 'package:neuro_app/Pages/CARI/page62.dart';
import 'package:neuro_app/Pages/ETI/page57.dart';
import 'package:neuro_app/Pages/GABAT/page21.dart';
import 'package:neuro_app/Pages/GABAT/page22.dart';
import 'package:neuro_app/Pages/IVE/page56.dart';
import 'package:neuro_app/Pages/LAMO/page51.dart';
import 'package:neuro_app/Pages/LIOF/page10.dart';
import 'package:neuro_app/Pages/LIOF/page11.dart';
import 'package:neuro_app/Pages/LIOF/page12.dart';
import 'package:neuro_app/Pages/LIOF/page7.dart';
import 'package:neuro_app/Pages/LIOF/page8.dart';
import 'package:neuro_app/Pages/LIOF/page9.dart';
import 'package:neuro_app/Pages/LURA/page58.dart';
import 'package:neuro_app/Pages/NEU-D3/page60.dart';
import 'package:neuro_app/Pages/OXET/page1.dart';
import 'package:neuro_app/Pages/OXET/page2.dart';
import 'package:neuro_app/Pages/OXET/page3.dart';
import 'package:neuro_app/Pages/OXET/page4.dart';
import 'package:neuro_app/Pages/OXET/page5.dart';
import 'package:neuro_app/Pages/OXET/page6.dart';
import 'package:neuro_app/Pages/PANA/page30.dart';
import 'package:neuro_app/Pages/PANA/page31.dart';
import 'package:neuro_app/Pages/PANA/page32.dart';
import 'package:neuro_app/Pages/PANA/page33.dart';
import 'package:neuro_app/Pages/PARK/page23.dart';
import 'package:neuro_app/Pages/PARK/page24.dart';
import 'package:neuro_app/Pages/PARK/page25.dart';
import 'package:neuro_app/Pages/PARK/page26.dart';
import 'package:neuro_app/Pages/PARK/page27.dart';
import 'package:neuro_app/Pages/PARK/page28.dart';
import 'package:neuro_app/Pages/PARK/page29.dart';
import 'package:neuro_app/Pages/PAXI/page34.dart';
import 'package:neuro_app/Pages/PAXI/page35.dart';
import 'package:neuro_app/Pages/PAXI/page36.dart';
import 'package:neuro_app/Pages/PAXI/page37.dart';
import 'package:neuro_app/Pages/PIRA/page18.dart';
import 'package:neuro_app/Pages/PIRA/page19.dart';
import 'package:neuro_app/Pages/PIRA/page20.dart';
import 'package:neuro_app/Pages/RASA/page38.dart';
import 'package:neuro_app/Pages/RASA/page39.dart';
import 'package:neuro_app/Pages/RASA/page40.dart';
import 'package:neuro_app/Pages/RASA/page41.dart';
import 'package:neuro_app/Pages/SIZO/page59.dart';
import 'package:neuro_app/Pages/SYNA/page42.dart';
import 'package:neuro_app/Pages/SYNA/page43.dart';
import 'package:neuro_app/Pages/SYNA/page44.dart';
import 'package:neuro_app/Pages/TOPI/page45.dart';
import 'package:neuro_app/Pages/TOPI/page46.dart';
import 'package:neuro_app/Pages/TOPI/page47.dart';
import 'package:neuro_app/Pages/TOPI/page48.dart';
import 'package:neuro_app/Pages/VEN/page49.dart';
import 'package:neuro_app/Pages/VEN/page50.dart';
import 'package:neuro_app/Pages/ZEFR/page52.dart';
import 'package:neuro_app/Pages/ZEFR/page53.dart';

class OxetPageControllerWidget extends StatefulWidget {
  const OxetPageControllerWidget({super.key, required this.displayIndices});
  final List<int> displayIndices;
  @override
  _OxetPageControllerWidgetState createState() =>
      _OxetPageControllerWidgetState();
}

class _OxetPageControllerWidgetState extends State<OxetPageControllerWidget> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  // List<int> displayIndices = [0, 2, 4, 6,5]; // Indices to display

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (_currentPageIndex < widget.displayIndices.length - 1) {
      _currentPageIndex++;
      _pageController.animateToPage(
        widget.displayIndices[_currentPageIndex],
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    } else {
      print('Warning: Already at the last page.');
    }
  }

  void goToPreviousPage() {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      _pageController.animateToPage(
        widget.displayIndices[_currentPageIndex],
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  void changePageIndex(int newPageIndex) {
    int? pageIndex = calculatePageIndex(newPageIndex);
    if (pageIndex != null && pageIndex != _currentPageIndex) {
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
      _currentPageIndex = pageIndex; // Update the current index
    } else {
      print(
          'Warning: Page not found for navigation or already at the same page.');
    }
  }

  int? calculatePageIndex(int newPageIndex) {
    int pageIndex = widget.displayIndices.indexOf(newPageIndex);
    if (pageIndex != -1) {
      return pageIndex;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.displayIndices.length,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final pageIndex =
              widget.displayIndices[index % widget.displayIndices.length];
          switch (pageIndex) {
            case 0:
              return Page1(
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 1:
              return Page2(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 2:
              return Page3(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 3:
              return Page4(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 4:
              return Page5(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 5:
              return Page6(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 6:
              return Page7(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 7:
              return Page8(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 8:
              return Page9(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,
                  );
            case 9:
              return Page10(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 10:
              return Page11(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 11:
              return Page12(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 12:
              return Page13(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );

            case 13:
              return Page14(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 14:
              return Page15(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 15:
              return Page16(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 16:
              return Page17(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 17:
              return Page18(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 18:
              return Page19(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 19:
              return Page20(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);

            case 20:
              return Page23(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 21:
              return Page24(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 22:
              return Page25(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 23:
              return Page26(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 24:
              return Page27(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 25:
              return Page28(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 26:
              return Page29(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 27:
              return Page21(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
              );
            case 28:
              return Page22(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 29:
              return Page30(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 30:
              return Page31(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 31:
              return Page32(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 32:
              return Page33(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 33:
              return Page34(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 34:
              return Page35(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 35:
              return Page36(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 36:
              return Page37(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 37:
              return Page38(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 38:
              return Page39(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 39:
              return Page40(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 40:
              return Page41(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 41:
              return Page42(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 42:
              return Page43(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 43:
              return Page44(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 44:
              return Page45(
                goToPreviousPage: goToPreviousPage,
                goToNextPage: goToNextPage,
                changePageIndex: changePageIndex,
              );
            case 45:
              return Page46(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 46:
              return Page47(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 47:
              return Page48(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage,
                  changePageIndex: changePageIndex,);
            case 48:
              return Page49(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 49:
              return Page50(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 50:
              return Page51(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 51:
              return Page52(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 52:
              return Page53(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 53:
              return Page54(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 54:
              return Page55(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 55:
              return Page56(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 56:
              return Page57(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 57:
              return Page58(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 58:
              return Page59(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 59:
              return Page60(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 60:
              return Page61(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            case 61:
              return Page62(
                  goToPreviousPage: goToPreviousPage,
                  goToNextPage: goToNextPage);
            default:
              return Container(); // Placeholder for any additional pages
          }
        },
      ),
    );
  }
}
