String baseUrl_src = 'https://estore-mongodb.onrender.com/src';
String baseUrl_auth = 'https://estore-mongodb.onrender.com/auth';

///////////////////////// Src /////////////////////////////////////

String getAllProductById_Url = "${baseUrl_src}/getAllProducts";
String getProductById_Url = "${baseUrl_src}/getProductById";
String addProduct_Url = "${baseUrl_src}/createProduct";
String deleteProduct_Url = "${baseUrl_src}/deleteProduct";
String updateProduct_Url = "${baseUrl_src}/updateProduct";

///////////////////////// Auth ////////////////////////////////////

String login_Url = "${baseUrl_auth}/login";
String signup_Url = "${baseUrl_auth}/signup";
String getAccountById_Url = "${baseUrl_auth}/getAccountById";
String updateAccount_Url = "${baseUrl_auth}/updateAccount";
