import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/constants.dart';

class OrderStatuswidget extends StatefulWidget {

  OrderStatuswidget({this.orderStatus, this.DateTime});
  String orderStatus;

  String DateTime;

  @override
  _OrderStatuswidgetState createState() => _OrderStatuswidgetState();
}

class _OrderStatuswidgetState extends State<OrderStatuswidget> {
  @override
  Widget build(BuildContext context) {
    return   Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: (widget.orderStatus=="Buy Order")?Constants.listColor:(widget.orderStatus=="Get Cash")?Color(0xffd69aa0):Color(0xffc4ceb2), width: 1),
              borderRadius: BorderRadius.circular(10)),
          elevation: 8.0,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "${widget.orderStatus}",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16,
                      color: (widget.orderStatus=="Buy Order")?Constants.listColor:(widget.orderStatus=="Get Cash")?Color(0xffd69aa0):Color(0xffc4ceb2)

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
                      color:(widget.orderStatus=="Buy Order")?Constants.listColor:(widget.orderStatus=="Get Cash")?Color(0xffd69aa0):Color(0xffc4ceb2)
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
                      color: (widget.orderStatus=="Buy Order")?Constants.listColor:(widget.orderStatus=="Get Cash")?Color(0xffd69aa0):Color(0xffc4ceb2)
                    ),),
                    Text("Cash"),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    SizedBox(width: 2.0,),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Constants.cancelButtonColor,
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: (widget.orderStatus=="Buy Order")?Constants.listColor:(widget.orderStatus=="Get Cash")?Color(0xffd69aa0):Color(0xffc4ceb2),
          thickness: 5.0,
          indent: 50,
          endIndent:50,

        ),
      ],
    );
  }
}
