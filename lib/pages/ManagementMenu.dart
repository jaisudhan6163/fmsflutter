import 'package:flutter/material.dart';
import 'package:fms/pages/ChangeStatus.dart';
import 'package:fms/pages/ManagementView.dart';
import 'package:fms/pages/RegisterFine.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementMenu extends StatelessWidget{


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
                    Text("MENU",style: GoogleFonts.bebasNeue(fontSize: 50),),
                    const SizedBox(height:50),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterFine())
                              );
                            },
                            child: Text("NEW FINE", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ManagementView())
                              );
                            },
                            child: Text("VIEW", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ChangeStatus())
                              );},
                            child: Text("PAY FINE", style: GoogleFonts.heebo(fontSize: 25),)
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}