import 'package:demoprojects/formwidget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode myFocusNode;
  final formKey = GlobalKey<FormState>();
  String name;
  String email;
  String phone;
  String password;
  bool autoValidate = false;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return "Enter Name";
    } else {
      return null;
    }
  }

  String _validatePassword(String value) {
    if (value.isEmpty) {
      return "Enter Password";
    } else {
      return null;
    }
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return "Enter email address";
    }
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Email is not valid';
  }

  String _validatePhone(value) {
    if (value.isEmpty) {
      return "Enter Phone number";
    }
    String p = "^(?:[+0]9)?[0-9]{10}";
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Enter valid Phone number';
  }

  void validateInputs() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
    } else {
      setState(() => autoValidate = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var signupProvider = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Form(
                    key: formKey,
                    autovalidate: autoValidate,
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Column(
                              children: <Widget>[
                                Groupwidget().inputs('Name', name,
                                    _validateName, TextInputType.text),
                                Groupwidget().inputs('Email', email,
                                    _validateEmail, TextInputType.emailAddress),
                                Groupwidget().inputs('Phone Number', phone,
                                    _validatePhone, TextInputType.number),
                                Groupwidget().inputs('Password', password,
                                    _validatePassword, TextInputType.text),
                                Groupwidget().actionbutton(context),
                              ],
                            )))),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
