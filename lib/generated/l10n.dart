// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BENZ`
  String get app_name {
    return Intl.message(
      'BENZ',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Search for a Car`
  String get layout_search_for_a_car {
    return Intl.message(
      'Search for a Car',
      name: 'layout_search_for_a_car',
      desc: '',
      args: [],
    );
  }

  /// `Add Car`
  String get layout_add_car {
    return Intl.message(
      'Add Car',
      name: 'layout_add_car',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get layout_add_service {
    return Intl.message(
      'Add Service',
      name: 'layout_add_service',
      desc: '',
      args: [],
    );
  }

  /// `Add Dismissed`
  String get layout_add_dismissed {
    return Intl.message(
      'Add Dismissed',
      name: 'layout_add_dismissed',
      desc: '',
      args: [],
    );
  }

  /// `Show Services`
  String get layout_show_services {
    return Intl.message(
      'Show Services',
      name: 'layout_show_services',
      desc: '',
      args: [],
    );
  }

  /// `Show Dismissals`
  String get layout_show_dismissals {
    return Intl.message(
      'Show Dismissals',
      name: 'layout_show_dismissals',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get layout_exit {
    return Intl.message(
      'Exit',
      name: 'layout_exit',
      desc: '',
      args: [],
    );
  }

  /// `Login as an admin`
  String get login_loginAsAdmin {
    return Intl.message(
      'Login as an admin',
      name: 'login_loginAsAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Login as a user`
  String get login_loginAsUser {
    return Intl.message(
      'Login as a user',
      name: 'login_loginAsUser',
      desc: '',
      args: [],
    );
  }

  /// `Password for admin only`
  String get login_passwordHint {
    return Intl.message(
      'Password for admin only',
      name: 'login_passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Change Password!`
  String get login_changePassword {
    return Intl.message(
      'Change Password!',
      name: 'login_changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get login_passwordError {
    return Intl.message(
      'Please enter password',
      name: 'login_passwordError',
      desc: '',
      args: [],
    );
  }

  /// `Password is not correct`
  String get login_passwordIncorrect {
    return Intl.message(
      'Password is not correct',
      name: 'login_passwordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Login as an admin successfully!!!`
  String get login_loginSuccess {
    return Intl.message(
      'Login as an admin successfully!!!',
      name: 'login_loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get change_oldPasswordHint {
    return Intl.message(
      'Old password',
      name: 'change_oldPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get change_newPasswordHint {
    return Intl.message(
      'New password',
      name: 'change_newPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_changePasswordButton {
    return Intl.message(
      'Change password',
      name: 'change_changePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Please enter old password`
  String get change_oldPasswordError {
    return Intl.message(
      'Please enter old password',
      name: 'change_oldPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter new password`
  String get change_newPasswordError {
    return Intl.message(
      'Please enter new password',
      name: 'change_newPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Change password successfully!!!`
  String get change_passwordChangedSuccess {
    return Intl.message(
      'Change password successfully!!!',
      name: 'change_passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Old password is not correct`
  String get change_oldPasswordIncorrect {
    return Intl.message(
      'Old password is not correct',
      name: 'change_oldPasswordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Car Number`
  String get search_car_number {
    return Intl.message(
      'Car Number',
      name: 'search_car_number',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_search {
    return Intl.message(
      'Search',
      name: 'search_search',
      desc: '',
      args: [],
    );
  }

  /// `Car Details`
  String get search_car_details {
    return Intl.message(
      'Car Details',
      name: 'search_car_details',
      desc: '',
      args: [],
    );
  }

  /// `Owner Name`
  String get search_owner_name {
    return Intl.message(
      'Owner Name',
      name: 'search_owner_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get search_phone_number {
    return Intl.message(
      'Phone Number',
      name: 'search_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Car Model`
  String get search_car_model {
    return Intl.message(
      'Car Model',
      name: 'search_car_model',
      desc: '',
      args: [],
    );
  }

  /// `Mileage`
  String get search_mileage {
    return Intl.message(
      'Mileage',
      name: 'search_mileage',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get search_services {
    return Intl.message(
      'Services',
      name: 'search_services',
      desc: '',
      args: [],
    );
  }

  /// `Car not found`
  String get search_car_not_found {
    return Intl.message(
      'Car not found',
      name: 'search_car_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Please enter car number`
  String get search_please_enter_car_number {
    return Intl.message(
      'Please enter car number',
      name: 'search_please_enter_car_number',
      desc: '',
      args: [],
    );
  }

  /// `Car Number`
  String get add_car_carNumber {
    return Intl.message(
      'Car Number',
      name: 'add_car_carNumber',
      desc: '',
      args: [],
    );
  }

  /// `Car Model`
  String get add_car_carModel {
    return Intl.message(
      'Car Model',
      name: 'add_car_carModel',
      desc: '',
      args: [],
    );
  }

  /// `Owner Name`
  String get add_car_ownerName {
    return Intl.message(
      'Owner Name',
      name: 'add_car_ownerName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get add_car_phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'add_car_phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mileage`
  String get add_car_mileage {
    return Intl.message(
      'Mileage',
      name: 'add_car_mileage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter car number`
  String get add_car_carNumberEmpty {
    return Intl.message(
      'Please enter car number',
      name: 'add_car_carNumberEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter car model`
  String get add_car_carModelEmpty {
    return Intl.message(
      'Please enter car model',
      name: 'add_car_carModelEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter owner name`
  String get add_car_ownerNameEmpty {
    return Intl.message(
      'Please enter owner name',
      name: 'add_car_ownerNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get add_car_phoneNumberEmpty {
    return Intl.message(
      'Please enter phone number',
      name: 'add_car_phoneNumberEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add Car`
  String get add_car_addCar {
    return Intl.message(
      'Add Car',
      name: 'add_car_addCar',
      desc: '',
      args: [],
    );
  }

  /// `Update Car`
  String get add_car_updateCar {
    return Intl.message(
      'Update Car',
      name: 'add_car_updateCar',
      desc: '',
      args: [],
    );
  }

  /// `Car Number is empty`
  String get add_car_CarNumberisEmpty {
    return Intl.message(
      'Car Number is empty',
      name: 'add_car_CarNumberisEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Car Number`
  String get add_service_carNumber {
    return Intl.message(
      'Car Number',
      name: 'add_service_carNumber',
      desc: '',
      args: [],
    );
  }

  /// `Service Name`
  String get add_service_serviceName {
    return Intl.message(
      'Service Name',
      name: 'add_service_serviceName',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get add_service_price {
    return Intl.message(
      'Price',
      name: 'add_service_price',
      desc: '',
      args: [],
    );
  }

  /// `Mileage Change When`
  String get add_service_mileageChangeWhen {
    return Intl.message(
      'Mileage Change When',
      name: 'add_service_mileageChangeWhen',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get add_service_addService {
    return Intl.message(
      'Add Service',
      name: 'add_service_addService',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get add_service_confirm {
    return Intl.message(
      'Confirm',
      name: 'add_service_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Car number must not be empty`
  String get add_service_carNumberEmpty {
    return Intl.message(
      'Car number must not be empty',
      name: 'add_service_carNumberEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Car not found`
  String get add_service_carNotFound {
    return Intl.message(
      'Car not found',
      name: 'add_service_carNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Services added successfully`
  String get add_service_servicesAdded {
    return Intl.message(
      'Services added successfully',
      name: 'add_service_servicesAdded',
      desc: '',
      args: [],
    );
  }

  /// `Failed!!!`
  String get add_service_failed {
    return Intl.message(
      'Failed!!!',
      name: 'add_service_failed',
      desc: '',
      args: [],
    );
  }

  /// `Dismissed Name`
  String get add_dismissed_dismissedName {
    return Intl.message(
      'Dismissed Name',
      name: 'add_dismissed_dismissedName',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get add_dismissed_cost {
    return Intl.message(
      'Cost',
      name: 'add_dismissed_cost',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get add_dismissed_note {
    return Intl.message(
      'Note',
      name: 'add_dismissed_note',
      desc: '',
      args: [],
    );
  }

  /// `Please enter dismissed name`
  String get add_dismissed_pleaseEnterDismissedName {
    return Intl.message(
      'Please enter dismissed name',
      name: 'add_dismissed_pleaseEnterDismissedName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter cost`
  String get add_dismissed_pleaseEnterCost {
    return Intl.message(
      'Please enter cost',
      name: 'add_dismissed_pleaseEnterCost',
      desc: '',
      args: [],
    );
  }

  /// `Please enter note`
  String get add_dismissed_pleaseEnterNote {
    return Intl.message(
      'Please enter note',
      name: 'add_dismissed_pleaseEnterNote',
      desc: '',
      args: [],
    );
  }

  /// `Add Dismissed`
  String get add_dismissed_addDismissed {
    return Intl.message(
      'Add Dismissed',
      name: 'add_dismissed_addDismissed',
      desc: '',
      args: [],
    );
  }

  /// `Select Date Type`
  String get show_services_selectDateType {
    return Intl.message(
      'Select Date Type',
      name: 'show_services_selectDateType',
      desc: '',
      args: [],
    );
  }

  /// `Show Services`
  String get show_services_showServices {
    return Intl.message(
      'Show Services',
      name: 'show_services_showServices',
      desc: '',
      args: [],
    );
  }

  /// `Number of Services: `
  String get show_services_numberOfServices {
    return Intl.message(
      'Number of Services: ',
      name: 'show_services_numberOfServices',
      desc: '',
      args: [],
    );
  }

  /// `Total Price: `
  String get show_services_totalPrice {
    return Intl.message(
      'Total Price: ',
      name: 'show_services_totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Price: `
  String get show_services_price {
    return Intl.message(
      'Price: ',
      name: 'show_services_price',
      desc: '',
      args: [],
    );
  }

  /// `Date: `
  String get show_services_date {
    return Intl.message(
      'Date: ',
      name: 'show_services_date',
      desc: '',
      args: [],
    );
  }

  /// `Car Number: `
  String get show_services_carNumber {
    return Intl.message(
      'Car Number: ',
      name: 'show_services_carNumber',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get show_services_day {
    return Intl.message(
      'Day',
      name: 'show_services_day',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get show_services_month {
    return Intl.message(
      'Month',
      name: 'show_services_month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get show_services_year {
    return Intl.message(
      'Year',
      name: 'show_services_year',
      desc: '',
      args: [],
    );
  }

  /// `Please enter day`
  String get show_services_enterDay {
    return Intl.message(
      'Please enter day',
      name: 'show_services_enterDay',
      desc: '',
      args: [],
    );
  }

  /// `Please enter month`
  String get show_services_enterMonth {
    return Intl.message(
      'Please enter month',
      name: 'show_services_enterMonth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter year`
  String get show_services_enterYear {
    return Intl.message(
      'Please enter year',
      name: 'show_services_enterYear',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid date`
  String get show_services_enterValidDate {
    return Intl.message(
      'Please enter a valid date',
      name: 'show_services_enterValidDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Date Type`
  String get show_dismissals_selectDateType {
    return Intl.message(
      'Select Date Type',
      name: 'show_dismissals_selectDateType',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get show_dismissals_dayHint {
    return Intl.message(
      'Day',
      name: 'show_dismissals_dayHint',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get show_dismissals_monthHint {
    return Intl.message(
      'Month',
      name: 'show_dismissals_monthHint',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get show_dismissals_yearHint {
    return Intl.message(
      'Year',
      name: 'show_dismissals_yearHint',
      desc: '',
      args: [],
    );
  }

  /// `Show Dismissals`
  String get show_dismissals_showDismissals {
    return Intl.message(
      'Show Dismissals',
      name: 'show_dismissals_showDismissals',
      desc: '',
      args: [],
    );
  }

  /// `Number of Dismissals: `
  String get show_dismissals_numberOfDismissals {
    return Intl.message(
      'Number of Dismissals: ',
      name: 'show_dismissals_numberOfDismissals',
      desc: '',
      args: [],
    );
  }

  /// `Total Cost: `
  String get show_dismissals_totalCost {
    return Intl.message(
      'Total Cost: ',
      name: 'show_dismissals_totalCost',
      desc: '',
      args: [],
    );
  }

  /// `Price: `
  String get show_dismissals_price {
    return Intl.message(
      'Price: ',
      name: 'show_dismissals_price',
      desc: '',
      args: [],
    );
  }

  /// `Date: `
  String get show_dismissals_date {
    return Intl.message(
      'Date: ',
      name: 'show_dismissals_date',
      desc: '',
      args: [],
    );
  }

  /// `Note: `
  String get show_dismissals_note {
    return Intl.message(
      'Note: ',
      name: 'show_dismissals_note',
      desc: '',
      args: [],
    );
  }

  /// `Please enter day`
  String get show_dismissals_enterDay {
    return Intl.message(
      'Please enter day',
      name: 'show_dismissals_enterDay',
      desc: '',
      args: [],
    );
  }

  /// `Please enter month`
  String get show_dismissals_enterMonth {
    return Intl.message(
      'Please enter month',
      name: 'show_dismissals_enterMonth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter year`
  String get show_dismissals_enterYear {
    return Intl.message(
      'Please enter year',
      name: 'show_dismissals_enterYear',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid date`
  String get show_dismissals_enterValidDate {
    return Intl.message(
      'Please enter a valid date',
      name: 'show_dismissals_enterValidDate',
      desc: '',
      args: [],
    );
  }

  /// `Print Invoice`
  String get print_printInvoice {
    return Intl.message(
      'Print Invoice',
      name: 'print_printInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Enter Comment`
  String get print_enterComment {
    return Intl.message(
      'Enter Comment',
      name: 'print_enterComment',
      desc: '',
      args: [],
    );
  }

  /// `Car added successfully`
  String get database_successAddCar {
    return Intl.message(
      'Car added successfully',
      name: 'database_successAddCar',
      desc: '',
      args: [],
    );
  }

  /// `Car added failed!!!`
  String get database_failedAddCar {
    return Intl.message(
      'Car added failed!!!',
      name: 'database_failedAddCar',
      desc: '',
      args: [],
    );
  }

  /// `No fields to update!`
  String get database_noFieldstoUpdate {
    return Intl.message(
      'No fields to update!',
      name: 'database_noFieldstoUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Car updated successfully`
  String get database_successUpdateCar {
    return Intl.message(
      'Car updated successfully',
      name: 'database_successUpdateCar',
      desc: '',
      args: [],
    );
  }

  /// `Car not found with this car number`
  String get database_carNotFound {
    return Intl.message(
      'Car not found with this car number',
      name: 'database_carNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Update added failed!!!`
  String get database_failedUpdateCar {
    return Intl.message(
      'Update added failed!!!',
      name: 'database_failedUpdateCar',
      desc: '',
      args: [],
    );
  }

  /// `Dismissed added successfully`
  String get database_successAddDismissed {
    return Intl.message(
      'Dismissed added successfully',
      name: 'database_successAddDismissed',
      desc: '',
      args: [],
    );
  }

  /// `Dismissed added failed!!!`
  String get database_failedAddDismissed {
    return Intl.message(
      'Dismissed added failed!!!',
      name: 'database_failedAddDismissed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
