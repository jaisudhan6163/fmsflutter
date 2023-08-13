import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fms/pages/FineDetails.dart';
import 'package:fms/pages/Message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'ManagementMenu.dart';

class ViewByFineID extends StatelessWidget{
  String fineID = "";

  Future<void> viewDet(BuildContext context, String fineID) async {
    try{
      Response res = await get(Uri.parse(
          "https://apex.oracle.com/pls/apex/fmsflutter/viewfine/viewfine?fineid=${fineID.toString()}"));
      final data = json.decode(res.body);
      if (data["count"] > 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FineDetails(1, data["items"])));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Message("No Data Found")));
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
                          labelText: "Fine Number",
                          hintText: "Fine Number"
                      ),
                      onChanged: (value){
                        fineID = value;
                      },
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              viewDet(context, fineID);
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