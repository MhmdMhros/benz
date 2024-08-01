import 'package:benz/models/dismissed_model/dismissed_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddDismissedScreen extends StatefulWidget {
  @override
  _AddDismissedScreenState createState() => _AddDismissedScreenState();
}

class _AddDismissedScreenState extends State<AddDismissedScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cost = TextEditingController();
  final _titleName = TextEditingController();
  final _note = TextEditingController();

  Future<void> _insert_dismissed() async {
    if (_formKey.currentState!.validate()) {
      final Dismissed = DismissedModel(
        note: _note.text,
        titleName: _titleName.text,
        cost: double.parse(_cost.text),
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      );

      DatabaseHelper dp = new DatabaseHelper();
      dp.insertDismissed(Dismissed, context);
      _titleName.text = "";
      _cost.text = "";
      _note.text = "";
    }
  }

  @override
  void dispose() {
    _note.dispose();
    _titleName.dispose();
    _cost.dispose();
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
                controller: _titleName,
                decoration: InputDecoration(
                  hintText: 'Dismissed Name',
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
                    return 'Please enter title name ';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _cost,
                decoration: InputDecoration(
                  hintText: 'Cost',
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
                    return 'Please enter cost';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _note,
                decoration: InputDecoration(
                  hintText: 'Note',
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
                    return 'Please enter note';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
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
                  onPressed: _insert_dismissed,
                  child: Text(
                    'Add Dismissed',
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
