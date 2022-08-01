import 'package:flutter/material.dart';
import 'package:mpmatik/pages/home_page.dart';
import 'package:mpmatik/pages/login_page.dart';
//import 'package:mpmatik/pages/login_page.dart';
import 'model/login_model.dart';
import 'service/login_service.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MPMatik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<LoginResponseModel> _incrementCounter() async {
    LoginRequestModel loginRequestModel;
    loginRequestModel = LoginRequestModel();

    loginRequestModel.username = 'MP64F81';
    loginRequestModel.password = '12345';

    LoginResponseModel deneme = await LoginService().login(loginRequestModel);
    return deneme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter().then((value) {
            // print(value.departmentCode);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          });
          // print(result.departmentCode);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
