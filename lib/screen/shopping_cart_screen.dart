import 'package:flutter/material.dart';
import 'package:project_6/providers/provider.dart';
import 'package:provider/provider.dart';

class shopping_cart_screen extends StatelessWidget {
  const shopping_cart_screen({super.key});
  static const routeName='./shopping_cart_screen';


  @override
  Widget build(BuildContext context) {
      final provider=Provider.of<CartModelProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: provider.cartItems.isEmpty
          ? Center(
              child: Text('Your shopping cart is empty.'),
            )
          : ListView.builder(
              itemCount: provider.cartItems.length,
              itemBuilder: (context, index) {
            final cartItem = provider.cartItems[index];    
                return ListTile(
                  leading: Image.network(
                    cartItem.image, // Assuming each item in the cart has an image URL
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cartItem.title),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: Text('\$${cartItem.price * cartItem.quantity}'),
                );
              },
            ),
      bottomNavigationBar: provider.cartItems.isNotEmpty
          ? BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total: \$${provider.totalPrice}'),
                    ElevatedButton(
                      onPressed: () {
                        // Implement checkout logic here
                        // For example, navigate to a checkout screen
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
                      },
                      child: Text('Checkout'),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}