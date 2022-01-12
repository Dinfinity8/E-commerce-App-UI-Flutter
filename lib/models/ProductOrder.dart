class ProductOrder {
  int count, productId;
  //final Product;

  ProductOrder({
    this.productId,
    this.count,
    //  this.Product
  });

  factory ProductOrder.fromJson(Map<String, dynamic> json) {
    return ProductOrder(
        productId: json['productId'] as int, count: json['count'] as int);
  }

  Map toJson() => {
        'productId': productId,
        'count': count,
      };
}
