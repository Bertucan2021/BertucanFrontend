import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<void> insertLog(LogPeriod2 log) async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'bertucan_database.db'),

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'LogPeriod',
    log.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print(await dogs());
}

Future<LogPeriod2> dogs() async {
  // Get a reference to the database.
  final database = openDatabase(
    join(await getDatabasesPath(), 'bertucan_database.db'),

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  final db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('LogPeriod');

  // Convert the List<Map<String, dynamic> into a List<Dog>.

    return LogPeriod2(
      id: maps[0]['id'],
      startDate: DateTime.parse(maps[0]['start_date']),
      endDate: DateTime.parse(maps[0]['end_date']),
    );

}


Future<void> test() async{
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'bertucan_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE LogPeriod(id INTEGER PRIMARY KEY AUTOINCREMENT, start_date TEXT, end_date TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts dogs into the database


  // A method that retrieves all the dogs from the dogs table.


  Future<void> updateDog(LogPeriod2 log) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'LogPeriod',
      log.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [log.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'LogPeriod',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Create a Dog and add it to the dogs table
  var fido =  LogPeriod2(
    id: 0,
    startDate: DateTime.now().subtract(const Duration(days: 25)),
    endDate: DateTime.now().subtract(const Duration(days: 20)),
  );

  await insertLog(fido);

  // Now, use the method above to retrieve all the dogs.
  print(await dogs()); // Prints a list that include Fido.

  // Update Fido's age and save it to the database.
  fido = LogPeriod2(
    id: fido.id,
    startDate: fido.startDate.add(Duration(days: 32)),
    endDate: fido.endDate.add(Duration(days: 37))
  );
  await updateDog(fido);

  // Print the updated results.
  print(await dogs()); // Prints Fido with age 42.

  // Delete Fido from the database.
  await deleteDog(fido.id);

  // Print the list of dogs (empty).
  print(await dogs());
}

class LogPeriod2 {
  final int id;
  final DateTime startDate;
  final DateTime endDate;

  const LogPeriod2({
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'start_date': startDate.toString(),
      'end_date': endDate.toString(),
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'LogPeriod{id: $id, start_date: $startDate, end_date: $endDate}';
  }
}