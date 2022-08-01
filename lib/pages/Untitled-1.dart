import 'package:flutter/material.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';
import 'home_page.dart';

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 25),
                        const Text(
                          "MPMATIK",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors
                                  .amber), // Theme.of(context).textTheme.headline2,
// .merge(TextStyle(color: Colors.red),
                          // style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Colors.red)
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          // keyboardType: TextInputType.text,
                          initialValue: "MP64F81",
                          onSaved: (input) =>
                              // loginRequestModel.username = input,
                              loginRequestModel.username = input,
                          // validator: (input) => !input!.contains('@')
                          //     ? "Email Id should be valid"
                          //     : null,
                          decoration: const InputDecoration(
                            hintText: "Kullanıcı Adınız",
                            // enabledBorder: UnderlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .secondary
                            //             .withOpacity(0.2))),
                            // focusedBorder: UnderlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .secondary)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          // style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary),
                          // keyboardType: TextInputType.text,
                          initialValue: '12345',
                          onSaved: (input) =>
                              // loginRequestModel.password = '12345',
                              loginRequestModel.password = input,
                          // validator: (input) => input!.length < 3
                          //     ? "Password should be more than 3 characters"
                          //     : null,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            hintText: "Şifreniz",
                            // enabledBorder: UnderlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .secondary
                            //             .withOpacity(0.2))),
                            // focusedBorder: UnderlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .secondary)),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.amber,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              // color: Theme.of(context)
                              //     .colorScheme
                              //     .secondary
                              //     .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          // padding: EdgeInsets.symmetric(
                          // vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              // ignore: avoid_print
                              // print(loginRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              LoginService apiService = LoginService();
                              apiService.login(loginRequestModel).then((value) {
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
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                                  } else {
                                    // final snackBar =
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(value.error!)));
                                    //     SnackBar(content: Text(value.error!));
                                    // scaffoldKey.currentState!
                                    //     .showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          // color: Theme.of(context).accentColor,
                          // shape: StadiumBorder(),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
