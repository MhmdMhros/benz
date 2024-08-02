import 'package:benz/models/service_model/service_model.dart';
import 'package:benz/modules/databases_module/database.dart';
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
        SnackBar(content: Text('Please enter a valid date')),
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
                hintText: 'Day',
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
                  return 'Please enter day';
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _monthController,
              decoration: InputDecoration(
                hintText: 'Month',
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
                  return 'Please enter month';
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                hintText: 'Year',
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
                  return 'Please enter year';
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
                hintText: 'Month',
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
                  return 'Please enter month';
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                hintText: 'Year',
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
                  return 'Please enter year';
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
            hintText: 'Year',
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
              return 'Please enter year';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedDateType,
              hint: Text('Select Date Type'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDateType = newValue;
                });
              },
              items: <String>['Day', 'Month', 'Year']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
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
                  'Show Services',
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
                    'Number of Services: $_numServices',
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
                      'Total Price: \$$_totalPrice',
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
              child: ListView.separated(
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return ListTile(
                    title: Text(service.name),
                    subtitle: Text(
                        'Price: \$${service.price}, Date: ${service.startDate}'),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
