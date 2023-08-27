// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cartprovider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  cartItem['imageUrl'] as String,
                ),
                radius: 30,
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Delete Product',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                'Are you sure you want to remove product'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Provider.of<cartProvider>(context,
                                          listen: false)
                                      .removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              title: Text(
                cartItem['title'].toString(),
              ),
              subtitle: Text('Size:${cartItem['sizes']}'),
            );
          }),
    );
  }
}
