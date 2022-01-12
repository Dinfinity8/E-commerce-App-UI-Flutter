import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/ProductOrder.dart';
import 'package:shop_app/models/SessionStorageHelper.dart';
import 'package:shop_app/screens/home/components/shop_cart.dart';

import '../../../constants.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: product.color,
              ),
              onPressed: () {
                /// Retrive current product orders from session
                List<ProductOrder> cartList =
                    SessionStorageHelper.getProductOrders('cartList');

                /// Add the new product order
                cartList.add(ProductOrder(
                    productId: product.id,
                    count: SessionStorageHelper.getProductCount()));

                /// Saving the new product order into the session
                SessionStorageHelper.saveValue('cartList', cartList);

                /// Rebuild Shop Cart
                print('***add_to_cart1: call buildShopCart()');
                buildShopCart();
                print('***add_to_cart2: called buildShopCart()');
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: product.color,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
                onPressed: () {
                  // TODO: Implement Add to Cart function
                  print("***Add to Cart Pressed!");
                },
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
