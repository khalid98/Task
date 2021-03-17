
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/constants.dart';
import 'package:task/provider/neworderprovider.dart';
import 'package:task/screens/Historyscreen.dart';
import 'package:task/screens/NewOrder.dart';
import 'package:task/screens/RunningScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Neworderprovider>(
          create: (context) => Neworderprovider(),
        ),
      ],
      child: MaterialApp(
        home: DefaultTabController(
          length: 3,

          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Constants.primaryColor,
                title: Text('Task'),
                centerTitle: true,
              ),
              body:
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Orders".toUpperCase(),style: TextStyle(
                        color: Color(0xff677a83),
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Constants.primaryColor,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Constants.primaryColor,width: 2.0),
                        insets: EdgeInsets.symmetric(horizontal:70.0),
                      ),
                      tabs: [
                        Tab(text: "Running",),
                        Tab(text: "New Order",),
                        Tab(text: "History",),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TabBarView(
                        children: [
                          RunningScreen(), 
                          NewOrder(),
                          HistoryScreen(),

                        ],
                      ),
                    ),
                  )
                ],
              ),

          ),
        ),
      ),
    );}}