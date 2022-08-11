import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menuler extends StatelessWidget {
  const Menuler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<String> entries = <String>['A', 'B', 'C'];
    return Scaffold(
      backgroundColor: const Color(0xfff0f1f5),
      body: ListView(
        // padding: const EdgeInsets.all(8),
        // itemCount: entries.length,
        // itemBuilder: (BuildContext context, int index) {
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'Ek Limit Talebi',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: const FaIcon(
              FontAwesomeIcons.batteryFull,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint('Ek Limit Menüsü');
            },
          ),
          ListTile(
            title: const Text(
              'Tasarrufum',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: const FaIcon(
              FontAwesomeIcons.turkishLiraSign,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint('Ek Limit Menüsü');
            },
          ),
          ListTile(
            title: const Text(
              'Aylık Dağılımım',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: const FaIcon(
              FontAwesomeIcons.chartPie,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint('Ek Limit Menüsü');
            },
          ),
          ListTile(
            title: const Text(
              'Faturalarım',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: const FaIcon(
              FontAwesomeIcons.fileInvoice,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint('Ek Limit Menüsü');
            },
          ),
          ListTile(
            title: const Text(
              'Ödeme Yap',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: const FaIcon(
              FontAwesomeIcons.creditCard,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint('Ek Limit Menüsü');
            },
          ),
          ListTile(
            title: const Text(
              'Ödeme Hareketlerim',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: const FaIcon(
              FontAwesomeIcons.clipboardList,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint('Ek Limit Menüsü');
            },
          ),
          ListTile(
            title: const Text(
              'Taleplerim',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: const FaIcon(
              FontAwesomeIcons.commentDots,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint('Ek Limit Menüsü');
            },
          ),
        ],
      ),
    );
  }
}
