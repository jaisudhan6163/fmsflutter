import 'package:flutter/material.dart';
import 'package:fms/pages/FineDetails.dart';
import 'package:fms/pages/ManagementMenu.dart';
import 'package:fms/pages/Message.dart';
import 'package:fms/pages/ViewByFineID.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'ViewByEmployee.dart';

class ManagementView extends StatelessWidget{

  void viewAllDetails(BuildContext context) async{
    try{
      Response res = await get(Uri.parse("https://apex.oracle.com/pls/apex/fmsflutter/viewall/viewall"));
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
                    const SizedBox(height:180),
                    Text("VIEW FINE DETAILS",style: GoogleFonts.bebasNeue(fontSize: 50),),
                    const SizedBox(height:50),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              viewAllDetails(context);
                            },
                            child: Text("VIEW ALL", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewByEmployee()));
                            },
                            child: Text("VIEW BY EMPLOYEE", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewByFineID()));
                            },
                            child: Text("VIEW BY FINE NUMBER", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}