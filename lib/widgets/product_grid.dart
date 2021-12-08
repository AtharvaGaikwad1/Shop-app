import 'package:shop/providers/products.dart';

import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool ShowFavs;
  ProductsGrid(this.ShowFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = ShowFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20),
        itemCount: products.length,
        itemBuilder: (ctx, indx) => ChangeNotifierProvider.value(
              value: products[indx],
              child: ProductItem(
                  // products[indx].id,
                  // products[indx].title,
                  // products[indx].imageUrl,
                  ),
            ));
  }
}
