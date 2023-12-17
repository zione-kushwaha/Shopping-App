import 'package:flutter/material.dart';
import 'package:project_6/model/model.dart';
import 'package:project_6/response/json_data.dart';
import 'package:project_6/screen/individual_item.dart';

class category_screen extends StatelessWidget {
  const category_screen({super.key});
static const routeName='./category_screen';
  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
   
    int category = map['index'] ?? "";
    int id=map['id'];
    String getstring(int index){
      switch (index) {
  case 0:
      return "women's clothing";
  case 1:
    // Statements to be executed if expression matches value2
    return "electronics";
case 2:
     return "women's clothing";
  case 3:
      return "men's clothing"; 
  case 4:
       return "women's clothing";
  default:
    return "jewelery";
}

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(getstring(category)),
      ),
      body:  Container(
            child: FutureBuilder<List<item>>(
            future: Get_category_data(getstring(category)),
            builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Use the data in snapshot.data
          List<item> productList = snapshot.data!;
          // Render your UI based on the data
          return ListView.builder(
           
            itemCount: productList.length,
            itemBuilder: (context, index) {
              // Build your item UI here using productList[index]
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, IndividualItemState.routeName,arguments: {'image':productList[index].image,'description':productList[index].description,'category':productList[index].category,'price':productList[index].price,'rating':productList[index].rating,'id':id});
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
          ),
    );
  }
}