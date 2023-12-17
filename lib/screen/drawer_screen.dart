import 'package:flutter/material.dart';
import 'package:project_6/main.dart';
import 'package:project_6/screen/shopping_cart_screen.dart';
import 'package:provider/provider.dart';

class ShoppingAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ThemeProvider>(context);
    bool temp=provider.currenttheme();
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
           color: (!temp)?Colors.red: Color(0xFF212121)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://picsum.photos/200/200'), // Replace with user profile image
              ),
              SizedBox(height: 10),
              Text(
                'Shopping App', // Replace with user's name
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                'Shopping@myshop.com', // Replace with user's email
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            // Navigate to the home screen
            Navigator.pop(context);
            // Add your navigation logic here
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Shopping Cart'),
          onTap: () {
            // Navigate to the shopping cart screen
            Navigator.pop(context);
            Navigator.pushNamed(context, shopping_cart_screen.routeName);
          },
        ),
        
        Divider(),

       SwitchListTile(value: (temp), onChanged: (val){
             provider.toggleTheme();
       },
       title: Text("Dark Mode"),
       subtitle: Text('this will enable dark mode'),
       )
       
      ],
    );
  }
}
