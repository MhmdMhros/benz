import 'package:benz/generated/l10n.dart';
import 'package:benz/models/dismissed_model/dismissed_model.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddDismissedScreen extends StatefulWidget {
  const AddDismissedScreen({super.key});

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
      color: backgroundColor,
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
                  hintText: S.of(context).add_dismissed_dismissedName,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).add_dismissed_pleaseEnterDismissedName;
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _cost,
                decoration: InputDecoration(
                  hintText: S.of(context).add_dismissed_cost,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).add_dismissed_pleaseEnterCost;
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              TextFormField(
                controller: _note,
                decoration: InputDecoration(
                  hintText: S.of(context).add_dismissed_note,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).add_dismissed_pleaseEnterNote;
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
                    S.of(context).add_dismissed_addDismissed,
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
