import 'package:benz/generated/l10n.dart';
import 'package:benz/models/car_model/car_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/modules/layout_module/layout_screen.dart';
import 'package:benz/shared/components.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _formKey = GlobalKey<FormState>();
  final _carNumberController = TextEditingController();
  final _carModelController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _mileageController = TextEditingController();

  Future<void> _insertCar() async {
    if (_formKey.currentState!.validate()) {
      final car = CarModel(
        carNumber: addSpaceBetweenEachLetter(
            reverseArabicLetters(_carNumberController.text)),
        carModel: _carModelController.text,
        ownerName: _ownerNameController.text,
        phoneNumber: _phoneNumberController.text,
        mileage: _mileageController.text == ""
            ? 0
            : double.parse(_mileageController.text),
      );

      DatabaseHelper dp = DatabaseHelper();
      await dp.insertCar(car, context).then((onValue) {
        serviceNavigation = _carNumberController.text;
        currentIndexScreen = 7;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LayoutScreen(
                    isAdmin: isAdmin,
                  )),
        );
      });
    }
  }

  Future<void> _updateCar() async {
    if (_carNumberController.text.isNotEmpty) {
      DatabaseHelper dp = DatabaseHelper();
      await dp.updateCar(
          carNumber: addSpaceBetweenEachLetter(
              reverseArabicLetters(_carNumberController.text)),
          newOwnerName: _ownerNameController.text,
          newPhoneNumber: _phoneNumberController.text,
          newMileage: _mileageController.text,
          context: context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).add_car_CarNumberisEmpty)));
    }
  }

  @override
  void dispose() {
    _carNumberController.dispose();
    _carModelController.dispose();
    _ownerNameController.dispose();
    _phoneNumberController.dispose();
    _mileageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      height: double.infinity,
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          MediaQuery.of(context).size.width * .01,
          MediaQuery.of(context).size.height * .19,
          MediaQuery.of(context).size.width * .01,
          MediaQuery.of(context).size.width * .01,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _carNumberController,
                  decoration: InputDecoration(
                    hintText: S.of(context).add_car_carNumber,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                    ),
                    counterText: '', // Hide the counter text
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(
                          10.0), // Add padding to align segments properly
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(8, (index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.02,
                            alignment: Alignment.center,
                            child: Text(
                              _carNumberController.text.length > index
                                  ? _carNumberController.text[index]
                                  : '',
                              style: TextStyle(fontSize: 16),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color:
                                      mainColor, // The color for the bottom border
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8), // Limit to 6 digits
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).add_car_carNumberEmpty;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Trigger a rebuild to update the segmented display
                    (context as Element).markNeedsBuild();
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                TextFormField(
                  controller: _carModelController,
                  decoration: InputDecoration(
                    hintText: S.of(context).add_car_carModel,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).add_car_carModelEmpty;
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                TextFormField(
                  controller: _ownerNameController,
                  decoration: InputDecoration(
                    hintText: S.of(context).add_car_ownerName,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).add_car_ownerNameEmpty;
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    hintText: S.of(context).add_car_phoneNumber,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).add_car_phoneNumberEmpty;
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                TextFormField(
                  controller: _mileageController,
                  decoration: InputDecoration(
                    hintText: S.of(context).add_car_mileage,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * .07,
                  decoration: BoxDecoration(
                    color: appNameColor,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * .02),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * .02)),
                    onPressed: _insertCar,
                    child: Text(
                      S.of(context).add_car_addCar,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * .015,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * .07,
                  decoration: BoxDecoration(
                    color: appNameColor,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * .02),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * .02)),
                    onPressed: _updateCar,
                    child: Text(
                      S.of(context).add_car_updateCar,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * .015,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
