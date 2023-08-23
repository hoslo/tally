import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:tally/models/bill.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
        CREATE Table if NOT EXISTS bills (
            `id` INTEGER AUTO increment PRIMARY KEY,
            `amount` REAL NOT NULL,  -- 金额
            `note` CHAR(255) NOT NULL,  -- 备注
            `icon` CHAR(255) NOT NULL,  -- 图标
            `created_at` INTEGER NOT NULL,
            `updated_at` INTEGER NOT NULL,
            `deleted_at` INTEGER DEFAULT NULL
        );
    """);
    await database.execute("""
        CREATE INDEX if NOT EXISTS idx_created_at ON bills (created_at);
    """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    final path = join(await getDatabasesPath(), "tally.db");
    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new bill
  static Future<int> createBill(Bill bill) async {
    final db = await DatabaseHelper.db();
    bill.createdAt = DateTime.now().microsecondsSinceEpoch;
    bill.updatedAt = DateTime.now().microsecondsSinceEpoch;
    final data = bill.toMap();
    final id = await db.insert(
      'bills',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // query bills by created_at
  static Future<List<Bill>> getBillsByCreatedAt(
      DateTime start, DateTime end) async {
    final db = await DatabaseHelper.db();
    final maps = await db.query(
      'bills',
      where: "created_at >= ? and created_at <= ?",
      whereArgs: [start.microsecondsSinceEpoch, end.microsecondsSinceEpoch],
    );
    return List.generate(maps.length, (i) {
      return Bill.fromMap(maps[i]);
    });
  }
}
