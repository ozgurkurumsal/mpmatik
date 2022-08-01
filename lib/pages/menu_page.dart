import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menuler extends StatelessWidget {
  const Menuler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    return ListView(
      // padding: const EdgeInsets.all(8),
      // itemCount: entries.length,
      // itemBuilder: (BuildContext context, int index) {
      children: const [
        Card(
          child: ListTile(
            title: Text('Ek Limit Talebi'),
            subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.batteryFull,
              size: 30,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Tasarrufum'),
            subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.turkishLiraSign,
              size: 30,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Aylık Dağılımım'),
            subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.chartPie,
              size: 30,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Faturalarım'),
            subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.fileInvoice,
              size: 30,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Ödeme Yap'),
            subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.creditCard,
              size: 30,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Ödeme Hareketlerim'),
            subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.clipboardList,
              size: 30,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Taleplerim'),
            subtitle: Text('Altyazılar'),
            leading: FaIcon(
              FontAwesomeIcons.commentDots,
              size: 30,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ],
    );
  }
}
