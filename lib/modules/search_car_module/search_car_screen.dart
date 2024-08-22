import 'package:benz/generated/l10n.dart';
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
      color: backgroundColor,
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
                hintText: S.of(context).search_car_number,
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
                        width: MediaQuery.of(context).size.width * 0.02,
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
                LengthLimitingTextInputFormatter(8), // Limit to 8 digits
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).search_please_enter_car_number;
                }
                return null;
              },
              onChanged: (value) {
                // Trigger a rebuild to update the segmented display
                (context as Element).markNeedsBuild();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .01),
            Expanded(child: _widgetToShow),
            SizedBox(height: MediaQuery.of(context).size.height * .01),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * .07,
              decoration: BoxDecoration(
                color: appNameColor,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * .02),
              ),
              child: MaterialButton(
                child: Text(
                  S.of(context).search_search,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * .032,
                    letterSpacing: 0,
                  ),
                ),
                onPressed: () async {
                  String carNumber =
                      addSpaceBetweenEachLetter(_controller.text);
                  final dbHelper = DatabaseHelper();
                  CarModel? car = await dbHelper.getCarByNumber(carNumber);

                  if (car == null) {
                    setState(() {
                      _widgetToShow = Container(
                        child: Center(
                          child: Text(
                            S.of(context).search_car_not_found,
                            style: TextStyle(color: Colors.grey, fontSize: 40),
                          ),
                        ),
                      );
                    });
                  } else {
                    List<ServiceModel> services =
                        await dbHelper.getServicesByCarNumber(carNumber);

                    setState(() {
                      _widgetToShow = SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).search_car_details,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              _buildCarDetailRow(
                                  S.of(context).search_owner_name,
                                  car.ownerName),
                              _buildCarDetailRow(
                                  S.of(context).search_phone_number,
                                  car.phoneNumber),
                              _buildCarDetailRow(
                                  S.of(context).search_car_model, car.carModel),
                              car.mileage != 0
                                  ? _buildCarDetailRow(
                                      S.of(context).search_mileage,
                                      car.mileage.toString())
                                  : _buildCarDetailRow(
                                      S.of(context).search_mileage, "_"),
                              Divider(color: Colors.grey),
                              SizedBox(height: 8.0),
                              Text(
                                S.of(context).search_services,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    _buildServiceItem(services[index]),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 8.0),
                                itemCount: services.length,
                              ),
                            ],
                          ),
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
  }

  Widget _buildCarDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildServiceItem(ServiceModel service) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xff5c5e60),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              service.name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          Text(
            service.price.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: mainColor),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.04),
          Text(
            service.startDate,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
