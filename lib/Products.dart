import 'dart:io';
import 'package:e_store/api/apiRequests.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var UserData;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    String id = data["user"]["user"]["Id"].toString();
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        drawer: Drawer(
          child: Container(
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.only(top: 50),
                color: Color(0xFF00B7A5),
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(bottom: 10, left: 20),
                    child: FutureBuilder(
                        future: getAccountById(id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          }
                          if (snapshot.hasData) {
                            Map user = snapshot.data["account"];
                            UserData = user;
                            return Container(
                              width: 150,
                              height: 120,
                              child: ListView(
                                children: [
                                  Text(
                                    "${capitalize(user["Username"])}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "${user["Email"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "${user["Phone"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Center(child: Text("Something went wrong"));
                          }
                        })),
              ),
              Container(
                width: double.infinity,
                height: 640,
                child: ListView(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'account',
                          arguments: {'account': UserData}).then((value) {
                        setState(() {});
                        Map res = value as Map;
                        if (res["success"] == true) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("the account is updated successfully"),
                          ));
                        }
                        Future.delayed(Duration(milliseconds: 500))
                            .then((value) {
                          setState(() {});
                        });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.account_circle,
                                size: 25,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to log out?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                Navigator.pop(context, 'OK');
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.red[300],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.logout,
                                size: 25,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(20),
                child: FutureBuilder(
                    future: getAllProductsById(id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot.hasData) {
                        List products = snapshot.data["products"];
                        return Container(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFF00B7A5), width: 0.5),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, 'show-product', arguments: {
                                        'product': products[index],
                                        'user': UserData["Username"]
                                      }).then((value) {
                                        setState(() {
                                          var data = value as Map;
                                          if (data["state"] == 'update') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "the ${data["product"]["Name"]} is updated successfully"),
                                            ));
                                          } else if (data["state"] ==
                                              'delete') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red[300],
                                              content: Text(
                                                  "the ${data["product"]["Name"]} is deleted successfully"),
                                            ));
                                          }
                                        });
                                      });
                                    },
                                    child: Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            image: products[index]["Img_Url"] !=
                                                    ''
                                                ? DecorationImage(
                                                    image: FileImage(File(
                                                        "${products[index]["Img_Url"]}")),
                                                    fit: BoxFit.fill)
                                                : DecorationImage(
                                                    image: AssetImage(
                                                      "images/not_found.jpg",
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Expanded(
                                          child: Container(
                                              padding: EdgeInsets.only(left: 5),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "${capitalize(products[index]["Name"])}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "${products[index]["Price"]}\$",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF00B7A5),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5))),
                                              child: Text(
                                                "${products[index]["Quantity"]}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Center(child: Text("Something went wrong"));
                      }
                    }))),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, 'add-product', arguments: {
              'id': data["user"]["user"]
            }).then((value) => setState(
                  () {
                    var product = value as Map;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("the ${product["Name"]} is added successfully"),
                    ));
                  },
                ));
          },
          label: Text("Add Product"),
          icon: Icon(Icons.add),
        ));
  }
}
