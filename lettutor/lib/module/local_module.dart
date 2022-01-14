import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalModule {
  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  // /// A singleton database provider.
  // ///
  // /// Calling it multiple times will return the same instance.
  // static Future<Database> provideDatabase() async {
  //   // Key for encryption
  //   var encryptionKey = "";

  //   // Get a platform-specific directory where persistent app data can be stored
  //   final appDocumentDir = await getApplicationDocumentsDirectory();

  //   // Path with the form: /platform-specific-directory/demo.db
  //   final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);

  //   // Check to see if encryption is set, then provide codec
  //   // else init normal db with path
  //   var database;
  //   if (encryptionKey.isNotEmpty) {
  //     // Initialize the encryption codec with a user password
  //     var codec = getXXTeaCodec(password: encryptionKey);
  //     database = await databaseFactoryIo.openDatabase(dbPath, codec: codec);
  //   } else {
  //     database = await databaseFactoryIo.openDatabase(dbPath);
  //   }

  //   // Return database instance
  //   return database;
  // }
}
