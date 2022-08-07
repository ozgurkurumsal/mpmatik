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
        children: const [
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Ek Limit Talebi',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.batteryFull,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Tasarrufum',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.turkishLiraSign,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Aylık Dağılımım',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.chartPie,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Faturalarım',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.fileInvoice,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Ödeme Yap',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.creditCard,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Ödeme Hareketlerim',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.clipboardList,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Taleplerim',
              style: TextStyle(color: Color(0xff3bbd00)),
            ),
            // subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.commentDots,
              size: 25,
              color: Color(0xff3bbd00),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
