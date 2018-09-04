import 'package:flutter/services.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';
import 'package:flutter/material.dart';

// The layout of this screen will be improved - GroovinChip

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  initState() {
    super.initState();
    SimpleAuthFlutter.init(context);
  }

  final simpleAuth.GithubApi githubApi = simpleAuth.GithubApi(
      "github", "9020fb1eded8b2a9206f",
      "635a3c0c4513af8899339002fd20164182bc817c",
      "https://github.com/GroovinChip/Flutter-Community-Challenges",
  );
  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = new AlertDialog(content: new Text(text), actions: <Widget>[
      new FlatButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(simpleAuth.AuthenticatedApi api) async {
    try {
      var success = await api.authenticate();
      showMessage("Logged in success: $success");
    } catch (e) {
      showError(e);
    }
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Text("Flutter Community",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Challenges",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 00.0),
                child: RaisedButton.icon(
                  onPressed: (){
                    login(githubApi);
                    },
                  icon: Icon(GroovinMaterialIcons.github_circle, color: Colors.white,),
                  label: Text("Sign in with GitHub", style: TextStyle(color: Colors.white),),
                  color: Colors.indigo,
                ),
              ),
              FlatButton(onPressed: (){}, child: Text("Dev Login"))
            ],
          ),
        ),
      ),
    );
  }
}
