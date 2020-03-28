class Product{

  String productID;
  String productName;
  String price;
  String type;
  String img;
  Product({

    this.productID,
    this.productName,
    this.price,
    this.type,
    this.img

  });

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      productID: json['PRODUCT_ID'],
      productName: json['PRODUCT_NAME'],
      price: json['PRICE'],
      type: json['TYPE'],
      img: json['P_IMG']
    );

  }

}