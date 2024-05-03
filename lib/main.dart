import 'package:e_store/Account.dart';
import 'package:e_store/AddProduct.dart';
import 'package:e_store/Login.dart';
import 'package:e_store/Products.dart';
import 'package:e_store/ShowProduct.dart';
import 'package:e_store/Signup.dart';
import 'package:e_store/updateProduct.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (context) => Login(),
        'signup': (context) => Signup(),
        'products': (context) => Products(),
        'add-product': (context) => AddProduct(),
        'update-product': (context) => UpdateProduct(),
        'account': (context) => Account(),
        'show-product': (context) => ShowProduct(),
      },
      title: 'E-Store - Moha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Kufi',
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Color(0xFF00B7A5),
          contentTextStyle: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF00B7A5)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Moha (E-Store)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 300,
              child: Image.asset("images/signin.jpg"),
            ),
            Container(
              height: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome to Moha (E-Store)",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            side: MaterialStatePropertyAll(BorderSide())),
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text("Get Started !",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
