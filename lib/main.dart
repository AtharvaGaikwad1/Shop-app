import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(create: (ctx) => Orders())
      ],
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'Lato'),
        home: ProductsOverview(),
        routes: {
          ProdcutDetailScreen.routeName: (ctx) => ProdcutDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
