import "package:flutter/material.dart";

class InputForm {
  String user, password;
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String username;
  String passWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: formKey,
            child: ListView(children: <Widget>[
              Image.asset(
                "resources/logo.jpg",
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), hintText: "User Id"),
                  onSaved: (value) {
                    username = value;
                  },
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock), hintText: "Password"),
                  obscureText: true,
                  onSaved: (value) {
                    passWord = value;
                  },
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text("LOGIN"),
                  onPressed: () {
                    formKey.currentState.save();
                    if (username == "" || passWord == "") {
                      scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("กรุณาระบุ user or password")));
                    } else if (username == "admin" && passWord == "admin") {
                      Navigator.pushNamed(context, "/home");
                    } else {
                      scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("user or password ไม่ถูกต้อง")));
                    }
                  },
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      "Register New Account",
                      style: TextStyle(color: Colors.teal),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                  ))
            ])),
      ),
    );
  }
}
