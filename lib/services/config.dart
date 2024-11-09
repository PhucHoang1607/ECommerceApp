import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final String apiUrlPath = dotenv.env['API_URL'] ?? '';
  static final String host = dotenv.env['HOST'] ?? '';
  static final String hostF = dotenv.env['FUNCTIONHOST'] ?? '';
  static final String port = dotenv.env['PORT'] ?? '';
  static String get apiUrl {
    return 'http://$host:$port$apiUrlPath';
  }

  static String get apiFucntionUrl {
    return 'http://$hostF:$port$apiUrlPath';
  }

  // Secrets for authentication and database
  static final String accessTokenSecret =
      dotenv.env['ACCESS_TOKEN_SECRET'] ?? '';
  static final String refreshTokenSecret =
      dotenv.env['REFRESH_TOKEN_SECRET'] ?? '';
  static final String mongoDbConnectionString =
      dotenv.env['MONGODB_CONNECTION_STRING'] ?? '';

  // Email service
  static final String email = dotenv.env['EMAIL'] ?? '';
  static final String emailPassword = dotenv.env['EMAIL_PASSWORD'] ?? '';

  // Stripe configuration
  static final String stripeKey = dotenv.env['STRIPE_KEY'] ?? '';
  static final String stripeWebhookSecret =
      dotenv.env['STRIPE_WEBHOOK_SECRET'] ?? '';

  //admin
  static String get adminPath => '$apiUrl/admin';
  static String get adminFPath => '$apiFucntionUrl/admin';

  //user
  static String get userPath => '$apiUrl/users';
  static String get categoriesPath => '$apiUrl/categories';

  //Auth function
  static String get loginUrl => '$apiUrl/login';
  static String get registerUrl => '$apiUrl/register';
  static String get verifyTokenUrl => '$apiUrl/verify-token';
  static String get forgotPasswordUrl => '$apiUrl/forgot-password';
  static String get verifyPasswordResetOTPUrl => '$apiUrl/verify-otp';
  static String get resetPasswordUrl => '$apiUrl/reset-password';

  //Admin function

  //ADMIN
  //==> User
  static String get userGetAdUrl => '$adminPath/user';
  static String get userCountAdUrl => '$adminPath/users/count';
  static String userIdGetAdUrl(String id) => '$adminPath/user/$id';
  static String userDeleteAdUrl(String id) => '$adminPath/user/$id';

  //==> Categories
  static String get categoryGetAdUrl => '$adminPath/categories';
  static String get categoryAddAdUrl => '$adminPath/categories';
  static String categoryIdGetAdUrl(String id) => '$adminPath/categories/$id';
  static String categoryEditAdUrl(String id) => '$adminPath/categories/$id';
  static String categoryDeleteAdUrl(String id) => '$adminPath/categories/$id';

  //==> Products
  static String get productGetAdUrl => '$adminPath/products';
  static String get productCountGetAdUrl => '$adminPath/products/count';
  static String productIdGetAdUrl(String id) => '$adminPath/products/$id';
  static String get productAddAdUrl => '$adminPath/products';
  static String productEditAdUrl(String id) => '$adminPath/products/$id';
  static String productImageDeleteAdUrl(String id) =>
      '$adminPath/products/$id/images';
  static String productDeleteAdUrl(String id) => '$adminPath/products/$id';

  //==> Orders
  static String get ordersGetAdUrl => '$adminPath/orders';
  static String get ordersCountAdUrl => '$adminPath/orders/count';
  static String ordersEditStatusAdUrl(String id) => '$adminPath/orders/$id';
  static String ordersDeleteAdUrl(String id) => '$adminPath/orders/$id';

  // Any other endpoint can be constructed similarly
}
