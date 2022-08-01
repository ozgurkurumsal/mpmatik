import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Yazı işleri'),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(
                width: 150,
                child: Card(
                  // width: 200,
                  color: Colors.blue[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.pin_drop,
                          size: 36,
                          color: Colors.white,
                        ),
                        Text(
                          '130,00 TL',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'Benzin',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 150,
                child: Card(
                  // width: 200,
                  color: Colors.transparent,
                  child: Center(
                      child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )),
                ),
              ),
              Opacity(
                opacity: 0.2,
                child: Card(
                  elevation: 5,
                  // width: 200,
                  color: Colors.purple[500],
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                        child: Text(
                      'Item 2',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Card(
                  // width: 200,
                  color: Colors.purple[400],
                  child: const SizedBox(
                    width: 200,
                    child: Center(
                        child: Text(
                      'Item 3',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Card(
                  // width: 200,
                  color: Colors.purple[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.pin_drop),
                        Text('130 TL'),
                        Text('Benzin')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
