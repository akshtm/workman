import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:call_log/call_log.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterdCallLog extends StatefulWidget {
  var mob;

  FilterdCallLog({required this.mob});

  @override
  State<FilterdCallLog> createState() => _FilterdCallLogState();
}

class _FilterdCallLogState extends State<FilterdCallLog> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   CallLogs(widget.mob);
  // }

  @override
  Widget build(BuildContext context) {
    CallLogs(widget.mob);
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: CallLogList,
            builder: (BuildContext ctx, List<CallLogEntry> newList, Widget? _) {
              return ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (ctx, index) {
                    final value = newList[index];
                    return ListTile(
                      leading: Column(
                        children: [
                          Text(
                            value.name.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            value.callType.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        value.number.toString(),
                        style: GoogleFonts.nunito(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      trailing: Text(
                        value.duration.toString() + "Seconds",
                        style: GoogleFonts.nunito(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),

                      //  title:
                    );
                  },
                  separatorBuilder: (BuildContext, int) {
                    return Divider(
                      thickness: 0.5,
                    );
                  },
                  itemCount: CallLogList.value.length);
            }));
  }
}

ValueNotifier<List<CallLogEntry>> CallLogList = ValueNotifier([]);
//List<CallLogEntry> CallLogList = [];
CallLogs(String num) async {
  // CallLogList.clear();
  // final Iterable<CallLogEntry> result = await CallLog.query();
  // log(result.length.toString());

  //Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  // log(result.length.toString() + 'Total Call log');
  print("number:" + num.toString());
  Iterable<CallLogEntry> entries = await CallLog.query(number: num.trim());
  CallLogList.value.addAll(entries);
  CallLogList.notifyListeners();

  // print(entries.length);
  // for (var item in entries) {
  //   print(item.name);
  // }
  // for (CallLogEntry entry in result) {
  //   log('inside for loop');
  //   if (entry.number == num) {
  //     CallLogList.add(entry);
  //   }
  // }
}
