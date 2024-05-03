import 'dart:io';
import 'package:e_store/api/apiRequests.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  File? _image;
  var imgUrl = '';

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imgUrl = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }

  final key = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    Map product = data["product"];
    nameController.text = product["Name"].toString();
    priceController.text = product["Price"].toString();
    quantityController.text = product["Quantity"].toString();
    descriptionController.text = product["Description"].toString();
    var imgUrl1 = imgUrl == 'empty' ? '' : product["Img_Url"].toString();
    File? _image1 = imgUrl1 == '' ? null : File(imgUrl1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00B7A5),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(color: Color(0xFF00B7A5)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("images/logo.png"))),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 800,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Container(
                        child: Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Form(
                        key: key,
                        child: Column(children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Edit the Product in ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                Text("Moha",
                                    style: TextStyle(
                                        color: Color(0xFF00B7A5),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Center(
                            child: Text("Make a changes in your Product!",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.add_box),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Product Name"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: priceController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.price_change),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Price"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: quantityController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.numbers),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Quantity"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.description),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Description"),
                            ),
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                          child: Text("Select Image"),
                                          onPressed: () {
                                            setState(() {
                                              _getImage();
                                            });
                                          })),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                          child: Text("Empty Image"),
                                          onPressed: () {
                                            setState(() {
                                              imgUrl = 'empty';
                                              _image = null;
                                            });
                                          }))
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: _image == null
                                        ? _image1 != null
                                            ? DecorationImage(
                                                image: FileImage(_image1!),
                                                fit: BoxFit.cover)
                                            : DecorationImage(
                                                image: AssetImage(
                                                  "images/not_found.jpg",
                                                ),
                                                fit: BoxFit.fill,
                                              )
                                        : DecorationImage(
                                            image: FileImage(_image!),
                                            fit: BoxFit.cover)),
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                              ),
                            ],
                          )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF00B7A5))),
                                  onPressed: () async {
                                    if (key.currentState!.validate()) {
                                      try {
                                        Map response = await updateProduct({
                                          "name": nameController.text,
                                          'price': priceController.text,
                                          'quantity': quantityController.text,
                                          'description':
                                              descriptionController.text,
                                          'id': product['Id'].toString(),
                                          'img_Url':
                                              imgUrl == 'empty' ? '' : imgUrl
                                        });
                                        if (response["status"] == "success") {
                                          Navigator.pop(context);
                                          Navigator.pop(context, {
                                            'state': 'update',
                                            'product':
                                                response["product"] as Map
                                          });
                                        } else {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text(
                                                  'Update product failed'),
                                              content: Text(
                                                  '${response["message"]}'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        print('$e ');
                                      }
                                    }
                                  },
                                  child: Text("Edit the Product",
                                      style: TextStyle(color: Colors.white))))
                        ]),
                      ),
                    )),
                  ),
                ])),
      )),
    );
  }
}
