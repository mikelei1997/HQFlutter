import 'package:flutter/material.dart';
import 'package:hqgps_flutter/Constants/Constant.dart';
import 'package:hqgps_flutter/bloc/bloc.dart';
import 'package:http/http.dart' show Client;

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
  }

  void _login(account, password) async{
    Client client = Client();
    String _baseUrl = 'http://api.56gps.com/weixin/get_gps_info.php?action=wx_bind&user=' + account + '&psw=' + password;
    final response = await client.get("$_baseUrl");
    print(response.body.toString());
    if (response.statusCode == 200) {
      if(response.body.toString().length > 15){
         Navigator.of(context).pushReplacementNamed(MAP_SCREEN);
      } else {
        throw Exception('Failed to Login');
      }
    } else {
      throw Exception('Failed to Login');
    }
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
                stream: bloc.account,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.accountChanged,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width:0.0),
                        ),
                          border: OutlineInputBorder(),
                          labelText: "账号",
                          labelStyle: new TextStyle(color: Colors.white),
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
                          labelText: "密码",
                          labelStyle: new TextStyle(color: Colors.white),
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
                          ? () => _login(bloc.currentAccount, bloc.currentPassword)
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