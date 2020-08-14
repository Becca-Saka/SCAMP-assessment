import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  final double width;
  final Color color;
  final String cases, text;
  HorizontalCard(this.width, this.color, this.cases, this.text);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        height: 120,
        width: width/1.3,
         decoration: BoxDecoration(
           color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)
            ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
             SizedBox(width: 10,),
             Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: color.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)
                  ),
               child: Icon(Icons.show_chart,size: 40,)),
              SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               
                
                 Text(cases, style: TextStyle(
                  fontSize: 24
                    ) ,),
                  SizedBox(height: 5,),
                 Text(text),

              ],
            ),
          ],
        ),),
    );
  }
}