import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpmatik/pages/password_input.dart';
import 'package:mpmatik/pages/text_input.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';
import 'background_image.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  final emailcontroller = TextEditingController(text: 'MP64F81');
  final passwordcontroller = TextEditingController(text: '12345');
  // TextEditingController? emailcontroller;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
    // initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login_logo.png'),
                        // fit: BoxFit.contain,
                        // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              emailcontroller: emailcontroller,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Şifre',
                              inputAction: TextInputAction.done,
                              passwordcontroller: passwordcontroller,
                            ),
                            const Text(
                              'Şifremi Unuttum',
                              style: TextStyle(color: Colors.white),
                              // style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(180, 50)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(10)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              onPressed: () async {
                                loginRequestModel.username =
                                    emailcontroller.text;
                                loginRequestModel.password =
                                    passwordcontroller.text;
                                // if (validateAndSave()) {
                                // print(loginRequestModel.toJson());

                                setState(() {
                                  isApiCallProcess = true;
                                });

                                LoginService apiService = LoginService();
                                await EasyLoading.show(
                                  status: 'Lütfen Bekleyin...',
                                  maskType: EasyLoadingMaskType.custom,
                                );
                                print('EasyLoading show');
                                apiService
                                    .login(loginRequestModel)
                                    .then((value) {
                                  // ignore: unnecessary_null_comparison
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value.departmentCode != 0) {
                                      // ScaffoldMessenger.of(context).showSnackBar(
                                      //     const SnackBar(
                                      //         content: Text(
                                      //             "Enter somethong here to display on snackbar")));

                                      // SnackBar(
                                      //     content: Text("Login Successful"));
                                      // scaffoldKey.currentState!
                                      //     .showSnackBar(snackBar);
                                      EasyLoading.dismiss();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    } else {
                                      // final snackBar =
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(value.error!)));
                                      //     SnackBar(content: Text(value.error!));
                                      // scaffoldKey.currentState!
                                      //     .showSnackBar(snackBar);
                                    }
                                  }
                                });
                                // }
                              },
                              child: const Text('GİRİŞ YAP'),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // bool validateAndSave() {
  //   final form = globalFormKey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }
}
