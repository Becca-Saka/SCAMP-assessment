import 'package:covid19_stats/horizontal_card.dart';
import 'package:flutter/material.dart';

class SearchCountry extends StatefulWidget {
  @override
  _SearchCountryState createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
     final width = MediaQuery.of(context).size.width;
    return Scaffold(
          body: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey[500],),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color:Colors.grey[500],
                          )
                        ),
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color:Colors.grey[500],
                          )
                        )
                    ),
                    textInputAction: TextInputAction.go,
                  ),
                ),
                Container(
        
      ),
    
      // Expanded(
      //         child: Center(
      //           child: Container(
      //     child: Text('Search a country'),
      //   ),
      //         ),
      // ),
       SizedBox(height: 30,),
        Text('Nigeria', style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    )),
                      SizedBox(height: 10,),
                Row(
                        children: <Widget>[
                          Expanded(child: HorizontalCard(width, Colors.yellow, '2,000,0000','Confirmed cases')),
                        ],
                      ),
                Row(
                children: <Widget>[
                  Expanded(child: HorizontalCard(width, Colors.green, '2,000,0000','Discharged')),
                ],
              ),
                Row(
                children: <Widget>[
                  Expanded(child: HorizontalCard(width, Colors.red, '2,000,0000','Death')),
                ],
                ),
                 SizedBox(height: 20,),
              ],
            ),
                      ),
          ),
    );
  }
}