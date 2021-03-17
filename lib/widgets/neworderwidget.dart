
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/constants.dart';
import 'package:task/model/neworder.dart';
import 'package:task/provider/neworderprovider.dart';

class NewOrderWidget extends StatefulWidget {
  NewOrdermodel newOrdermodel;

  NewOrderWidget({this.newOrdermodel});

  @override
  _NewOrderWidgetState createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Constants.listColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          elevation: 8.0,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_bag,color: Color(0xffc16868),
                      size: 14,
                    ),
                    Text("Item:",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor
                    ),),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${widget.newOrdermodel.ItemType}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),),
                  ],),
                SizedBox(height: 5.0,),
                Row(
                  children: [
                    Icon(Icons.shopping_bag,color: Color(0xffc16868),
                      size: 14,
                    ),
                    Text("quantity:",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.primaryColor
                    ),),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${widget.newOrdermodel.quanitity} KG",style: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),),
                    Spacer(),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Constants.cancelButtonColor,
                      onPressed: () {
                        var orderlist = Provider.of<Neworderprovider>(context,listen: false);
                        orderlist.deleteitem(widget.newOrdermodel);

                      },
                      child: Row(
                        children: [
                          Icon(Icons.close,color: Colors.white,),
                          Text(
                            "Delete",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],),

              ],
            ),
          ),
        ),
        Divider(
          color: Constants.listColor,
          thickness: 5.0,
          indent: 50,
          endIndent:50,

        ),
      ],
    );
  }
}
