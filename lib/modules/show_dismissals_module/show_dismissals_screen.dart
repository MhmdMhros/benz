import 'package:benz/generated/l10n.dart';
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
        SnackBar(content: Text(S.of(context).show_dismissals_enterValidDate)),
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
                hintText: S.of(context).show_dismissals_dayHint,
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
                  return S.of(context).show_dismissals_enterDay;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _monthController,
              decoration: InputDecoration(
                hintText: S.of(context).show_dismissals_monthHint,
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
                  return S.of(context).show_dismissals_enterMonth;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                hintText: S.of(context).show_dismissals_yearHint,
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
                  return S.of(context).show_dismissals_enterYear;
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
                hintText: S.of(context).show_dismissals_monthHint,
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
                  return S.of(context).show_dismissals_enterMonth;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                hintText: S.of(context).show_dismissals_yearHint,
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
                  return S.of(context).show_dismissals_enterYear;
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
            hintText: S.of(context).show_dismissals_yearHint,
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
              return S.of(context).show_dismissals_enterYear;
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
              hint: Text(S.of(context).show_dismissals_selectDateType),
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
                  S.of(context).show_dismissals_showDismissals,
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
                    '${S.of(context).show_dismissals_numberOfDismissals} $_numDismissals',
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
                      '${S.of(context).show_dismissals_totalCost} $_totalCost',
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
                        '${S.of(context).show_dismissals_price} ${dismissal.cost}, ${S.of(context).show_dismissals_date} ${dismissal.date}\n  ${S.of(context).show_dismissals_note} ${dismissal.note}'),
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
