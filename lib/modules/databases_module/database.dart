import 'dart:io';
import 'package:benz/models/car_model/car_model.dart';
import 'package:benz/models/dismissed_model/dismissed_model.dart';
import 'package:benz/models/service_model/service_model.dart';
import 'package:benz/models/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  Database? _database;

  DatabaseHelper() {
    // Initialize sqflite for desktop if needed
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    createDatabase();
  }

  Future<Database> createDatabase() async {
    if (_database != null) return _database!;
    _database = await openDatabase(
      'tx.dp',
      version: 1,
      onCreate: (database, version) async {
        print("Database created");
        await database.execute('''
          CREATE TABLE IF NOT EXISTS Car (
            carNumber TEXT PRIMARY KEY, 
            carModel TEXT NOT NULL, 
            ownerName TEXT NOT NULL, 
            phoneNumber TEXT NOT NULL, 
            mileage REAL NOT NULL
          );
        ''');
        await database.execute('''
          CREATE TABLE IF NOT EXISTS Service (
            serviceID INTEGER PRIMARY KEY AUTOINCREMENT, 
            carNumber TEXT NOT NULL, 
            name TEXT NOT NULL, 
            price REAL NOT NULL, 
            start_date TEXT NOT NULL,
            end_date TEXT NOT NULL,
            
            FOREIGN KEY (carNumber) REFERENCES Car (carNumber)
          );
        ''');
        await database.execute('''
  CREATE TABLE IF NOT EXISTS Dismissed (
    dismissedId INTEGER PRIMARY KEY AUTOINCREMENT, 
    date TEXT NOT NULL, 
    cost REAL NOT NULL, 
    titleName TEXT NOT NULL, 
    note TEXT NOT NULL
  );
''');
        await database.execute('''
CREATE TABLE User ( 
  userName TEXT NOT NULL PRIMARY KEY,
  password TEXT NOT NULL
  )
''');
        print("Tables created");
        UserModel user = UserModel(userName: "admin", password: "Admin12345");
        await database.insert('User', user.toMap());
      },
      onOpen: (database) {
        print("Opened database");
      },
    );
    return _database!;
  }

  Future<void> insertCar(CarModel carModel, BuildContext context) async {
    final db = await createDatabase();
    await db
        .insert('Car', carModel.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Car added successfully')));
    }).catchError((Error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed!!!')));
    });
  }

  Future<void> updateCar({
    required String carNumber,
    String? newOwnerName,
    String? newPhoneNumber,
    String? newMileage,
    required BuildContext context,
  }) async {
    final db = await createDatabase();
    // Create a map to store the fields to update
    Map<String, dynamic> updatedValues = {};

    if (newOwnerName!.isNotEmpty) {
      updatedValues['ownerName'] = newOwnerName;
    }

    if (newPhoneNumber!.isNotEmpty) {
      updatedValues['phoneNumber'] = newPhoneNumber;
    }

    if (newMileage!.isNotEmpty) {
      updatedValues['mileage'] = double.parse(newMileage);
    }

    // If there's nothing to update, return early
    if (updatedValues.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No fields to update!')));
      return;
    }
    print(updatedValues);
    await db
        .update(
            'Car', // The table to update
            updatedValues, // The values to update
            where: 'carNumber = ?', // Specify the car to update
            whereArgs: [carNumber],
            conflictAlgorithm:
                ConflictAlgorithm.replace // The carNumber of the car to update
            )
        .then((value) {
      if (value > 0) {
        // Car was found and updated
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Car updated successfully')));
      } else {
        // Car number not found
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Car not found with this car number')));
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Update failed!!!')));
    });
  }

  Future<void> insertService(ServiceModel serviceModel) async {
    final db = await createDatabase();
    await db.insert('Service', serviceModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertDismissed(
      DismissedModel dismissedModel, BuildContext context) async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Insert the DismissedModel instance into the database.
    await db
        .insert(
      'Dismissed',
      dismissedModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dismissed added successfully')));
    }).catchError((Error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed!!!')));
    });
  }

  Future<List<CarModel>> getAllCars() async {
    final db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Car');
    return List.generate(maps.length, (i) {
      return CarModel(
        carNumber: maps[i]['carNumber'],
        carModel: maps[i]['carModel'],
        ownerName: maps[i]['ownerName'],
        phoneNumber: maps[i]['phoneNumber'],
        mileage: maps[i]['mileage'],
      );
    });
  }

  Future<List<DismissedModel>> getAllDismissed() async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Query the table for all DismissedModel entries.
    final List<Map<String, dynamic>> maps = await db.query('Dismissed');

    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    List<DismissedModel> dismissedList = List.generate(maps.length, (i) {
      return DismissedModel(
        dismissedId: maps[i]['dismissedId'],
        date: maps[i]['date'],
        cost: maps[i]['cost'],
        titleName: maps[i]['titleName'],
        note: maps[i]['note'],
      );
    });

    // Sort the list by date.
    dismissedList.sort(
        (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

    return dismissedList;
  }

  Future<List<DismissedModel>> getAllDismissedByMonthDate(
      int year, int month) async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Convert the day, month, and year to strings with leading zero if necessary
    // String dayString = day.toString().padLeft(2, '0');
    String monthString = month.toString().padLeft(2, '0');
    String yearString = year.toString();

    // Query the table for the specified day, month, and year.
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM Dismissed 
    WHERE strftime('%Y', date) = ? 
      AND strftime('%m', date) = ? 
  ''', [yearString, monthString]);

    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    List<DismissedModel> dismissedList = List.generate(maps.length, (i) {
      return DismissedModel(
        dismissedId: maps[i]['dismissedId'],
        date: maps[i]['date'],
        cost: maps[i]['cost'],
        titleName: maps[i]['titleName'],
        note: maps[i]['note'],
      );
    });

    // Sort the list by date.
    dismissedList.sort(
        (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

    return dismissedList;
  }

  Future<List<DismissedModel>> getAllDismissedByYearDate(int year) async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Convert the day, month, and year to strings with leading zero if necessary
    // String dayString = day.toString().padLeft(2, '0');
    // String monthString = month.toString().padLeft(2, '0');
    String yearString = year.toString();

    // Query the table for the specified day, month, and year.
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM Dismissed 
    WHERE strftime('%Y', date) = ?
  ''', [yearString]);

    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    List<DismissedModel> dismissedList = List.generate(maps.length, (i) {
      return DismissedModel(
        dismissedId: maps[i]['dismissedId'],
        date: maps[i]['date'],
        cost: maps[i]['cost'],
        titleName: maps[i]['titleName'],
        note: maps[i]['note'],
      );
    });

    // Sort the list by date.
    dismissedList.sort(
        (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

    return dismissedList;
  }

  Future<List<DismissedModel>> getDismissedByDayDate(
      int year, int month, int day) async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Convert the day, month, and year to strings with leading zero if necessary.
    String dayString = day.toString().padLeft(2, '0');
    String monthString = month.toString().padLeft(2, '0');
    String yearString = year.toString();

    // Query the table for the specified day, month, and year.
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM Dismissed 
    WHERE strftime('%Y', date) = ? 
      AND strftime('%m', date) = ? 
      AND strftime('%d', date) = ?
  ''', [yearString, monthString, dayString]);

    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    // Convert the List<Map<String, dynamic>> to List<DismissedModel>.
    List<DismissedModel> dismissedList = List.generate(maps.length, (i) {
      return DismissedModel(
        dismissedId: maps[i]['dismissedId'],
        date: maps[i]['date'],
        cost: maps[i]['cost'],
        titleName: maps[i]['titleName'],
        note: maps[i]['note'],
      );
    });

    // Sort the list by date.
    dismissedList.sort(
        (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

    return dismissedList;
  }

  Future<CarModel?> getCarByNumber(String carNumber) async {
    final db = await createDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query('Car', where: 'carNumber = ?', whereArgs: [carNumber]);
    if (maps.isNotEmpty) {
      return CarModel(
        carNumber: maps[0]['carNumber'],
        carModel: maps[0]['carModel'],
        ownerName: maps[0]['ownerName'],
        phoneNumber: maps[0]['phoneNumber'],
        mileage: maps[0]['mileage'],
      );
    } else {
      return null;
    }
  }

  Future<List<ServiceModel>> getServicesByCarNumber(String carNumber) async {
    final db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db
        .query('Service', where: 'carNumber = ?', whereArgs: [carNumber]);
    // Convert the retrieved maps to a list of ServiceModel objects
    List<ServiceModel> services = List.generate(maps.length, (i) {
      return ServiceModel(
        serviceID: maps[i]['serviceID'],
        carNumber: maps[i]['carNumber'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        startDate: maps[i]['start_date'],
        endDate: maps[i]['end_date'],
      );
    });

    // Sort the list based on the startDate
    services.sort((a, b) => a.startDate.compareTo(b.startDate));

    return services;
  }

  Future<List<ServiceModel>> getServicesByMonthDate(int year, int month) async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Convert the day, month, and year to strings with leading zero if necessary
    // String dayString = day.toString().padLeft(2, '0');
    String monthString = month.toString().padLeft(2, '0');
    String yearString = year.toString();

    print(monthString);
    print(yearString);

    // Query the table for the specified day, month, and year.
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM Service 
    WHERE strftime('%Y', start_date) = ? 
      AND strftime('%m', start_date) = ? 
  ''', [yearString, monthString]);

    // Convert the List<Map<String, dynamic>> to List<Servicee>.
    // Convert the retrieved maps to a list of ServiceModel objects
    List<ServiceModel> services = List.generate(maps.length, (i) {
      return ServiceModel(
        serviceID: maps[i]['serviceID'],
        carNumber: maps[i]['carNumber'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        startDate: maps[i]['start_date'],
        endDate: maps[i]['end_date'],
      );
    });

    // Sort the list based on the startDate
    services.sort((a, b) => b.startDate.compareTo(a.startDate));

    return services;
  }

  Future<List<ServiceModel>> getServicesByDayDate(
      int year, int month, int day) async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Convert the day, month, and year to strings with leading zero if necessary
    String dayString = day.toString().padLeft(2, '0');
    String monthString = month.toString().padLeft(2, '0');
    String yearString = year.toString();
    print(dayString);
    print(monthString);
    print(yearString);

    // Query the table for the specified day, month, and year.
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM Service 
    WHERE strftime('%Y', start_date) = ? 
      AND strftime('%m', start_date) = ? 
      AND strftime('%d', start_date) = ?
  ''', [yearString, monthString, dayString]);

    // Convert the List<Map<String, dynamic>> to List<Servicee>.
    // Convert the retrieved maps to a list of ServiceModel objects
    List<ServiceModel> services = List.generate(maps.length, (i) {
      return ServiceModel(
        serviceID: maps[i]['serviceID'],
        carNumber: maps[i]['carNumber'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        startDate: maps[i]['start_date'],
        endDate: maps[i]['end_date'],
      );
    });

    // Sort the list based on the startDate
    services.sort((a, b) => a.startDate.compareTo(b.startDate));

    return services;
  }

  Future<List<ServiceModel>> getServicesByYearDate(int year) async {
    // Get a reference to the database.
    final db = await createDatabase();

    // Convert the day, month, and year to strings with leading zero if necessary
    // String dayString = day.toString().padLeft(2, '0');
    String yearString = year.toString();

    print(yearString);

    // Query the table for the specified day, month, and year.
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM Service 
    WHERE strftime('%Y', start_date) = ? 
  ''', [yearString]);

    // Convert the List<Map<String, dynamic>> to List<Servicee>.
    // Convert the retrieved maps to a list of ServiceModel objects
    List<ServiceModel> services = List.generate(maps.length, (i) {
      return ServiceModel(
        serviceID: maps[i]['serviceID'],
        carNumber: maps[i]['carNumber'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        startDate: maps[i]['start_date'],
        endDate: maps[i]['end_date'],
      );
    });

    // Sort the list based on the startDate
    services.sort((a, b) => a.startDate.compareTo(b.startDate));

    return services;
  }

  Future<int> insertUser(UserModel user) async {
    final db = await createDatabase();

    return await db.insert('User', user.toMap());
  }

  Future<int> updateUserPassword(String userName, String newPassword) async {
    final db = await createDatabase();

    return await db.update(
      'User',
      {'password': newPassword},
      where: 'userName = ?',
      whereArgs: [userName],
    );
  }

  Future<UserModel?> getUser(String userName) async {
    final db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'User',
      where: 'userName = ?',
      whereArgs: [userName],
    );

    if (maps.isNotEmpty) {
      return UserModel(
        userName: maps.first['userName'],
        password: maps.first['password'],
      );
    }
    return null;
  }
}
