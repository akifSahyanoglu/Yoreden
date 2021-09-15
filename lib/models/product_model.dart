class ProductModel {
  String? productName;
  String? productImage;
  int? productPrice;
  String? productId;
  int? productQuantity;
  List<dynamic>? productUnit;
  ProductModel(
      {this.productImage,
      this.productName,
      this.productPrice,
      this.productId,
      this.productUnit,
      this.productQuantity});
}
