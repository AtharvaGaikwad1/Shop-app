import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProdcutDetailScreen extends StatelessWidget {
  // final String title;
  // ProdcutDetailScreen(this.title);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findByID(productID);
    return Scaffold(
      appBar: AppBar(
        title: (Text(loadedProduct.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 500,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
            Text(
              loadedProduct.description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                Text('\$' + loadedProduct.price.toString(),
                    style: TextStyle(fontSize: 24))
              ],
            )
          ],
        ),
      ),
    );
  }
}
