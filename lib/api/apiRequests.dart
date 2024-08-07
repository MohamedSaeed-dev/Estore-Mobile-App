import 'dart:convert';

import 'package:e_store/api/apiURLs.dart';
import 'package:http/http.dart' as http;

Future login(Map data) async {
  try {
    var bodyEncoded = jsonEncode(data);
    var response = await http.post(Uri.parse(login_Url),
        headers: {"Content-Type": "application/json"}, body: bodyEncoded);
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future signup(Map data) async {
  try {
    var bodyEncoded = jsonEncode(data);
    var response = await http.post(Uri.parse(signup_Url),
        headers: {"Content-Type": "application/json"}, body: bodyEncoded);
    var result = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
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
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future updateAccount(Map data) async {
  try {
    var bodyEncoded = jsonEncode(data);
    var response = await http.put(Uri.parse(updateAccount_Url),
        headers: {"Content-Type": "application/json"}, body: bodyEncoded);
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future getAllProductsById(String id) async {
  try {
    var response = await http.get(Uri.parse('$getAllProductById_Url?id=$id'));
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future addProduct(Map data) async {
  try {
    var bodyEncoded = jsonEncode(data);
    var response = await http.post(Uri.parse(addProduct_Url),
        headers: {"Content-Type": "application/json"}, body: bodyEncoded);
    var result = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future updateProduct(Map data) async {
  try {
    var bodyEncoded = jsonEncode(data);
    var response = await http.put(Uri.parse(updateProduct_Url),
        headers: {"Content-Type": "application/json"}, body: bodyEncoded);
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

Future deleteProduct(String id) async {
  try {
    var bodyEncoded = jsonEncode({"id": id});
    var response = await http.delete(Uri.parse(deleteProduct_Url),
        headers: {"Content-Type": "application/json"}, body: bodyEncoded);
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result;
    } else {
      return {'status': "fail", 'message': result["message"]};
    }
  } catch (e) {
    return {'status': "fail", 'message': 'something went wrong'};
  }
}

String capitalize(String s) {
  if (s != '') return s[0].toUpperCase() + s.substring(1);
  return '';
}
