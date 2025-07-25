import 'package:flutter/material.dart';
import 'package:shop/pages/add_page.dart';
import 'package:shop/pages/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15),
          child: Row(
            spacing: 15,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: Image.asset('images/profile.JPG'),
              ),
              Column(
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
      body: HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>AddPage()),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
