import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FineDetails extends StatefulWidget{

  int indx = 0;
  List data = [];

  FineDetails(int ind, List dt, {super.key}){
    indx = ind;
    data = dt;
  }

  @override
  FineDetailsPage createState() => FineDetailsPage(indx, data);
}

class FineDetailsPage extends State<FineDetails>{

  int index = 0;
  List data = [];
  int length = 0;

  FineDetailsPage(int ind, List dt){
    length = ind;
    data = dt;
  }

  Map<String,dynamic> getFineDetails(int i){
    return data[i];
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
                            Align(alignment: Alignment.centerLeft, child:Text(getFineDetails(index)['empid'].toString(),style: const TextStyle(fontSize: 20,),),),
                            const Text("\n")
                          ],
                        )
                    ),
                    const SizedBox(height: 25,),
                    Card(
                        child:
                        Row(
                          children: [
                            const Align(alignment: Alignment.centerLeft, child:Text("Fine Number:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                            Align(alignment: Alignment.centerLeft, child:Text(getFineDetails(index)['fineid'].toString(),style: const TextStyle(fontSize: 20,),),),
                            const Text("\n")
                          ],
                        )
                    ),
                    SizedBox(height: 25,),
                    Card(
                        child:
                        Row(
                          children: [
                            const Align(alignment: Alignment.centerLeft, child:Text("Fine Amount:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                            Align(alignment: Alignment.centerLeft, child:Text(getFineDetails(index)['amount'].toString(),style: const TextStyle(fontSize: 20,),),),
                            const Text("\n")
                          ],
                        )
                    ),
                    const SizedBox(height: 25,),
                    Card(
                        child:
                        Row(
                          children: [
                            const Align(alignment: Alignment.centerLeft, child:Text("Status:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                            Align(alignment: Alignment.centerLeft, child:Text(getFineDetails(index)['status'].toString(),style: const TextStyle(fontSize: 20,),),),
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
                            Align(alignment: Alignment.centerLeft, child:Text(getFineDetails(index)['des'].toString(),style: const TextStyle(fontSize: 20,),),),
                            const SizedBox(height: 5,),
                          ],
                        )
                    ),
                    const SizedBox(height: 30,),
                    Row(
                        children:[
                          SizedBox(
                              height: 50,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: (){
                                    if (index>0){
                                      setState(() {
                                        index = index - 1;
                                      });
                                    }
                                  },
                                  child: Text("Previous", style: GoogleFonts.heebo(fontSize: 20),)
                              )
                          ),
                          const SizedBox(width: 40,),
                          SizedBox(
                              height: 45,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: (){
                                    if (index<length-1) {
                                      setState(() {
                                        index = index + 1;
                                      });
                                    }
                                  },
                                  child: Text("Next", style: GoogleFonts.heebo(fontSize: 20),)
                              )
                          )
                        ]
                    )
                  ]
              )
          )
      ),
    );
  }
}