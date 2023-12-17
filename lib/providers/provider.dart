import 'package:flutter/material.dart';

class cartmodel{
  String category;
  double price;
  int item;
  cartmodel({required this.item, required this.price, required this.category});
}
// creating the provider for the cart model

class cart_model_provider with ChangeNotifier{
  List<cartmodel> _item=[];

   // function to add item in the _item list
   void add_item(cartmodel cart){
    _item.add(cart);
    notifyListeners();
   }
   //function to clear all the list_item form  the _item_list
   void clear(){
    _item.clear();
    notifyListeners();
   }
   //function to get all the data item from the list 
   List<cartmodel> get_list(){
    return [..._item];
   }
   //function to get all the item in the of the cart
   int get_count(){
    int sum =0;
    for(int i=0;i<_item.length;i++){
        sum+=_item[i].item;
    }
    return sum;
   }
}

class CartItem {
  final String id;
  final String title;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });
}

class CartModelProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

 
 void addToCart(CartItem item) {
  // Try to find an existing item with the same id
  CartItem existingItem = _cartItems.firstWhere(
    (element) => element.id == item.id,
    orElse: () => item, // Use the provided item if no match is found
  );

  // If the existing item is the provided item, add it to the list
  if (existingItem == item) {
    _cartItems.add(item);
  } else {
    // Update the existing item
    existingItem.quantity += item.quantity;
  }

  notifyListeners();
}


  void removeFromCart(String itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
