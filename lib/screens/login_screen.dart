import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:scoped_model/scoped_model.dart';

import '../data/helper/colors_res.dart';
import '../data/helper/constants.dart';
import '../data/models/master_data.dart';
import '../data/models/user.dart';
import '../widgets/button_login.dart';
import '../widgets/input_email.dart';
import '../widgets/password_input.dart';
import '../widgets/text_login.dart';
import '../widgets/vertical_text.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final _key1 = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool loader = false;
  User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsRes.appcolor,
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ColorsRes.secondgradientcolor,
                    ColorsRes.firstgradientcolor,
                  ]),
            ),
            child: ListView(
              children: <Widget>[
                Form(
                  key: _key1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(children: <Widget>[
                        VerticalText(),
                        TextLogin(),
                      ]),
                      InputEmail(),
                      PasswordInput(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildRememberMeCheckbox(),
                      loader == false
                          ? ButtonLogin(_key1, () async {
                              bool status = false;
                              setState(() {
                                loader = true;
                              });
                              status = await ScopedModel.of<MasterData>(context)
                                  .getDioServices
                                  .loginUser(context, _rememberMe)
                                  .whenComplete(() => null);
                              if (status) {
                                setState(() {
                                  loader = false;
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage(
                                            title: 'Admin Portal',
                                          )),
                                );
                                // showTheFormAlertSuccessDialog(
                                //     context, 'Success', 'Successfully Logged In');
                                // // Navigator.pop(context);
                              } else {
                                setState(() {
                                  loader = false;
                                });
                              }
                            })
                          : const CircularProgressIndicator(
                              color: ColorsRes.white),
                      // FirstTime(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      // padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      height: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }
}
