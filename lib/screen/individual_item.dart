// ignore_for_file: use_build_context_synchronously

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:project_6/providers/provider.dart';
import 'package:provider/provider.dart';

class IndividualItem extends StatefulWidget {
  @override
  IndividualItemState createState() => IndividualItemState();
}

class IndividualItemState extends State<IndividualItem> {
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  int _cartQuantityItems = 0;
  static const routeName='/individual';

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<cart_model_provider>(context);
    var map = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String image = map['image'] ?? '';
    String category = map['category'] ?? "";
    String description = map['description'] ?? "";
    double price = map['price'];
    double rating =map['rating'];
    int id=map['id'];

    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        Future.delayed(Duration.zero, () {
          this.runAddToCartAnimation = runAddToCartAnimation;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(category),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.cleaning_services),
              onPressed: () {
                _cartQuantityItems = 0;
                provider.clear();
                cartKey.currentState!.runClearCartAnimation();
              },
            ),
            const SizedBox(width: 16),
            AddToCartIcon(
              key: cartKey,
              icon: const Icon(Icons.shopping_cart),
              badgeOptions: const BadgeOptions(
                active: true,
                backgroundColor: Colors.red,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: AppListItem( onClick: (widgetKey) => listClick(widgetKey, context,price, category,image,id), url: image, description: description,price: price.toString(),rating: rating,),
      ),
    );
  }

 
  void listClick(GlobalKey widgetKey, BuildContext context, double price, String category,String url,int id) async {
  await runAddToCartAnimation(widgetKey);
  await cartKey.currentState!.runCartAnimation((++_cartQuantityItems).toString());

  // Add the item to the cart using the CartModelProvider
  Provider.of<CartModelProvider>(context, listen: false).addToCart(
    CartItem(
      id: id.toString(), // Generate a unique ID for the item
      title: category, // Use category as the title for simplicity
      price: price,
      image: url, // You may need to provide the image URL
      quantity: 1, // You can set the initial quantity
    ),
  );
}
}

class AppListItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final void Function(GlobalKey) onClick;
  final String url;
  final String description;
  final String price;
  final double rating;

  AppListItem({required this.onClick, required this.url, required this.description, required this.price,required this.rating});

  @override
  Widget build(BuildContext context) {
    Container mandatoryContainer = Container(
      key: widgetKey,
      width: 60,
      height: 60,
      color: Colors.transparent,
      child: Image.network(
        url,
        width: 60,
        height: 60,
      ),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            child: 
                Stack(
                  children:[ Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Image.network(url, fit: BoxFit.fill),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: const EdgeInsets.all( 15),
                      child: Row(children: [
                        Text("Price: \$$price",style: TextStyle(color: Color.fromARGB(255, 136, 223, 23),fontSize: 17),)
                      ],),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
                  
                  ]
                ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description',style: TextStyle(fontSize: 20),),
                      Divider(),
                      Text(description),
                      Row(
                            children: [
                              Text(rating.toString(),style: const TextStyle(color: Color.fromARGB(255, 223, 29, 29),fontSize: 30),),
                              for(int i=1;i<rating;i++)
                                 Icon(Icons.star,color: Colors.red,),
                            ],
                          ),
                    ],
                  ))),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                          onTap: () => onClick(widgetKey),
                          leading: mandatoryContainer,
                          title: Text(
                            "Add Item to the Cart",
                          ),
                        ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
