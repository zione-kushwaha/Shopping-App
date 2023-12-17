import 'package:flutter/material.dart';

List<Stack> image=[
 Stack(children:[ Container(
             width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('lib/assets/women_coothing.jpg',fit: BoxFit.fill,))),
  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                     height: 30,
                      child: Row(children: [
                        Text("   Women's Clothing",style: TextStyle(color: Colors.orange,fontSize: 17),)
                      ],),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
  ]),
   Stack(children:[ Container(
             width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('lib/assets/electronics.jpg',fit: BoxFit.fill,))),
  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                     height: 30,
                      child: Row(children: [
                        Text("   Electronics",style: TextStyle(color: Colors.orange,fontSize: 17),)
                      ],),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
  ]),
     Stack(children:[ Container(
             width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('lib/assets/women.jpg',fit: BoxFit.fill,))),
  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                     height: 30,
                      child: Row(children: [
                        Text("   Women's Style",style: TextStyle(color: Colors.orange,fontSize: 17),)
                      ],),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
  ]),
   Stack(children:[ Container(
             width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('lib/assets/Ram Pothineni.jpeg',fit: BoxFit.fill,))),
  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                     height: 30,
                      child: Row(children: [
                        Text("   Men's Style",style: TextStyle(color: Colors.orange,fontSize: 17),)
                      ],),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
  ]),
   Stack(children:[ Container(
             width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('lib/assets/women.jpg',fit: BoxFit.fill,))),
  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                     height: 30,
                      child: Row(children: [
                        Text("   Women's Style",style: TextStyle(color: Colors.orange,fontSize: 17),)
                      ],),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
  ]),
   Stack(children:[ Container(
             width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('lib/assets/jewelery.jpg',fit: BoxFit.fill,))),
  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                     height: 30,
                      child: Row(children: [
                        Text("   Jewelery",style: TextStyle(color: Colors.orange,fontSize: 17),)
                      ],),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black12],begin: Alignment.bottomCenter,end: Alignment.topCenter)
                      ),
                    ),
                  )
  ]),
];

