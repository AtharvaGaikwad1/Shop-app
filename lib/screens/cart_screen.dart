import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders.dart';
import '../providers/cart.dart';
import '../widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartExp = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart  Details"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartExp.total}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cartExp.items.values.toList(), cartExp.total);
                      cartExp.clear();
                    },
                    child: Text('Order Now'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartExp.itemCount,
              itemBuilder: (ctx, i) => CartDetails(
                cartExp.items.values.toList()[i].id,
                cartExp.items.values.toList()[i].price,
                cartExp.items.values.toList()[i].quantity,
                cartExp.items.values.toList()[i].title,
                cartExp.items.keys.toList()[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
