import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_6/model/model.dart';

//function to query for all the data response 
// Function to fetch data from the API
Future<List<item>> getalldata() async {
  var url = 'https://fakestoreapi.com/products';
  List<item> product = [];

  try {
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      product.clear();
      List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      items.forEach((element) {
        product.add(item(
          category: element['category'],
          description: element['description'],
          id: element['id'],
          image: element['image'],
          price: element['price'].toDouble(), // Convert to double if necessary
          title: element['title'],
          rating: element['rating']['rate'].toDouble(),
          count: element['rating']['count']
        ));
      });
      return product;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Exception: $e');
    throw Exception('Failed to load data');
  }
}

Future<List<item>> Get_category_data(String category) async {
  var url = 'https://fakestoreapi.com/products/category/$category';
  List<item> product = [];

  try {
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      product.clear();
      List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      items.forEach((element) {
        product.add(item(
          category: element['category'],
          description: element['description'],
          id: element['id'],
          image: element['image'],
          price: element['price'].toDouble(), // Convert to double if necessary
          title: element['title'],
          rating: element['rating']['rate'].toDouble(),
          count: element['rating']['count']
        ));
      });
      return product;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Exception: $e');
    throw Exception('Failed to load data');
  }
}