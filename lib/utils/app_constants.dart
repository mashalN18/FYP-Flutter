class AppConstants {
  static const int APP_VERSION = 1;

  //Base url

  static const String BASE_URL = "https://garden-app-252mw.ondigitalocean.app";

  static const String LOGIN_URL = "/user2/login";
  static const String GET_TASKS = "/getTask";
  static const String GET_LEAVES = "/getLeave";
  static const String GET_PERFORMANCE = "/getPerformance";
  static const String GET_RESOURCES = "/getResource";
  // static const String LOGIN_URL = "/vendor/login";
  // static const String HOME_GET = "/getAllVendorsByLatLong";
  // static const String VERIFY_OTP = "/verifyOtp/Vendor";
  // static const String GET_NOTIFICAITON = "/vendorBookingsNotifications";



  // static const String PAGE = "?page=";
  // static const String LIMIT = "&limit=";





  //STATUS CODE
  static const int SUCCESS = 200;
  static const int SERVER_SIDE_ERROR = 300;
  static const int UNAUTHORIZED = 400;
  static const int INTERNAL_SERVER_ERROR = 500;
  //http://localhost:8000/storage/image/5tNrKQdVZIQL3NIc63SN19BwcCv3Gpf8yLILS8cu.png
  //Payment URL
  static const String SQUARE_PAYMENT_POST_URL =
      "https://connect.squareupsandbox.com/v2/payments";

  static const String DEBUG_SERVICE_ID = "657447d19779e51af4bc0e11";
}
