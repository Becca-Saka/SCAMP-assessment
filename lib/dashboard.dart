import 'package:covid19_stats/horizontal_card.dart';
import 'package:covid19_stats/search.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  
   Function(Brightness brightness)  changeTheme;
  DashBoard({Key key, Function(Brightness brightness) changeTheme}) 
  : super(key: key) {
    this.changeTheme = changeTheme;
  }
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
   var _value='Country';
   final _sortBy = ['Country', 'Cases','Discharged', 'Deaths'];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.withOpacity(0.5),
        // foregroundColor: Colors.yellow.withOpacity(0.5),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchCountry()));
        },
        child: Center(child: Icon(Icons.search,color: Colors.white,)),),
      
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState(() {
                if (Theme.of(context).brightness  == Brightness.light) {
                  widget.changeTheme(Brightness.dark);
                } else {
                  widget.changeTheme(Brightness.light);
                }
              });
               
              
            },
            icon: Icon(Icons.wb_sunny),
          )
          
        ],
      ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
                          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Hi there,', style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 5,),
                     Text('Remeber to stay safe', style: TextStyle(
                      fontSize: 16,
                    )),
                      SizedBox(height: 10,),

                    Container(
                      height: 120,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          HorizontalCard(width, Colors.yellow, '2,000,0000','Confirmed cases'),
                          HorizontalCard(width, Colors.green, '4,000,0000','Discharged'),
                          HorizontalCard(width, Colors.red, '100,000','Deaths'),

                          ],),
                    ),
                     SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Ranking', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                        DropdownButton<String>(
                          value: _value,
                          // hint: Text('Country'),
                          onChanged: (value){
                            setState(() {
                               _value = value;
                            print(_value);
                            });
                           
                          },
                          items: _sortBy.map((String value) {
                            return  DropdownMenuItem<String>(child: Text(value), value: value);
                            
                          }).toList(), 

                        )
                      ],
                    ),
                     SizedBox(height: 30,),

                   Container(
                      height: height/2.5,
                                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          _buildRankingCards(width, '4,000,0000', '2,000,0000','100,000'),
                          _buildRankingCards(width, '4,000,0000', '2,000,0000','100,000'),
                          // _buildCards(width, Colors.yellow, '2,000,0000','Confirmed cases'),
                          _buildRankingCards(width,'4,000,0000', '2,000,0000','100,000'),

                          ],),
                    ),
                          
                    
                  ],
                ),
            ),
          ),
    );
  }

 



  _buildRankingCards(width,confirmedCases, death, discharged){
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        width: width/2.8,
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               SizedBox(height: 10,),
               Center(
                 child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30)
                      ),
                   child: Icon(Icons.flag,size: 40,)),
               ),
                SizedBox(height: 20,),
              
                    Center(
                      child: Text('Nigeria', style: TextStyle(
                fontSize: 24
                  ) ,),
                    ),
                     SizedBox(height: 10,),
                    Text('Confirmed :', style: TextStyle(
                    fontSize: 16,
                      ) ,),
                    Text(confirmedCases, style: TextStyle(
                    fontSize: 14
                      ) ,),
                      SizedBox(height: 5,),

                       Text('Dischraged :', style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.withOpacity(0.5)
                      ) ,),
                    Text(discharged, style: TextStyle(color: Colors.green.withOpacity(0.5),
                    fontSize: 14
                      ) ,),
                       SizedBox(height: 5,),

                       Text('Death :', style: TextStyle(
                    fontSize: 16,
                    color: Colors.red.withOpacity(0.5)
                      ) ,),
                    Text(death, style: TextStyle(
                    fontSize: 14,
                    color: Colors.red.withOpacity(0.5)
                      ) ,),
                 
              
            ],
          ),
        ),),
    );
  }
}