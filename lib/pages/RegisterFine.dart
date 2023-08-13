import 'package:flutter/material.dart';
import 'package:fms/pages/ConfirmPage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ManagementMenu.dart';

class RegisterFine extends StatefulWidget{

  RegisterFinePage createState() => RegisterFinePage();
}

class RegisterFinePage extends State<RegisterFine>{

  String employeeID = "";
  double fineAmount = 0.00;
  String description = "";

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
                    Text("FINE DETAILS",style: GoogleFonts.bebasNeue(fontSize: 30),),
                    const SizedBox(height: 10,),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: "Employee ID",
                          hintText: "Employee ID"
                      ),
                      onChanged: (value){
                        setState(() {
                          employeeID = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Fine Amount",
                          hintText: "Fine Amount"
                      ),
                      onChanged: (value){
                        setState(() {
                          fineAmount = double.parse(value);
                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      maxLines: 6,
                      decoration: const InputDecoration(
                          labelText: "Description",
                          hintText: "Description"
                      ),
                      onChanged: (value){
                        setState(() {
                          description = value;
                        });
                      },
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ConfirmPage(employeeID,fineAmount,description))
                              );},
                            child: Text("Submit", style: GoogleFonts.heebo(fontSize: 20),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}