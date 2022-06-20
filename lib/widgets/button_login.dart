import 'package:flutter/material.dart';
import '../data/helper/colors_res.dart';

class ButtonLogin extends StatefulWidget {
  final GlobalKey<FormState> _key1;
  Function function;
  ButtonLogin(this._key1, this.function, {Key? key}) : super(key: key);
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 40,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorsRes.txtdarkcolor,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
        ),
        child: FlatButton(
          padding: const EdgeInsets.all(12),
          onPressed: () async {
            if (widget._key1.currentState!.validate()) {
              widget.function();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'OK',
                style: TextStyle(
                  color: ColorsRes.appcolor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: ColorsRes.appcolor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
