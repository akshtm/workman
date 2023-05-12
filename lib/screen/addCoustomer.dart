import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sacrosys/model/addCustomer.dart';
import 'package:sacrosys/screen/home.dart';

import '../db/db functions/addCoustomer.dart';

class AddCoustomer extends StatelessWidget {
  var _formKeys = GlobalKey<FormState>();
  var size, height, width;
  final namecontrol = TextEditingController();
  final Loactioncontrol = TextEditingController();
  final Citycontrol = TextEditingController();
  final Countrycontrol = TextEditingController();
  final Phonecontrol = TextEditingController();
  final Emailcontrol = TextEditingController();
  AddCoustomer({Key? key}) : super(key: key);
  void _submit() {
    final isValid = _formKeys.currentState!.validate();
    if (!isValid) {
      return;
    }

    final a = CustomerModel(
        name: namecontrol.text,
        location: Loactioncontrol.text,
        Country: Countrycontrol.text,
        Phone: Phonecontrol.text,
        Mail: Emailcontrol.text,
        Cordinatess: Coordinat.text);
    addTransaction(a);
    // CustomerListNotifier.value.add(a);

    log('Complt');
    Get.to(HomeScreen());
    Coordinat.clear();
    _formKeys.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width / 8,
                ),
                Center(
                    child: Text(
                  'Add Customer',
                  style: GoogleFonts.nunito(fontSize: 25),
                )),
                IconButton(
                    onPressed: () {
                      _submit();
                    },
                    icon: Icon(
                      Icons.done,
                      size: 40,
                    )),
              ],
            ),
            Form(
              key: _formKeys,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 10,
                    ),
                    TextFormField(
                      controller: namecontrol,
                      decoration: InputDecoration(label: Text('Name')),
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a Your Name!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 46,
                    ),
                    TextFormField(
                      controller: Loactioncontrol,
                      decoration: InputDecoration(label: Text('Loaction')),
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid Loaction!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 46,
                    ),
                    TextFormField(
                      controller: Citycontrol,
                      decoration: InputDecoration(label: Text('City')),
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a City!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 46,
                    ),
                    TextFormField(
                      controller: Countrycontrol,
                      decoration: InputDecoration(label: Text('Country')),
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Country!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 46,
                    ),
                    TextFormField(
                      maxLength: 13,
                      keyboardType: TextInputType.number,
                      controller: Phonecontrol,
                      decoration: InputDecoration(label: Text('Phone Number')),
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Phone Number!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 46,
                    ),
                    TextFormField(
                      controller: Emailcontrol,
                      decoration: InputDecoration(label: Text('Email')),
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 46,
                    ),
                    TextFormField(
                      controller: Coordinat,
                      decoration: InputDecoration(
                          label: Text(
                            'Coordinates',
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                getCurrentLocation();
                              },
                              icon: Icon(
                                Icons.map,
                                color: Colors.green,
                              ))),
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter  your Coordinates!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final Coordinat = TextEditingController();
var currentPosition;
getCurrentLocation() {
  //isloading.value = true;
  Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: true)
      .then((Position position) {
    // /currentPosition = position;
    Coordinat.text = position.toString();

    log(position.toString());
    log(currentPosition.toString());

    // getCurrentLocationAddress();
  }).catchError((e) {
    print(e);
  });
}

  // getCurrentLocationAddress() async {
  //   try {
  //     List<Placemark> listPlaceMarks = await placemarkFromCoordinates(
  //         currentPosition!.latitude, currentPosition!.longitude);
  //     Placemark place = listPlaceMarks[0];

  //     currentLocationAddress =
  //         "${place.locality}, ${place.postalCode}, ${place.subLocality},${place.administrativeArea},${place.thoroughfare},${place.name}";
  //     HomeNAMeTextControl.text = place.name!;
  //     StreetTextControl.text = place.subLocality!;
  //     stateTextControl.text = place.administrativeArea!;
  //     pincodeTextControl.text = place.postalCode!;
  //     CItyTextControl.text = place.locality!;
  //    // isloading.value = false;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
