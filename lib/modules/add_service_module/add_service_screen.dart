import 'package:benz/models/service_model/service_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  TextEditingController _carNumberController = TextEditingController();
  List<ServiceModel> services = [];
  List<TextEditingController> nameControllers = [];
  List<TextEditingController> priceControllers = [];
  bool _isLoading = false;

  void _addServiceField() {
    setState(() {
      services.add(ServiceModel(
          carNumber: '',
          name: '',
          price: 0,
          startDate: DateTime.now().toIso8601String(),
          endDate: DateTime.now().toIso8601String()));
      nameControllers.add(TextEditingController());
      priceControllers.add(TextEditingController());
    });
  }

  void _removeServiceField(int index) {
    setState(() {
      services.removeAt(index);
      nameControllers.removeAt(index);
      priceControllers.removeAt(index);
    });
  }

  Future<void> _saveServices() async {
    setState(() {
      _isLoading = true;
    });

    final dbHelper = DatabaseHelper();
    String carNumber = _carNumberController.text;

    if (carNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Car number must not be empty')));
      setState(() {
        _isLoading = false;
      });

      return;
    }

    try {
      for (int i = 0; i < services.length; i++) {
        services[i] = ServiceModel(
            carNumber: carNumber,
            name: nameControllers[i].text,
            price: double.tryParse(priceControllers[i].text) ?? 0,
            startDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            endDate: DateFormat('yyyy-MM-dd')
                .format(DateTime.now()) // or any date you want to use
            );
        await dbHelper.insertService(services[i]);
      }
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Services added successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed!!!')));
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            width: MediaQuery.of(context).size.width * .75,
            height: double.infinity,
            color: backGroundColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width * .01,
                    MediaQuery.of(context).size.height * .19,
                    MediaQuery.of(context).size.width * .01,
                    0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _carNumberController,
                      decoration: InputDecoration(
                        hintText: 'Enter Car Number',
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
                        if (value!.isEmpty) {
                          return 'Car number must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ...services.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: nameControllers[index],
                                decoration: InputDecoration(
                                  hintText: 'Service Name',
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: priceControllers[index],
                                decoration: InputDecoration(
                                  hintText: 'Price',
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Allow only digits
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () => _removeServiceField(index),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: MediaQuery.of(context).size.height * .045,
                          decoration: BoxDecoration(
                            color: appNameColor,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * .02),
                          ),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * .02)),
                            onPressed: _addServiceField,
                            child: Text(
                              'Add Service',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * .015,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: MediaQuery.of(context).size.height * .045,
                          decoration: BoxDecoration(
                            color: appNameColor,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * .02),
                          ),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * .02)),
                            onPressed: _saveServices,
                            child: Text(
                              'Save Service',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * .015,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
