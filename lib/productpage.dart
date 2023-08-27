import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> fillters = ['All', 'Nike', 'Adidas', 'Sprax', 'Redtape'];
  late String selectedFilter;
  // int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = fillters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 225, 1),
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes \n Collection',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: fillters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final fillter = fillters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = fillter;
                        });
                      },
                      child: Chip(
                        label: Text(fillter),
                        backgroundColor: selectedFilter == fillter
                            ? Theme.of(context).primaryColor
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    final products = product[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return productDetailPage(product: products);
                        }));
                      },
                      child: productcontain(
                        title: products['title'] as String,
                        price: products['price'] as double,
                        image: products['imageUrl'] as String,
                        backgroundcolor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
