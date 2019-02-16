import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String userName, passWord1, passWord2;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('REGISTER'),
          centerTitle: true,
        ),
        key: scaffoldKey,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: formKey,
                child: ListView(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email), hintText: 'email'),
                        onSaved: (value) {
                          userName = value;
                        },
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock), hintText: 'password'),
                      onSaved: (value) {
                        passWord1 = value;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 're-enter password'),
                      onSaved: (value) {
                        passWord2 = value;
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          formKey.currentState.save();
                          if (userName == '' ||
                              passWord1 == '' ||
                              passWord2 == '') {
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('กรุณาระบุข้อมูลให้ครบถ้วน'),
                            ));
                          }
                          if (userName == 'admin') {
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('user นี้มีอยู่ในระบบแล้ว'),
                            ));
                          }
                          if (userName != '' &&
                              passWord1 != '' &&
                              passWord2 != '' &&
                              userName != 'admin') {
                            Navigator.pop(context);
                          }
                        },
                      ))
                ]))));
  }
}
