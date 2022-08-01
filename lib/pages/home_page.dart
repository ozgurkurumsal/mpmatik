import 'dart:convert';
import 'package:flutter/material.dart';
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
  int _selectedIndex = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // int? _departmentCode;
  String? _cariUnvan;
  late final Map<String, dynamic> unvan;

  List<Widget> menuler = const [
    Home(),
    Menuler(),
    Menuler(),
    Menuler(),
    Menuler(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Menuler()));
    }

    setState(() {
      _selectedIndex = index;
    });
  }

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
          backgroundColor: const Color(0xff009901),
          toolbarHeight: 65,
          centerTitle: true,
          title: const Text('..')
          // Image.network("https://mptasitmatik.com/admin/myimg/logoyazi.png"),
          // title: Text(unvan["cariUnvan"] ?? 'Boş'),
          ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Buraya Logo vb koyabiliriz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: menuler[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        // shape: const Text('Deneme'),

        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.photo),
                      title: const Text('Photo'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.music_note),
                      title: const Text('Music'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.videocam),
                      title: const Text('Video'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.share),
                      title: const Text('Share'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
          // Respond to button press
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent[800],
            unselectedItemColor: Colors.redAccent,
            onTap: _onItemTapped,

            // showSelectedLabels: false,
            // showUnselectedLabels: false,

            // backgroundColor: Colors.amber,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Anasayfa'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Deneme'),

              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'Ödeme Yap'),

              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'İstasyonlar'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Menü'),
              // BottomNavigationBarItem(icon: Icon(Icons.add), label: 'İson'),
            ]),
      ),
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
