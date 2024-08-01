import 'package:benz/models/car_model/car_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class AddCarScreen extends StatefulWidget {
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
        carNumber: _carNumberController.text,
        carModel: _carModelController.text,
        ownerName: _ownerNameController.text,
        phoneNumber: _phoneNumberController.text,
        mileage: int.parse(_mileageController.text),
      );

      DatabaseHelper dp = new DatabaseHelper();
      dp.insertCar(car);
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
      color: backGroundColor,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            MediaQuery.of(context).size.width * .01,
            MediaQuery.of(context).size.height * .19,
            MediaQuery.of(context).size.width * .01,
            0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _carNumberController,
                decoration: InputDecoration(
                  hintText: 'Car Number',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter car number';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _carModelController,
                decoration: InputDecoration(
                  hintText: 'Car Model',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter car model';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _ownerNameController,
                decoration: InputDecoration(
                  hintText: 'Owner Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter owner name';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _mileageController,
                decoration: InputDecoration(
                  hintText: 'Mileage',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mileage';
                  }
                  return null;
                },
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
                    'Add Car',
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
    );
  }
}
