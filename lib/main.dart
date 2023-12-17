import 'package:flutter/material.dart';
import 'package:project_6/providers/provider.dart';
import 'package:project_6/screen/FirstScreen.dart';
import 'package:project_6/screen/category_screen.dart';
import 'package:project_6/screen/individual_item.dart';
import 'package:project_6/screen/shopping_cart_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(Myapp());
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = _buildLightTheme();

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == _buildLightTheme() ? _buildDarkTheme() : _buildLightTheme();
    notifyListeners();
  }
bool currenttheme(){
  if(_currentTheme==_buildDarkTheme()){
    return true;
  }else{
    return false;
  }
}
  static ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      useMaterial3: false,
      // Add other theme properties here
      textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 16, color: Colors.black),
        bodyText2: TextStyle(fontSize: 14, color: Colors.black54),
        // Add more text styles as needed
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: false,
      // Add other theme properties here
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 16, color: Colors.white),
        bodyText2: TextStyle(fontSize: 14, color: Colors.white70),
        // Add more text styles as needed
      ),
    );
  }
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => cart_model_provider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context)=>CartModelProvider()),
        
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            home: FirstScreen(),
            routes: {
              IndividualItemState.routeName: (context) => IndividualItem(),
              category_screen.routeName: (context) => category_screen(),
              shopping_cart_screen.routeName: (context)=>shopping_cart_screen()
            },
          );
        },
      ),
    );
  }
}
