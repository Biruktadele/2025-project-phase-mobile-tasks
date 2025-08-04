import 'package:flutter/material.dart';


import 'product_list_page.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 15),
          child: Row(
            spacing: 15,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child:  Icon(Icons.person),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jule 14 , 2023',
                    style: TextStyle(
                      fontSize: 8,
                      color: Color.fromARGB(255, 170, 164, 164),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 170, 164, 164),
                        ),
                      ),
                      Text(
                        ' Biruk',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
          ),
        ],
      ),
      body: const ProductListPage(),
      
      
    );
  }
}
