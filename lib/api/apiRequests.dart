import 'dart:convert';

import 'package:e_store/api/apiURLs.dart';
import 'package:http/http.dart' as http;

Future login(Map data) async {
  try {
    var response = await http.post(Uri.parse(login_Url), body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future signup(Map data) async {
  try {
    var response = await http.post(Uri.parse(signup_Url), body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future getAccountById(String id) async {
  try {
    var response = await http.get(
      Uri.parse("$getAccountById_Url?id=$id"),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future updateAccount(Map data) async {
  try {
    var response = await http.post(Uri.parse(updateAccount_Url), body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future getAllProductsById(String id) async {
  try {
    var response = await http.get(Uri.parse('$getAllProductById_Url?id=$id'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future addProduct(Map data) async {
  try {
    var response = await http.post(Uri.parse(addProduct_Url), body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future updateProduct(Map data) async {
  try {
    var response = await http.post(Uri.parse(updateProduct_Url), body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future deleteProduct(String id) async {
  try {
    var response =
        await http.post(Uri.parse(deleteProduct_Url), body: {"id": id});
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': "fail", 'message': 'Request failed'};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

String capitalize(String s) {
  if (s != '') return s[0].toUpperCase() + s.substring(1);
  return '';
}
