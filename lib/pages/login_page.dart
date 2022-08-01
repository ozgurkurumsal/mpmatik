import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpmatik/pages/password_input.dart';
import 'package:mpmatik/pages/rounded_button.dart';
import 'package:mpmatik/pages/text_input.dart';
import '../model/login_model.dart';
import 'background_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
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
                          children: const [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Şifre',
                              inputAction: TextInputAction.done,
                            ),
                            Text(
                              'Şifremi Unuttum',
                              style: TextStyle(color: Colors.white),
                              // style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            SizedBox(
                              height: 30,
                            ),
                            RoundedButton(
                              buttonText: 'GİRİŞ YAP',
                            ),
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
}
