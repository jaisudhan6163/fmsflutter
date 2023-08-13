import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:fms/pages/ManagementMenu.dart';
import 'package:fms/pages/FineDetails.dart';
import 'package:fms/pages/Message.dart';

class Login extends StatefulWidget{

  String user = "";

  Login(String usr){
    user = usr;
  }

  @override
  LoginPage createState() => LoginPage(user);
}

class LoginPage extends State<Login>{

  String username = "";
  String password = "";
  String user =  "";

  void setUsername(String value){
    setState(()=> username = value);
  }

  void setPassword(String value){
    setState(()=> password = value);
  }

  void mgmtLogin(String user, String pass, BuildContext context) async{
    try{
      Response res = await post(Uri.parse("https://apex.oracle.com/pls/apex/fmsflutter/mgmtlgn/mgmtlgn?username=$user&pass=$pass"));
      final data = json.decode(res.body);
      print(data);
      if(data["success"]==true) {
        callMgmtMenu(context);
      } else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Message("LOGIN UNSUCCESSFUL"))
        );
      }
    }
    catch(e){
      print(e.toString());
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> Message("LOGIN UNSUCCESSFUL")));
        }
  }

  void empLogin(String user, String pass, BuildContext context) async{
    try{
      Response res = await post(Uri.parse("https://apex.oracle.com/pls/apex/fmsflutter/emplgn/emplgn?username=$user&pass=$pass"));
      final data = json.decode(res.body);
      if(data["success"]==true)
        callEmpFineDet(context, user);
      else{
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Message("LOGIN UNSUCCESSFUL"))
        );
      }
    }
    catch(e){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> Message("LOGIN UNSUCCESSFUL")));
    }
  }

  void callMgmtMenu(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ManagementMenu())
    );
  }

  Future<void> callEmpFineDet(BuildContext context, String empid) async {
    try{
      Response res =await get(Uri.parse("https://apex.oracle.com/pls/apex/fmsflutter/viewemp/viewemp?empid=$empid"));
      final data = json.decode(res.body);
      if(data["count"]>0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => FineDetails(data["count"], data["items"])));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Message("No data found")));
      }
    }
    catch(e){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Message(e.toString())));
    }
  }

  LoginPage(String us){
    user = us;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back),
      ),
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
              child: Column(
                  children: <Widget>[
                    const SizedBox(height:140),
                    Text("$user LOGIN",style: GoogleFonts.bebasNeue(fontSize: 50),),
                    const SizedBox(height:30),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: "Username",
                          hintText: "Username"
                      ),
                      onChanged: setUsername
                    ),
                    const SizedBox(height:50),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Password"
                      ),
                      onChanged: setPassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              if (user == "MANAGEMENT") {
                                mgmtLogin(username, password, context);
                              } else {
                                empLogin(username, password, context);
                              }
                            },
                            child: Text("Login", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}