import 'package:flutter/material.dart';
import 'package:hqgps_flutter/Constants/Constant.dart';
import 'package:hqgps_flutter/bloc/bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
  }

  changeThePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MAP_SCREEN);
  }

  Widget build(BuildContext context) {
    final bloc = Bloc();
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wallpaper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width:0.0),
                        ),
                          border: OutlineInputBorder(),
                          hintText: "Enter email",
                          labelText: "Email",
                          labelStyle: new TextStyle(color: Colors.white),
                          hintStyle: new TextStyle(color: Colors.white),
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.passwordChanged,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: new TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width:0.0),
                        ),
                          border: OutlineInputBorder(),
                          hintText: "Enter password",
                          labelText: "Password",
                          labelStyle: new TextStyle(color: Colors.white),
                          hintStyle: new TextStyle(color: Colors.white),
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                      color: Colors.tealAccent,
                      onPressed: snapshot.hasData
                          ? () => changeThePage(context)
                          : null,
                      child: Text("Submit"),
                    ),
              ),
            ],
          ),
      ),
    )
    );
  }

}