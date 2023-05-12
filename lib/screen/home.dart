import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sacrosys/model/addCustomer.dart';
import 'package:sacrosys/screen/addCoustomer.dart';
import 'package:sacrosys/screen/customerViewHome.dart';

import '../db/db functions/addCoustomer.dart';

class HomeScreen extends StatelessWidget {
  var size, height, width;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refreshTras();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search_rounded),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
              height: height / 1.2,
              child: ValueListenableBuilder(
                  valueListenable: CustomerListNotifier,
                  builder: (BuildContext ctx, List<CustomerModel> newList,
                      Widget? _) {
                    return ListView.separated(
                        padding: EdgeInsets.all(10),
                        itemBuilder: (ctx, index) {
                          final value = newList[index];
                          return InkWell(
                            onTap: () {
                              Get.to(CustomerviewHome(
                                location: value.location,
                                name: value.name,
                                customerid: value.id,
                                mobile: value.Phone,
                              ));
                            },
                            child: ListTile(
                              leading: Column(
                                children: [
                                  Text(
                                    value.name,
                                    style: GoogleFonts.nunito(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(value.location),
                                ],
                              ),

                              //  title:
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert_sharp)),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext, int) {
                          return Divider(
                            thickness: 2,
                          );
                        },
                        itemCount: newList.length);
                  }))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddCoustomer());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
