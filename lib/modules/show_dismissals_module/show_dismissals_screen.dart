import 'package:benz/models/dismissed_model/dismissed_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class ShowDismissalsScreen extends StatefulWidget {
  const ShowDismissalsScreen({Key? key}) : super(key: key);

  @override
  _ShowDismissalsScreenState createState() => _ShowDismissalsScreenState();
}

class _ShowDismissalsScreenState extends State<ShowDismissalsScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  String? _selectedDateType;
  List<DismissedModel> _dismissals = [];
  double _totalCost = 0.0;
  int _numDismissals = 0;

  Future<void> _fetchDismissals() async {
    int? day = int.tryParse(_dayController.text);
    int? month = int.tryParse(_monthController.text);
    int? year = int.tryParse(_yearController.text);

    List<DismissedModel> dismissals = [];

    if (_selectedDateType == 'Day' &&
        day != null &&
        month != null &&
        year != null) {
      dismissals = await _dbHelper.getDismissedByDayDate(year, month, day);
    } else if (_selectedDateType == 'Month' && month != null && year != null) {
      dismissals = await _dbHelper.getAllDismissedByMonthDate(year, month);
    } else if (_selectedDateType == 'Year' && year != null) {
      dismissals = await _dbHelper.getAllDismissedByYearDate(year);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid date')),
      );
      return;
    }

    double totalCost =
        dismissals.fold(0.0, (sum, dismissal) => sum + dismissal.cost);
    int numDismissals = dismissals.length;

    setState(() {
      _dismissals = dismissals;
      _totalCost = totalCost;
      _numDismissals = numDismissals;
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
                onPressed: _fetchDismissals,
                child: Text(
                  'Show Dismissals',
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
                    'Number of Dismissals: $_numDismissals',
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
                      'Total Cost: $_totalCost',
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
                itemCount: _dismissals.length,
                itemBuilder: (context, index) {
                  final dismissal = _dismissals[index];
                  return ListTile(
                    title: Text(dismissal.titleName),
                    subtitle: Text(
                        'Price: ${dismissal.cost}, Date: ${dismissal.date}'),
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
