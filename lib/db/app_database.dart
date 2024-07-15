import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../db/db.dart';

class AppDatabase {
  static final AppDatabase _appDatabase = AppDatabase._internal();

  //private internal constructor to make it singleton
  AppDatabase._internal();

  late Database _database;

  static const dbName = 'mnssindh.db';

  static AppDatabase get() {
    return _appDatabase;
  }

  bool didInit = false;

  /// Use this method to access the database
  Future<Database> getDb() async {
    if (!didInit) await _init();
    return _database;
  }

  /*
  Future _createUserTable(Database db) {
    return db.execute(
      "CREATE TABLE ${UserTable.tblUser} ("
      "${UserTable.dbId} TEXT PRIMARY KEY,"
      "${UserTable.dbUsername} TEXT,"
      "${UserTable.dbName} TEXT,"
      "${UserTable.dbDistCode} TEXT,"
      "${UserTable.dbDistName} TEXT,"
      "${UserTable.dbProCode} TEXT,"
      "${UserTable.dbProName} TEXT,"
      "${UserTable.dbUserAuth} TEXT,"
      "${UserTable.dbUserLevel} TEXT,"
      "${UserTable.dbUType} TEXT,"
      "${UserTable.dbPType} TEXT,"
      "${UserTable.dbDomain} TEXT,"
      "${UserTable.dbCreatedOn} INTEGER,"
      "${UserTable.dbEmail} TEXT,"
      "${UserTable.dbTotalChklst} TEXT)",
    );
  }

  Future _createFormTable(Database db) {
    return db.execute(
      "CREATE TABLE ${FormTable.tblForm} ("
      "${FormTable.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${FormTable.dbFormId} TEXT,"
      "${FormTable.dbName} TEXT,"
      "${FormTable.dbVersion} TEXT,"
      "${FormTable.dbSortOrder} INTEGER,"
      "${FormTable.dbAddedOn} TEXT,"
      "${FormTable.dbDateOfCreation} TEXT,"
      "${FormTable.dbPlanMonth} TEXT,"
      "${FormTable.dbTotalVisits} TEXT,"
      "${FormTable.dbPlanStatus} TEXT,"
      "${FormTable.dbPlanDate} TEXT,"
      "${FormTable.dbActualDate} TEXT,"
      "${FormTable.dbPlanId} TEXT,"
      "${FormTable.dbProgramName} TEXT,"
      "${FormTable.dbVisitStatus} TEXT,"
      "${FormTable.dbCheckListId} TEXT,"
      "${FormTable.dbFacilityName} TEXT,"
      "${FormTable.dbFacilityType} TEXT,"
      "${FormTable.dbFormSchema} TEXT,"
      "${FormTable.dbVisitId} TEXT)",
    );
  }

  Future _createMonitoringTable(Database db) {
    return db.execute("CREATE TABLE ${MonitoringTable.tblMonitoring} ("
        "${MonitoringTable.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${MonitoringTable.dbFormId} TEXT,"
        "${MonitoringTable.dbName} TEXT,"
        "${MonitoringTable.dbVersion} TEXT,"
        "${MonitoringTable.dbFormSchema} TEXT,"
        "${MonitoringTable.dbFormValue} TEXT,"
        "${MonitoringTable.dbPlanId} TEXT,"
        "${MonitoringTable.dbFormStatus} INTEGER,"
        "${MonitoringTable.dbSyncStatus} INTEGER,"
        "${MonitoringTable.dbDateOfCreation} TEXT,"
        "${MonitoringTable.dbStartDateTime} TEXT,"
        "${MonitoringTable.dbCheckListId} TEXT,"
        "${MonitoringTable.dbLat} TEXT,"
        "${MonitoringTable.dbLng} TEXT,"
        "${MonitoringTable.dbEndDateTime} TEXT)");
  }

  Future _createReferenceDataTable(Database db) {
    return db.execute(
      "CREATE TABLE ${ReferenceTable.tblReference} ("
      "${ReferenceTable.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${ReferenceTable.dbEntityType} TEXT,"
      "${ReferenceTable.dbEntityId} TEXT,"
      "${ReferenceTable.dbEntityLabel} TEXT,"
      "${ReferenceTable.dbEntityKey} TEXT,"
      "${ReferenceTable.dbVariation1} TEXT,"
      "${ReferenceTable.dbVariation2} TEXT,"
      "${ReferenceTable.dbVariation3} TEXT,"
      "${ReferenceTable.dbVariation4} TEXT,"
      "${ReferenceTable.dbVariation5} TEXT)",
    );
  }
  */

  Future _init() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    _database = await openDatabase(
      path,
      //version: dbVersion,
      version: migrationScripts.length + 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      /*  onCreate: (Database db, int version) async {
        await _createUserTable(db);
        await _createFormTable(db);
        await _createMonitoringTable(db);
        await _createReferenceDataTable(db);
      },
      // I have added this onUpgrade method to handle the new version
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion < 2) {
          // Perform migration from version 1 to version 2
          await db.execute(
              "ALTER TABLE ${UserTable.tblUser} ADD COLUMN ${UserTable.dbEmail} TEXT");
          await db.execute(
              "ALTER TABLE ${UserTable.tblUser} ADD COLUMN ${UserTable.dbTotalChklst} TEXT");
        }
      },*/
    );
    didInit = true;
  }

  Future _onCreate(Database db, int version) async {
    // AppDatabase.initScript.forEach((script) async {
    initScript.forEach((script) async {
      await db.execute(script);
    });
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    for (var i = oldVersion - 1; i < newVersion - 1; i++) {
      await db.execute(migrationScripts[i]);
    }
  }

  static const initScript = [
    '''CREATE TABLE ${UserTable.tblUser} (
      ${UserTable.dbId} TEXT PRIMARY KEY,
      ${UserTable.dbUsername} TEXT,
      ${UserTable.dbName} TEXT,
      ${UserTable.dbDistCode} TEXT,
      ${UserTable.dbDistName} TEXT,
      ${UserTable.dbProCode} TEXT,
      ${UserTable.dbProName} TEXT,
      ${UserTable.dbUserAuth} TEXT,
      ${UserTable.dbUserLevel} TEXT,
      ${UserTable.dbUType} TEXT,
      ${UserTable.dbPType} TEXT,
      ${UserTable.dbDomain} TEXT,
      ${UserTable.dbCreatedOn} INTEGER,
       ${UserTable.dbEmail} TEXT, 
       ${UserTable.dbTotalChklst} TEXT
      )'''
  ];

  static const migrationScripts = [
    'ALTER TABLE ${UserTable.tblUser} ADD COLUMN ${UserTable.dbEmail} TEXT',
    'ALTER TABLE ${UserTable.tblUser} ADD COLUMN ${UserTable.dbTotalChklst} TEXT',
  ];
}
