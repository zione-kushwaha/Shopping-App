import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_6/images.dart';
import 'package:project_6/main.dart';
import 'package:project_6/model/model.dart';
import 'package:project_6/response/json_data.dart';
import 'package:project_6/screen/category_screen.dart';
import 'package:project_6/screen/drawer_screen.dart';
import 'package:project_6/screen/individual_item.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    int curr_index=0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ShoppingAppDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index,reason){
              curr_index=index;
            },
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
          ),
          
          items: image.map((i) {
            return Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: (){
               Navigator.pushNamed(context, category_screen.routeName,arguments: {'index':curr_index,'id':1});
            },
            child: Container(
            margin: EdgeInsets.only(top: 8),
              width: 275,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: i,
              ),
            ),
          );
        },
            );
          }).toList(),
           ),
        
        SizedBox(height: 10,),
        Container(
          width: 150,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: !Provider.of<ThemeProvider>(context).currenttheme()?Colors.red: Color(0xFF212121),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(child: Text("All Category")),),
           
          SizedBox(height: 10,),
          Container(
            child: FutureBuilder<List<item>>(
            future: getalldata(),
            builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Use the data in snapshot.data
          List<item> productList = snapshot.data!;
          // Render your UI based on the data
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              // Build your item UI here using productList[index]
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, IndividualItemState.routeName,arguments: {'image':productList[index].image,'description':productList[index].description,'category':productList[index].category,'price':productList[index].price,'rating':productList[index].rating,'id':productList[index].id});
                },
                child: Stack(children:[ Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(productList[index].image,fit: BoxFit.cover,
                        ),
                      ))
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    right: 0,
                    child: Container(
                      
                      padding: const EdgeInsets.all( 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productList[index].title,style: const TextStyle(color: Colors.white,fontSize: 17),),
                          const SizedBox(height: 4,),
                          Row(
                            children: [
                              Text(productList[index].rating.toString(),style: const TextStyle(color: Colors.white,fontSize: 30),),
                              for(int i=1;i<productList[index].rating;i++)
                                 Icon(Icons.star,color: Colors.red,),
                            ],
                          ),
                       
                        ],
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
                  ]
                  ),
              );
            },
          );
        }
            },
            ),
          )
        
        
          ]
        ),
      ),
    );
  }
}
