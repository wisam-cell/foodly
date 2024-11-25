import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{
  intialDb() async{
    String databasepath = await getDatabasesPath();

    String path = join(databasepath,'wesam.db');

    Database mydb =await openDatabase(path,onCreate: _onCreate);

    return mydb;

  }

_onCreate (Database db , int version)async{
    await db.execute('''
      CREATE TABLE "notes"(
      id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY 
      notes TEXT NOT NULL
      )
   ''' );
    print('create success');

}



}