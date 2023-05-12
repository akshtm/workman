import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sacrosys/screen/CallLogs.dart';
import 'package:sacrosys/screen/TaskScreen.dart';
import 'package:sacrosys/screen/history.dart';

import 'FilteredCallLogs.dart';

class CustomerviewHome extends StatefulWidget {
  String? customerid;
  String? name;
  String? location;

  var mobile;

  CustomerviewHome(
      {required this.name,
      required this.location,
      required this.customerid,
      required this.mobile});

  @override
  State<CustomerviewHome> createState() => _CustomerviewHomeState();
}

class _CustomerviewHomeState extends State<CustomerviewHome>
    with SingleTickerProviderStateMixin {
  var size, height, width;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            color: Colors.grey,
            height: height / 10,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height / 20,
                ),
                Text(widget.name.toString()),
                Text(widget.location.toString())
              ],
            ),
          ),
          TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5), // Creates border
            ), //Change background color from here

            controller: _tabController,
            unselectedLabelColor: Color.fromARGB(255, 209, 205, 205),
            labelColor: Color.fromARGB(255, 0, 0, 0),
            tabs: [
              Tab(
                text: 'History',
              ),
              Tab(
                text: 'Tasks',
              ),
              Tab(
                text: 'Call Log',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              history(CustomerId: widget.customerid.toString()),
              TaskScreen(CustomerId: widget.customerid.toString()),
              FilterdCallLog(mob: widget.mobile),
            ]),
          )
        ]),
      ),
    );
  }
}
