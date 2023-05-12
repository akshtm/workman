import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sacrosys/db/db%20functions/addTime.dart';
import 'package:sacrosys/model/TimeModel.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'FilteredCallLogs.dart';

class TaskScreen extends StatefulWidget {
  String CustomerId;

  TaskScreen({required this.CustomerId});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHour = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CallLogList.value.clear();
    return Column(
      children: [
        StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snapshot) {
              final value = snapshot.data;
              final displayTime =
                  StopWatchTimer.getDisplayTime(value!, hours: _isHour);

              return Column(children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (() {
                        Get.defaultDialog(
                            title: 'Confirm Start',
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      _stopWatchTimer.onStartTimer();
                                      Get.back();
                                    },
                                    child: Text('OK')),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text('Cancel'))
                              ],
                            ));
                      }),
                      child: Container(
                        color: Colors.grey,
                        height: 50,
                        width: 100,
                        child: Center(child: Text('START')),
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        _stopWatchTimer.onStopTimer();
                        // _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                        Get.defaultDialog(
                            title: 'Confirm Stop',
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      final displayTime =
                                          StopWatchTimer.getDisplayTime(value);
                                      log(displayTime.toString());

                                      final a = TimeModel(
                                          Time: displayTime,
                                          CoustomerID: widget.CustomerId);
                                      addTime(a);

                                      Get.back();
                                    },
                                    child: Text('OK')),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text('Cancel'))
                              ],
                            ));
                      }),
                      child: Container(
                        color: Colors.grey,
                        height: 50,
                        width: 100,
                        child: Center(child: Text('STOP')),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Text(displayTime)
              ]);
            })
      ],
    );
  }
}
