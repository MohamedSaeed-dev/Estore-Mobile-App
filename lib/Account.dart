import 'package:e_store/api/apiRequests.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var show = true;
  var show_old = true;
  final key = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var oldPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    var user = data["account"];
    usernameController.text = user["Username"];
    emailController.text = user["Email"];
    phoneController.text = user["Phone"];
    passwordController.text = '';
    oldPasswordController.text = '';
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
                    height: 190,
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
                                Text("Update your account in ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text("Moha",
                                    style: TextStyle(
                                        color: Color(0xFF00B7A5),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Center(
                            child: Text("Stay with us updated! ",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username is required';
                                }
                                RegExp usernameRegex = RegExp(
                                    r'^(?![_\.])(?!.*[_.]{2})[a-zA-Z0-9._]{5,20}(?<![_\.])$');
                                if (!usernameRegex.hasMatch(value)) {
                                  return 'Username must be between 5 and 20 characters long,\n '
                                      'and can contain letters, numbers, underscores, and dots.\n '
                                      'It cannot start or end with an underscore or dot\n, '
                                      'and cannot contain consecutive underscores or dots.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Username"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is required';
                                }
                                RegExp emailRegex =
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Email"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: phoneController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone is required';
                                }

                                RegExp emailRegex = RegExp(r'^\d{9}$');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Enter a valid phone number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Phone"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: oldPasswordController,
                              obscureText: show_old,
                              validator: (value) {
                                RegExp passwordRegex = RegExp(
                                    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
                                if (value != null) {
                                  if (!!passwordRegex
                                      .hasMatch(value.toString())) {
                                    return 'Password must be at least 8 characters long and contain\n at least one uppercase letter, one lowercase letter,\n one digit, and one special character.';
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.key),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          show_old = !show_old;
                                        });
                                      },
                                      icon: Icon(show_old
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Old Password"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: show,
                              validator: (value) {
                                RegExp passwordRegex = RegExp(
                                    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
                                if (value != null) {
                                  if (!!passwordRegex
                                      .hasMatch(value.toString())) {
                                    return 'Password must be at least 8 characters long and contain\n at least one uppercase letter, one lowercase letter,\n one digit, and one special character.';
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.key),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                      icon: Icon(show
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF00B7A5)),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Password"),
                            ),
                          ),
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
                                        Map response = await updateAccount({
                                          'username': usernameController.text,
                                          'email': emailController.text,
                                          'phone': phoneController.text,
                                          'password': passwordController.text,
                                          'oldPassword':
                                              oldPasswordController.text,
                                          'id': user["Id"].toString()
                                        });
                                        if (response['status'] == 'success') {
                                          usernameController.text = '';
                                          emailController.text = '';
                                          phoneController.text = '';
                                          passwordController.text = '';
                                          oldPasswordController.text = '';
                                          Navigator.pop(
                                              context, {"success": true});
                                        } else {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title:
                                                  Text('Update account failed'),
                                              content: Text(
                                                  '${response["message"]}'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: const Text('Cancel'),
                                                ),
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
                                        print(e);
                                      }
                                    }
                                  },
                                  child: Text("Update your Account",
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
