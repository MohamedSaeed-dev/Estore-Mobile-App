import 'dart:io';
import 'package:e_store/api/apiRequests.dart';
import 'package:flutter/material.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    var product = data["product"];
    var username = data["user"];
    _image = product["Img_Url"] == '' ? null : File(product["Img_Url"]);
    print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00B7A5),
        title: Text("${capitalize(product["Name"])}"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 10),
            color: Color(0xFF00B7A5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: product["Img_Url"] != ''
                                ? DecorationImage(
                                    image: FileImage(_image!), fit: BoxFit.fill)
                                : DecorationImage(
                                    image: AssetImage("images/not_found.jpg"),
                                    fit: BoxFit.fill)),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 800,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                          ),
                        ],
                        color: Color.fromARGB(255, 245, 243, 242),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Container(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: const Color.fromARGB(255, 178, 161, 5),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("5.0 (199)")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person),
                                SizedBox(width: 5),
                                Text("${capitalize(username)}"),
                              ],
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.share))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(bottom: 15),
                                child: Text("${capitalize(product["Name"])}",
                                    style: TextStyle(fontSize: 40)),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${product["Price"]}\$",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                    Row(
                                      children: [
                                        Text("In Stock : ",
                                            style: TextStyle(fontSize: 20)),
                                        Text("${product["Quantity"]} Pcs",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Color(0xFF00B7A5)))
                                      ],
                                    ),
                                  ]),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                    "${capitalize(product["Description"])}"),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
                ])),
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border.all(color: Color(0xFF00B7A5))),
        padding: EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: 70,
        child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pushNamed(context, 'update-product',
                      arguments: {'product': product});
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Color(0xFF00B7A5),
                    ),
                    Text("Edit Product")
                  ],
                ),
              ),
            ),
            Container(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Delete Product'),
                      content:
                          Text('Are you sure you want to delete this product?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            try {
                              var response =
                                  await deleteProduct(product["Id"].toString());
                              if (response["status"] == "success") {
                                Navigator.pop(context);
                                Navigator.pop(context, {
                                  'state': 'delete',
                                  'product': response["product"] as Map
                                });
                              } else {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('Delete product failed'),
                                    content: Text('${response["message"]}'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                    Text("Delete Product")
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
