import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fms/pages/Message.dart';
import 'package:fms/pages/RegisterFine.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'ManagementMenu.dart';

class ConfirmPage extends StatelessWidget{

  String employeeID = "";
  String fineID = "";
  double amount = 0;
  String description = "";

  ConfirmPage(String empID, double amnt, String des){
    employeeID = empID;
    amount = amnt;
    description = des;
  }

  void newFine(String empID, double amnt, String des, BuildContext context) async{

    try{
      Response res = await post(Uri.parse("https://apex.oracle.com/pls/apex/fmsflutter/crtfine/crtfine?empid=$empID&amount=${amnt.toString()}&status=UNPAID&des=$des"));
      final data = json.decode(res.body);
      if(data["success"]==true){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Message("Fine registered")));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Message("Fine not registered")));
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
                    const SizedBox(height: 50),
                    Text("FINE DETAILS",style: GoogleFonts.bebasNeue(fontSize: 50),),
                    const SizedBox(height: 25,),
                    Card(
                        child:
                        Row(
                          children: [
                            const Align(alignment: Alignment.centerLeft, child:Text("Employee ID:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                            Align(alignment: Alignment.centerLeft, child:Text(employeeID,style: const TextStyle(fontSize: 20,),),),
                            const Text("\n")
                          ],
                        )
                    ),
                    const SizedBox(height: 25,),
                    Card(
                        child:
                        Row(
                          children: [
                            const Align(alignment: Alignment.centerLeft, child:Text("Fine Amount:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                            Align(alignment: Alignment.centerLeft, child:Text(amount.toString(),style: const TextStyle(fontSize: 20,),),),
                            const Text("\n")
                          ],
                        )
                    ),
                    const SizedBox(height: 25,),
                    Card(
                        child:
                        Column(
                          children: [
                            const Align(alignment: Alignment.centerLeft, child:Text("Description:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                            const SizedBox(height: 5,),
                            Align(alignment: Alignment.centerLeft, child:Text(description,style: const TextStyle(fontSize: 20,),),),
                            const SizedBox(height: 5,),
                          ],
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              newFine(employeeID, amount, description, context);
                            },
                            child: Text("Confirm Details", style: GoogleFonts.heebo(fontSize: 20),)
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Edit Details", style: GoogleFonts.heebo(fontSize: 20),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}