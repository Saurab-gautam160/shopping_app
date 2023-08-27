import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cartprovider.dart';
import 'package:shopping_app/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping APP',
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1)),
          primaryColor: const Color.fromRGBO(254, 206, 1, 1),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        // home: productDetailPage(
        //   product: product[0],
        // ),
      ),
    );
  }
}
