import 'package:benz/generated/l10n.dart';
import 'package:benz/models/car_model/car_model.dart';
import 'package:benz/models/service_model/service_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/modules/printing_module/printing_screen.dart';
import 'package:benz/shared/components.dart';
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
  List<TextEditingController> mileageChangeWhenControllers = [];
  bool _isLoading = false;

  void _addServiceField() async {
    String carNumber = _carNumberController.text;
    print(carNumber);
    if (carNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).add_service_carNumberEmpty)));
      return;
    }
    carNumber = addSpaceBetweenEachLetter(reverseArabicLetters(carNumber));
    final dbHelper = DatabaseHelper();
    CarModel? car = await dbHelper.getCarByNumber(carNumber);
    if (car == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).add_service_carNotFound)));
      return;
    }

    setState(() {
      services.add(ServiceModel(
        carNumber: '',
        name: '',
        price: 0,
        startDate: DateFormat('yyyy-MM-dd', 'en_US').format(DateTime.now()),
        mileageChangeWhen: 0,
      ));
      nameControllers.add(TextEditingController());
      priceControllers.add(TextEditingController());
      mileageChangeWhenControllers.add(TextEditingController());
    });
  }

  void _removeServiceField(int index) {
    setState(() {
      services.removeAt(index);
      nameControllers.removeAt(index);
      priceControllers.removeAt(index);
      mileageChangeWhenControllers.removeAt(index);
    });
  }

  Future<void> confirm() async {
    setState(() {
      _isLoading = true;
    });

    final dbHelper = DatabaseHelper();
    String carNumber = _carNumberController.text;
    carNumber = addSpaceBetweenEachLetter(
        reverseArabicLetters(_carNumberController.text));
    if (carNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).add_service_carNumberEmpty)));
      setState(() {
        _isLoading = false;
      });

      return;
    }

    try {
      bool done = false;
      for (int i = 0; i < services.length; i++) {
        if (nameControllers[i].text.isNotEmpty &&
            priceControllers[i].text.isNotEmpty) {
          services[i] = ServiceModel(
            carNumber: carNumber,
            name: nameControllers[i].text,
            price: double.tryParse(priceControllers[i].text) ?? 0,
            startDate: DateFormat('yyyy-MM-dd', 'en_US').format(DateTime.now()),
            mileageChangeWhen:
                double.tryParse(mileageChangeWhenControllers[i].text) ?? 0,
            // or any date you want to use
          );
          await dbHelper.insertService(services[i]);
          done = true;
        }
      }

      if (done) {
        CarModel? carModel = await dbHelper.getCarByNumber(carNumber);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).add_service_servicesAdded)));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => PrintScreen(
              carModel: carModel!,
              serviceModelList: services,
            ),
          ),
          (Route<dynamic> route) =>
              false, // This condition removes all previous routes
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).add_service_failed)));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).add_service_failed)));
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndexScreen == 7) {
      _carNumberController.text = serviceNavigation;
    }

    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            width: MediaQuery.of(context).size.width * .75,
            height: double.infinity,
            color: backgroundColor,
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
                        hintText: S.of(context).add_service_carNumber,
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 172, 13, 2)),
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
                        LengthLimitingTextInputFormatter(
                            8), // Limit to 8 digits
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
                    const SizedBox(height: 16.0),
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
                                  hintText:
                                      S.of(context).add_service_serviceName,
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: priceControllers[index],
                                decoration: InputDecoration(
                                  hintText: S.of(context).add_service_price,
                                  border: const OutlineInputBorder(),
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
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: mileageChangeWhenControllers[index],
                                decoration: InputDecoration(
                                  hintText: S
                                      .of(context)
                                      .add_service_mileageChangeWhen,
                                  border: const OutlineInputBorder(),
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
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () => _removeServiceField(index),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 0, 0, MediaQuery.of(context).size.width * .01),
                      child: Row(
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
                                S.of(context).add_service_addService,
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
                              onPressed: confirm,
                              child: Text(
                                S.of(context).add_service_confirm,
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
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
