String baseUrl_src = 'http://10.0.2.2/e-store/src';
String baseUrl_auth = 'http://10.0.2.2/e-store/auth';

///////////////////////// Src /////////////////////////////////////

String getAllProductById_Url = "${baseUrl_src}/getAllProducts.php";
String getProductById_Url = "${baseUrl_src}/getProductById.php";
String addProduct_Url = "${baseUrl_src}/createProduct.php";
String deleteProduct_Url = "${baseUrl_src}/deleteProduct.php";
String updateProduct_Url = "${baseUrl_src}/updateProduct.php";

///////////////////////// Auth ////////////////////////////////////

String login_Url = "${baseUrl_auth}/login.php";
String signup_Url = "${baseUrl_auth}/signup.php";
String getAccountById_Url = "${baseUrl_auth}/getAccountById.php";
String updateAccount_Url = "${baseUrl_auth}/updateAccount.php";


