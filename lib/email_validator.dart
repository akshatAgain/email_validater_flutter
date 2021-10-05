import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Validator extends StatefulWidget {
  const Validator({Key? key}) : super(key: key);

  @override
  _ValidatorState createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  final _emailController = TextEditingController();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.white,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "email",
                hintStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 17.0,
                ),
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          FlatButton(
            child: Text(
              'Validate',
              style: TextStyle(color: Colors.blue),
            ),
            color: Colors.white,
            onPressed: () {
              isValid = EmailValidator.validate(_emailController.text);
              if (isValid) {
                Fluttertoast.showToast(
                    msg: "Valid Email",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);
              } else if (_emailController.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: 'Enter Email',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);
              } else {
                Fluttertoast.showToast(
                    msg: 'Enter a Valid Email',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);
              }
            },
          )
        ],
      )),
    );
  }
}

