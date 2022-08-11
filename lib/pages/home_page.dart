import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mpmatik/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // int? _departmentCode;
  String? _cariUnvan;
  late final Map<String, dynamic> unvan;
  bool isBottomClicked = false;
  List<Widget> menuler = const [
    Home(),
    Menuler(),
    Menuler(),
    Profile(),
    Menuler(),
  ];

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final controller = PageController(
    initialPage: 0,
    //keepPage: true,
  );

  // void _onItemTapped(int index) {
  //   if (index == 2) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const Menuler()));
  //   }

  //   setState(() {
  //     // _selectedIndex = index;
  //   });
  // }

  Future<void> getCode() async {
    final SharedPreferences prefs = await _prefs;
    // _departmentCode = (prefs.getInt('departmentCode'));
    _cariUnvan = prefs.getString('data');
    // print(_cariUnvan["departmentCode"].toString() ?? "x");
    debugPrint(_cariUnvan);
    unvan = json.decode(_cariUnvan ?? "");
    // debugPrint(unvan["cariUnvan"]);
    // debugPrint(unvan["departmentCode"]);

    // print('Get Code');

    setState(() {});
  }

  @override
  initState() {
    super.initState();
    // getCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 65,
        // centerTitle: true,
        // leadingWidth: 650,
        // automaticallyImplyLeading: false,
        title: SizedBox(
          width: 200,
          child: Image.asset(
            'assets/images/login_logo_trimmed.png',
            fit: BoxFit.contain,
            // width: 300,
            // height: 200,
          ),
        ),
        // Image.network("https://mptasitmatik.com/admin/myimg/logoyazi.png"),
        // title: Text(unvan["cariUnvan"] ?? 'Boş'),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: const <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Buraya Logo vb koyabiliriz',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.message),
      //         title: Text('Messages'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_circle),
      //         title: Text('Profile'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Settings'),
      //       ),
      //     ],
      //   ),
      // ),
      body: PageView(
          //scrollDirection: Axis.vertical,
          controller: controller,
          children: const [Home(), Menuler(), Menuler(), Profile(), Menuler()],
          onPageChanged: (value) {
            setState(() {
              _page = value;
            });
          }),

      // BottomBarPageTransition(
      //   builder: (_, index) => menuler[index],
      //   currentIndex: _page,
      //   totalLength: 5,
      //   transitionType: TransitionType.slide,
      //   transitionDuration: const Duration(milliseconds: 200),
      //   transitionCurve: Curves.ease,
      // ),

      /* PageView(
          //scrollDirection: Axis.vertical,
          controller: controller,
          children: const [Home(), Menuler(), Menuler(), Profile(), Menuler()],
          onPageChanged: (value) {
            setState(() {
              _page = value;
            }); */
      /*  await Future.delayed(const Duration(seconds: 20), () {
              final CurvedNavigationBarState? navBarState =
                  _bottomNavigationKey.currentState;
              navBarState?.setPage(value);
            }); */

      /*  setState(() {
              _page = value;
            });
            print(isBottomClicked); */
      /* if (!isBottomClicked) {
              setState(() {
                _page = value;
              });
            } else {
              setState(() {
                isBottomClicked = false;
              });
              return;
            } */

      /* await Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                _page = value;
              });
            }); */

      //setState(() {

      /*   final CurvedNavigationBarState? navBarState =
                _bottomNavigationKey.currentState;
            navBarState?.setPage(value); */

      //});
      /* await Future.delayed(Duration(milliseconds: 600));
            //setState(() {
            final CurvedNavigationBarState? navBarState =
                _bottomNavigationKey.currentState;
            navBarState?.setPage(value); */
      //_page = value;
      //});
      //}

      //_page = value;
      //),

      //menuler[_page],
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Align(
      //   alignment: const Alignment(0, 0.92),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       // color: Colors.black,
      //       borderRadius: BorderRadius.all(Radius.circular(50)),
      //       boxShadow: [
      //         // color: Colors.white,
      //         BoxShadow(
      //           color: Colors.black54,
      //           // blurRadius: 25.0, // soften the shadow
      //           spreadRadius: 5.0, //extend the shadow
      //           offset: Offset(
      //             0, // Move to right 10  horizontally
      //             0, // Move to bottom 10 Vertically
      //           ),
      //         )
      //       ],
      //     ),
      //     width: 65,
      //     height: 65,
      //     child: FloatingActionButton(
      //       // shape: Shap,
      //       backgroundColor: Colors.black,
      //       // foregroundColor: Colors.black,
      //       // shape: const Text('Deneme'),

      //       onPressed: () {
      //         showModalBottomSheet(
      //             context: context,
      //             shape: const RoundedRectangleBorder(
      //                 borderRadius:
      //                     BorderRadius.vertical(top: Radius.circular(20))),
      //             builder: (context) {
      //               return Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: <Widget>[
      //                   ListTile(
      //                     leading: const Icon(Icons.photo),
      //                     title: const Text('Photo'),
      //                     onTap: () {
      //                       Navigator.pop(context);
      //                     },
      //                   ),
      //                   ListTile(
      //                     leading: const Icon(Icons.music_note),
      //                     title: const Text('Music'),
      //                     onTap: () {
      //                       Navigator.pop(context);
      //                     },
      //                   ),
      //                   ListTile(
      //                     leading: const Icon(Icons.videocam),
      //                     title: const Text('Video'),
      //                     onTap: () {
      //                       Navigator.pop(context);
      //                     },
      //                   ),
      //                   ListTile(
      //                     leading: const Icon(Icons.share),
      //                     title: const Text('Share'),
      //                     onTap: () {
      //                       Navigator.pop(context);
      //                     },
      //                   ),
      //                 ],
      //               );
      //             });
      //         // Respond to button press
      //       },
      //       child: Container(
      //         height: 70,
      //         width: 70,
      //         decoration: BoxDecoration(
      //           color: Colors.black,
      //           borderRadius: BorderRadius.all(Radius.circular(50)),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black.withOpacity(0.2),
      //               spreadRadius: 3,
      //               blurRadius: 2,
      //               offset: Offset(0, 4),
      //             ),
      //           ],
      //         ),
      //         child: Icon(Icons.credit_card),
      //       ),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 60.0,
        items: const [
          Icon(Icons.home, size: 30),
          FaIcon(
            FontAwesomeIcons.gasPump,
            size: 20,
            // color: Color(0xff3bbd00),
          ),
          // Icon(Icons., size: 30),

          Icon(Icons.credit_card, size: 30),
          Icon(Icons.perm_identity, size: 30),
          Icon(Icons.list, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color(0xfff0f1f5),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          // setState(() {
          //   _page = index;
          // });
          // controller.animateToPage(index,
          //     duration: const Duration(milliseconds: 150),
          //     curve: Curves.easeIn);

          /*  Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.leftToRight,
              child: Menuler(),
            ),
          ); */
          controller.jumpToPage(index);
          //setState(() {});
          /* await Future.delayed(const Duration(milliseconds: 600));

          controller.animateToPage(index,
              duration: const Duration(milliseconds: 1000), */
          //  curve: Curves.decelerate);

          //setState(() {
          //  _page = index;
          //});
          /* final CurvedNavigationBarState? navBarState =
              _bottomNavigationKey.currentState;
          navBarState?.setPage(index); */
        },
        //letIndexChange: (index) => true,
      ),
      // bottomNavigationBar: Theme(
      //   data: Theme.of(context).copyWith(
      //     splashColor: Colors.transparent,
      //     highlightColor: Colors.transparent,
      //     splashFactory: NoSplash.splashFactory,
      //     hoverColor: Colors.transparent,
      //   ),
      //   child: BottomNavigationBar(
      //       type: BottomNavigationBarType.fixed,
      //       currentIndex: _selectedIndex,
      //       selectedItemColor: Colors.blueAccent[800],
      //       unselectedItemColor: Colors.redAccent,
      //       onTap: _onItemTapped,

      //       // showSelectedLabels: false,
      //       // showUnselectedLabels: false,

      //       // backgroundColor: Colors.amber,
      //       items: const [
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.home), label: 'Anasayfa'),
      //         BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Deneme'),

      //         BottomNavigationBarItem(
      //             icon: Padding(
      //               padding: EdgeInsets.only(top: 8.0),
      //               child: Text(' '),
      //             ),
      //             label: 'Ödeme Yap'),

      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.add), label: 'İstasyonlar'),
      //         BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Menü'),
      //         // BottomNavigationBarItem(icon: Icon(Icons.add), label: 'İson'),
      //       ]),

      // ),
    );
  }

  Widget bodyFirst() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              color: Colors.grey[400],
              width: double.infinity,
              height: 40,
              child: const Center(child: Text('TÜMBÜLLER A.Ş.'))),
          Align(
            alignment: Alignment.bottomCenter,
            child: GridView.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.9, //(2 / 1),
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () => debugPrint('Tıklandı'),
                  child: Card(
                    color: const Color(0xff959801),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.cartFlatbed,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              '10.000 TL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'TANIMLI LİMİTİM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(''),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: const Color(0xff74B749),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.chartLine,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            '10.000 TL',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'GÜNCEL TÜKETİMİM',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(''),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xff847cc5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.batteryHalf,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            '10.000 TL',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'KALAN LİMİTİM',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(''),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xff9d4a9c),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.batteryFull,
                            size: 40,
                            color: Colors.white,
                          ),
                          // Text(
                          //   '10.000 TL',
                          //   style: TextStyle(color: Colors.white, fontSize: 16),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'EK LİMİT TALEBİ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xff0DAED3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.turkishLiraSign,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'TASARRUFUM',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xff77808a),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.chartPie,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'ALIM DAĞILIMIM',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xff847cc5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.fileInvoice,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'FATURALARIM',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xffFFB400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.creditCard,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'ÖDEME YAP',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xfff37b53),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.clipboardList,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'ÖDEME HAREKETLERİM',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color(0xffde577b),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.commentDots,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'TALEPLERİM',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
