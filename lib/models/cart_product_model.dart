class CartProduct {
  String id;
  String name;
  String image;
  String category;
  int amount;
  double itemPrice;

  CartProduct({this.id, this.name, this.image, this.itemPrice, this.category});

  CartProduct.fromDocument(dynamic data){
    id = data['id'];
    name = data['name'];
    image = data['image'];
    category = data['category'];
    amount = data['amount'];
    itemPrice = data['itemPrice'].toDouble();
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'image': image,
      'category': category,
      'amount': amount,
      'itemPrice': itemPrice,
    };
  }

}