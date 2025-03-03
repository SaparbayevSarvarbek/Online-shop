import 'package:flutter/material.dart';
import 'package:onlineshop/models/product.dart';

import '../database/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _serachContorller = TextEditingController();
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    List<Product> loadedProducts = await DatabaseHelper.instance.getProducts();
    setState(() {
      products = loadedProducts;
    });
  }

  Future<void> toggleLike(Product product) async {
    product.isLike = product.isLike == 1 ? 0 : 1;
    await DatabaseHelper.instance.updateProduct(product);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-SHOP'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _serachContorller,
              decoration: InputDecoration(
                hintText: 'Search for tshirts,jeans,shorts',
                hintStyle: TextStyle(color: Color(0xFFA8AFB9)),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color(0xFFA8AFB9),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  card(
                      title: 'WOMEN',
                      bgColor: Colors.orange,
                      imagePath: "assets/images/women.png"),
                  card(
                      title: 'MEN',
                      bgColor: Color(0xFF3D190A),
                      imagePath: "assets/images/women.png"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'See all',
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Color(0xFFA8AFB9), fontSize: 16.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                      product: product, onLikePressed: toggleLike);
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFC6828)),
              child: Text('Drawer header'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Info"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

Widget card({
  required String title,
  required Color bgColor,
  required String imagePath,
}) {
  return Padding(
    padding: EdgeInsets.only(right: 10),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -10,
          child: Image.asset(
            imagePath,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(Product) onLikePressed;

  const ProductCard(
      {super.key, required this.product, required this.onLikePressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    product.picture,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                product.price,
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => onLikePressed(product),
              child: Icon(
                Icons.favorite,
                color: product.isLike == 1 ? Colors.red : Colors.grey,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
