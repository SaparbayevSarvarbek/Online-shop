import 'package:onlineshop/models/product.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String dbName = 'OnlineShop';
  static const String id = 'id';
  static const String name = 'Name';
  static const String description = 'Description';
  static const String picture = 'Picture';
  static const String price = 'Price';
  static const String category = 'Category';
  static const String isLike = 'Like';
  static const String star = 'Star';

  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final String path = join(await getDatabasesPath(), 'my_database.db');
    await deleteDatabase(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $dbName (
            $id INTEGER PRIMARY KEY AUTOINCREMENT,
            $name TEXT,
            $description TEXT,
            $picture TEXT,
            $price TEXT,
            $category TEXT,
            $isLike INTEGER,
            $star REAL
          )
        ''');
      },
    );
  }

  Future<int> insertProduct(Product product) async {
    final db = await database;
    return await db.insert(dbName, {
      name: product.name,
      description: product.description,
      picture: product.picture,
      price: product.price,
      category: product.category,
      isLike: product.isLike,
      star: product.star
    });
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(dbName);

    return maps.map((map) => Product.fromMap(map)).toList();
  }

  Future<void> insertInitialProducts() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('firstRun') ?? true;

    if (isFirstRun) {
      List<Product> initialProducts = [
        Product(
          name: 'Nike Shoes',
          description: 'Comfortable running shoes',
          picture: 'assets/images/rasm1.png',
          price: '\$99',
          category: 'Shoes',
          star: '4.5',
          isLike: 0,
        ),
        Product(
          name: 'Adidas T-shirt',
          description: 'Casual wear for daily use',
          picture: 'assets/images/rasm2.png',
          price: '\$49',
          category: 'Clothing',
          star: '4.2',
          isLike: 0,
        ),
        Product(
          name: 'Puma Sneakers',
          description: 'Stylish and comfortable',
          picture: 'assets/images/rasm3.png',
          price: '\$79',
          category: 'Shoes',
          star: '4.3',
          isLike: 0,
        ),
      ];
      print('Malumot qo‘shildi: $isFirstRun');
      final db = await database;
      for (var product in initialProducts) {
        await db.insert(dbName, product.toMap());
      }
      await prefs.setBool('firstRun', false);
    } else {
      print('Malumot allaqachon qo‘shilgan: $isFirstRun');
    }
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update(
      dbName,
      {isLike: product.isLike},
      where: '$id = ?',
      whereArgs: [product.id],
    );
  }
}
