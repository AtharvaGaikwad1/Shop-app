import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/cart_screen.dart';
import '../widgets/product_item.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';

enum favCheck { favorites, all }

class ProductsOverview extends StatefulWidget {
  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  bool _showOnlyfav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoppers stop ! '),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == favCheck.favorites) {
                  _showOnlyfav = true;
                } else {
                  _showOnlyfav = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('display favorites'),
                value: favCheck.favorites,
              ),
              PopupMenuItem(
                child: Text('display all'),
                value: favCheck.all,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, __) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
              color: Colors.red,
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyfav),
    );
  }
}
