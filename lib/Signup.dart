import 'package:e_store/api/apiRequests.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var show = true;
  final key = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    height: 200,
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
                                Text("Signup to ",
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
                            child: Text(
                                "Join to Our Community with all time access and free",
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
                                // Regex pattern to enforce email format
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
                              controller: passwordController,
                              obscureText: show,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is required';
                                }
                                RegExp passwordRegex = RegExp(
                                    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
                                if (!!passwordRegex.hasMatch(value)) {
                                  return 'Password must be at least 8 characters long and contain\n at least one uppercase letter, one lowercase letter,\n one digit, and one special character.';
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
                            child: Row(children: [
                              Text("Already have an account? "),
                              TextButton(
                                child: Text("Login"),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushReplacementNamed(
                                        context, 'login');
                                  });
                                },
                              ),
                            ]),
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
                                        Map response = await signup({
                                          'username': usernameController.text,
                                          'email': emailController.text,
                                          'phone': phoneController.text,
                                          'password': passwordController.text
                                        });

                                        if (response['status'] == 'success') {
                                          usernameController.text = '';
                                          emailController.text = '';
                                          phoneController.text = '';
                                          passwordController.text = '';
                                          Navigator.pushNamed(
                                              context, 'products',
                                              arguments: {'user': response});
                                        } else {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title:
                                                  const Text('Signup failed'),
                                              content: Text(
                                                  '${response['message']}'),
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
                                        print(e);
                                      }
                                    }
                                  },
                                  child: Text("Signup",
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
