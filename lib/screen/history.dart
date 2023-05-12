import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sacrosys/model/TimeModel.dart';

import '../db/db functions/addTime.dart';

class history extends StatelessWidget {
  String CustomerId;

  history({required this.CustomerId});

  @override
  Widget build(BuildContext context) {
    refreshTimedata(CustomerId);
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: TimeListNotifier,
              builder: (BuildContext ctx, List<TimeModel> newList, Widget? _) {
                return ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemBuilder: (ctx, index) {
                      final value = newList[index];
                      return ListTile(
                        title: Column(
                          children: [
                            Text(
                              value.Time,
                              style: GoogleFonts.nunito(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        //  title:
                      );
                    },
                    separatorBuilder: (BuildContext, int) {
                      return Divider(
                        thickness: 2,
                      );
                    },
                    itemCount: newList.length);
              })),
    );
  }
}
