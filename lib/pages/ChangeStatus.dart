import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fms/pages/Message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class ChangeStatus extends StatefulWidget{
  @override
  ChangeStatusPage createState() => ChangeStatusPage();
}

class ChangeStatusPage extends State<ChangeStatus>{

  String empID = "";
  String fineID = "";
  String fineStatus = "UNPAID";

  Future<void> changeFineStatus(BuildContext context, String empID, String fineID, String status) async {
    try{
      Response res = await post(Uri.parse(
          "https://apex.oracle.com/pls/apex/fmsflutter/updfine/updfine?empid=$empID&fineid=$fineID&status=$status"));
      final data = json.decode(res.body);
      if (data["success"] == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Message("Successfully Updated")));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Message(data["message"])));
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
                    const SizedBox(height:100),
                    Text("CHANGE FINE STATUS",style: GoogleFonts.bebasNeue(fontSize: 50),),
                    const SizedBox(height:20),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: "Employee ID",
                          hintText: "Employee ID"
                      ),
                      onChanged: (value)
                      {
                        empID = value;
                      },
                    ),
                    const SizedBox(height:20),
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
                        width: 400,
                        child:DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              value: 'UNPAID',
                              child: Text('UNPAID'),
                            ),
                            DropdownMenuItem(
                              value: 'PAID',
                              child: Text('PAID'),
                            ),
                          ],
                          value: fineStatus,
                          onChanged: (value) {
                            setState(() {
                              fineStatus = value?? "";
                            });
                          },
                        )),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              changeFineStatus(context, empID, fineID, fineStatus);
                            },
                            child: Text("Change Status", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}