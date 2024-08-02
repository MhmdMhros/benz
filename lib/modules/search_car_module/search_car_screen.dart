import 'dart:ffi';

import 'package:benz/models/car_model/car_model.dart';
import 'package:benz/models/service_model/service_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/shared/components.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchCarScreen extends StatefulWidget {
  const SearchCarScreen({super.key});

  @override
  State<SearchCarScreen> createState() => _SearchCarScreenState();
}

class _SearchCarScreenState extends State<SearchCarScreen> {
  TextEditingController _controller = TextEditingController();
  Widget _widgetToShow = Container();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundColor,
      width: MediaQuery.of(context).size.width * .75,
      height: double.infinity,
      
      child: Padding(
         padding: EdgeInsetsDirectional.fromSTEB(
          MediaQuery.of(context).size.width * .01,
          MediaQuery.of(context).size.height * .19,
          MediaQuery.of(context).size.width * .01,
          MediaQuery.of(context).size.width * .01,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Car Number",
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
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 172, 13, 2)),
                ),
                counterText: '', // Hide the counter text
                prefixIcon: Padding(
                  padding: EdgeInsets.all(
                      10.0), // Add padding to align segments properly
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(8, (index) {
                      return Container(
                        width: 20,
                        alignment: Alignment.center,
                        child: Text(
                          _controller.text.length > index
                              ? _controller.text[index]
                              : '',
                          style: TextStyle(fontSize: 16),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: mainColor, // The color for the bottom border
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
                  return 'Please enter mileage';
                }
                return null;
              },
              onChanged: (value) {
                // Trigger a rebuild to update the segmented display
                (context as Element).markNeedsBuild();
              },
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: _widgetToShow,
            ),
           SizedBox(height: 16.0),
              Container(
                   width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * .07,
                  decoration: BoxDecoration(
                    color: appNameColor,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * .02),
                  ),
              child: MaterialButton(
                child: Text("Search",
                style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                        letterSpacing: 0,
                                      ),
                                    
                
                
                ),
                onPressed: () async {
                  String carNumber = "";
                  carNumber = addSpaceBetweenEachLetter(_controller.text);
                  final dbHelper = DatabaseHelper();
                  CarModel? car = await dbHelper.getCarByNumber(carNumber);
      
                  print(carNumber);
                  if (car == null) {
                    setState(() {
                      _widgetToShow = Container(
                        child: Center(
                          child: Text(
                            'Car not found ',
                            style: TextStyle(color: Colors.grey, fontSize: 40),
                          ),
                        ),
                      );
                    });
                  } else {
                    String Ownername=car.ownerName;
                    String phoneNumber=car.phoneNumber;
                    String carmodel=car.carModel;
                    int Millage=car.mileage;
                    

                    List<ServiceModel> services =
                        await dbHelper.getServicesByCarNumber(carNumber);
                    setState(() {
                      _widgetToShow = Container(
                        
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 16.0),
                            Text("Services"),
                            SizedBox(height: 16.0),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) => buildservice(
                                  services[index],
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                itemCount: services.length,
                              ),
                            )
                          ],
                        ),
                      );
                    });
                  }
                },
              ),
            ),
           
          ],
        ),
      ),
    );
  ;
  }

  Widget buildservice(ServiceModel service) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Text(service.name),
          SizedBox(width: 50),
          Text(service.price.toString()),
          SizedBox(width: 50),
          Text(service.startDate)
        ],
      ),
    );
  }
}
