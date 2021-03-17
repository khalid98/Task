import 'package:flutter/material.dart';
import 'package:task/constants.dart';

class historywidget extends StatefulWidget {

  historywidget({this.orderStatus});
  String orderStatus;


  @override
  _historywidgetState createState() => _historywidgetState();
}

class _historywidgetState extends State<historywidget> {
  @override
  Widget build(BuildContext context) {
    return   Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
          elevation: 8.0,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "${widget.orderStatus}",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:  Colors.black

                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time,color: Color(0xffc16868),
                      size: 14,
                    ),
                    Text("2/3/2021 - 06:00 PM")

                  ],),
                Row(
                  children: [
                    Icon(Icons.monetization_on,color: Color(0xffe47240),size: 14,),
                    Text("Price:",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black
                    ),),
                    SizedBox(
                      width: 10,
                    ),
                    Text("250 EGP"),

                  ],),
                Row(
                  children: [
                    Icon(Icons.payment_rounded,size: 14,),
                    Text("Payement Method:",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color:  Colors.black
                    ),),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text("Cash"),
                    Spacer(),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Constants.detailsButtonColor,
                      onPressed: () {},
                      child: Text(
                        "Details",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          color:  Colors.black,
          thickness: 5.0,
          indent: 50,
          endIndent:50,

        ),
      ],
    );
  }
}
