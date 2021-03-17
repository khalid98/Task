import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/constants.dart';
import 'package:task/model/neworder.dart';
import 'package:task/provider/neworderprovider.dart';
import 'package:task/widgets/neworderwidget.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}
class _NewOrderState extends State<NewOrder> {
String _chosenValue;
TextEditingController OrderQuantity = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            color: Color(0xff9ac56b),
            onPressed: ()=>showNow(),
            child: Text(
              "Add Item",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Consumer<Neworderprovider>(
            builder: (context, value, child) => ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.newordermodel.length,
              itemBuilder: (context, index) {
                return NewOrderWidget(newOrdermodel: value.newordermodel[index],);
              },) ,

          )
        ],
      ),
    );
  }
  void showNow() {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Constants.primaryColor.withOpacity(0.7),
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (ctx, anim1, anim2) => StatefulBuilder(builder: (context, setState) =>AlertDialog(
        title: Container(
          height: 70,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Select items type",style:TextStyle(fontSize: 14) ,)),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color:Constants.primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child:  DropdownButton<String>(
                    dropdownColor: Constants.primaryColor,
                    hint: Text("Order type"),
                    value: _chosenValue,
                    underline: Container(), // this is the magic
                    items: <String>['Plastics', 'Metals', 'Papers', 'Old books','Woods']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),

                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                        print(_chosenValue);

                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        content: Container(
          height: 90,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Order quantity')),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        controller: OrderQuantity,
                        decoration: new InputDecoration(
                          focusColor: Constants.primaryColor,
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: new BorderSide(color: Constants.primaryColor)),
                          hintText: 'Order quantity',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Text("KG")

                ],
              ),
            ],
          ),
        ),
        elevation: 2,
        actions: [
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            color:Color(0xff9ac56b),
            onPressed: () {
              var orderlist = Provider.of<Neworderprovider>(context,listen: false);
              orderlist.additem(NewOrdermodel(
                ItemType: _chosenValue,
                quanitity:OrderQuantity.text
              ));
              Navigator.pop(context);
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ), ),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(
          child: child,
          opacity: anim1,
        ),
      ),
      context: context,
    );
  }
}
