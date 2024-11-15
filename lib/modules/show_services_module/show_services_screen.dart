import 'package:benz/generated/l10n.dart';
import 'package:benz/models/service_model/service_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/shared/components.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class ShowServicesScreen extends StatefulWidget {
  const ShowServicesScreen({Key? key}) : super(key: key);

  @override
  _ShowServicesScreenState createState() => _ShowServicesScreenState();
}

class _ShowServicesScreenState extends State<ShowServicesScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  String? _selectedDateType;
  List<ServiceModel> _services = [];
  double _totalPrice = 0.0;
  int _numServices = 0;

  Future<void> _fetchServices() async {
    int? day = int.tryParse(_dayController.text);
    int? month = int.tryParse(_monthController.text);
    int? year = int.tryParse(_yearController.text);

    List<ServiceModel> services = [];

    if (_selectedDateType == 'Day' &&
        day != null &&
        month != null &&
        year != null) {
      services = await _dbHelper.getServicesByDayDate(year, month, day);
    } else if (_selectedDateType == 'Month' && month != null && year != null) {
      services = await _dbHelper.getServicesByMonthDate(year, month);
    } else if (_selectedDateType == 'Year' && year != null) {
      services = await _dbHelper.getServicesByYearDate(year);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).show_services_enterValidDate)),
      );
      return;
    }

    double totalPrice =
        services.fold(0.0, (sum, service) => sum + service.price);
    int numServices = services.length;

    setState(() {
      _services = services;
      _totalPrice = totalPrice;
      _numServices = numServices;
    });
  }

  Widget _buildDateInputField() {
    switch (_selectedDateType) {
      case 'Day':
        return Column(
          children: [
            TextFormField(
              controller: _dayController,
              decoration: InputDecoration(
                hintText: S.of(context).show_services_day,
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
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).show_services_enterDay;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _monthController,
              decoration: InputDecoration(
                hintText: S.of(context).show_services_month,
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
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).show_services_enterMonth;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                hintText: S.of(context).show_services_year,
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
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).show_services_enterYear;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
          ],
        );
      case 'Month':
        return Column(
          children: [
            TextFormField(
              controller: _monthController,
              decoration: InputDecoration(
                hintText: S.of(context).show_services_month,
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
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).show_services_enterMonth;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                hintText: S.of(context).show_services_year,
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
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).show_services_enterYear;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
          ],
        );
      case 'Year':
        return TextFormField(
          controller: _yearController,
          decoration: InputDecoration(
            hintText: S.of(context).show_services_year,
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
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).show_services_enterYear;
            }
            return null;
          },
          keyboardType: TextInputType.number,
        );
      default:
        return Container();
    }
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedDateType,
              hint: Text(S.of(context).show_services_selectDateType),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDateType = newValue;
                });
              },
              items: <String>['Day', 'Month', 'Year']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(dropCheckServices(value, context)),
                );
              }).toList(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            _buildDateInputField(),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Container(
              width: MediaQuery.of(context).size.width * .13,
              height: MediaQuery.of(context).size.height * .04,
              decoration: BoxDecoration(
                color: appNameColor,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * .02),
              ),
              child: MaterialButton(
                onPressed: _fetchServices,
                child: Text(
                  S.of(context).show_services_showServices,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * .013,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(
                    '${S.of(context).show_services_numberOfServices} $_numServices',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: MediaQuery.of(context).size.width * .018,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .04),
                  Expanded(
                    child: Text(
                      '${S.of(context).show_services_totalPrice} $_totalPrice',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: MediaQuery.of(context).size.width * .018,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.grey[200], // Background color
                    child: ListTile(
                      title: Text(service.name),
                      subtitle: Text(
                          '\u200E${S.of(context).show_services_price} \u200E${service.price}   |   \u200E${S.of(context).show_services_date} \u200E${service.startDate}  |   \u200E${S.of(context).show_services_carNumber} \u200E${service.carNumber}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
