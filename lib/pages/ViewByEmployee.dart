import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fms/pages/FineDetails.dart';
import 'package:fms/pages/ManagementMenu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'Message.dart';

class ViewByEmployee extends StatelessWidget{

  String employee = "";
  
  Future<void> viewDet(String empID, BuildContext context) async {
    try{
      Response res = await get(Uri.parse(
          "https://apex.oracle.com/pls/apex/fmsflutter/viewemp/viewemp?empid=$empID"));
      final data = json.decode(res.body);
      if (data["count"] > 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FineDetails(data["count"], data["items"])));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Message("No data found")));
      }
    }
    catch(e){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Message(e.toString())));
    }
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
                    Text("FINE DETAILS",style: GoogleFonts.bebasNeue(fontSize: 50),),
                    const SizedBox(height:30),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: "Employee ID",
                          hintText: "Employee ID"
                      ),
                      onChanged: (value){
                        employee = value;
                      },
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              viewDet(employee, context);
                            },
                            child: Text("Submit", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}