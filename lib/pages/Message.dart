import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Message extends StatelessWidget{

  String message = "";

  Message(String msg){
    message = msg;
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
                    const SizedBox(height:250),
                    Text(message,style: GoogleFonts.bebasNeue(fontSize: 50),),
                  ]
              )
          )
      ),
    );
  }
}