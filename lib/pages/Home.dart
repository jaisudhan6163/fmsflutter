import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fms/pages/Login.dart';

class Home extends StatelessWidget{

  void callLogin(String user,BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login(user))
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
              child: Column(
                  children: <Widget>[
                    const SizedBox(height:180),
                    Text("FINE MANAGEMENT SYSTEM",style: GoogleFonts.bebasNeue(fontSize: 50),),
                    const SizedBox(height:50),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              callLogin("MANAGEMENT", context);
                            },
                            child: Text("Management Login", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              callLogin("EMPLOYEE", context);
                            },
                            child: Text("Employee Login", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}