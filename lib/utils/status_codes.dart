import 'package:login_page/utils/logs.dart';

class HttpStatusCodes {
  static const int OK = 200;
  static const int CREATED = 201;
  static const int ACCEPTED = 202;
  static const int NOCONTENT = 204;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
}

// Example usage:
void handleResponse(int statusCode) {
  if (statusCode == HttpStatusCodes.OK) {
    logs('Request was successful');
  } else if (statusCode == HttpStatusCodes.NOT_FOUND) {
    logs('Resource not found');
  } else if (statusCode == HttpStatusCodes.INTERNAL_SERVER_ERROR) {
    logs('Internal server error');
  } else {
    logs('Unhandled status code: $statusCode');
  }
}