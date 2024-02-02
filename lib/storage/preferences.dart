import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static var prefs;

  static String API_TOKEN = "api_token";
  static String IS_LOGGED_IN = "is_logged_in";
  static String IS_VERIFIED = "is_verified";
  static String IS_FIRST_TIME = "is_first_time";
  static String AUTH_ID = "auth_id";
  static String LANGUAGE_SELECTED = "language_selected";
  static String IS_PREMIUM = "isPremium";


  static String USER_ID = "user_id";
  static String FIRST_TIME_LOGIN = "first_time_login";
  static String USER_NAME = "name";
  static String FIRST_NAME = "first_name";
  static String LAST_NAME = "last_name";
  static String EMAIL = "email";
  static String PASSWORD = "password";
  static String NUMBER = "number";
  static String COUNTRY = "country";
  static String CITY = "city";
  static String STATE = "state";
  static String PROFILE_PICTURE = "profile_picture";
  static String PROFESSION = "proffession";
  static String PREMIUM = "premium";
  static String LOCATION = "location";
  static String PROFILE_PERCENTAGE = "profile_percentage";
  static String PROFESSIONAL_DETAIL = "professional_detail";
  static String ON_TRIAL = "on_trial";
  static String ON_TRIAL_DONE = "on_trial_done";
  static String ADDRESS = "address";
  static String LAT = "lat";
  static String LNG = "lng";
  static String FMCTOKEN = "";
  static String COMPANY = "company";

  Preferences() {
    getPreferences();
  }

  getPreferences() async {
   prefs = await SharedPreferences.getInstance();
  }

  static void saveUserName(String name) {
    prefs.setString(USER_NAME, name);
  }

  static void saveSelectedLanguage(String value) {
    prefs.setString(LANGUAGE_SELECTED, value);
  }

  static String getSelectedLanguage() {
    return prefs.getString(LANGUAGE_SELECTED) ?? '';
  }

  static String getUserName() {
    return prefs.getString(USER_NAME) ?? '';
  }

  static void saveUserId(String userId) {
    prefs.setString(USER_ID, userId);
  }

  static String getUserId() {
    return prefs.getString(USER_ID) ?? '';
  }

  static void saveFirstTimeLogin(String firstTimeLogin) {
    prefs.setString(FIRST_TIME_LOGIN, firstTimeLogin);
  }

  static String getFirstTimeLogin() {
    return prefs.getString(FIRST_TIME_LOGIN) ?? '';
  }

  static void saveFirstName(String value) {
    prefs.setString(FIRST_NAME, value);
  }

  static String getFirstName() {
    return prefs.getString(FIRST_NAME) ?? '';
  }

  static void saveAddress(String value) {
    prefs.setString(ADDRESS, value);
  }

  static String getADDRESS() {
    return prefs.getString(ADDRESS) ?? '';
  }

  static void saveLat(double value) {
    prefs.setDouble(LAT, value);
  }

  static String getLat() {
    return prefs.getDouble(LAT) ?? '';
  }

  static void saveLng(double value) {
    prefs.setDouble(LNG, value);
  }

  static String getLng() {
    return prefs.getDouble(LNG) ?? '';
  }

  static void saveLastName(String value) {
    prefs.setString(LAST_NAME, value);
  }

  static String getLastName() {
    return prefs.getString(LAST_NAME) ?? '';
  }

  static void saveEmail(String value) {
    prefs.setString(EMAIL, value);
  }

  static String getEmail() {
    return prefs.getString(EMAIL) ?? '';
  }



  static void saveFMCToken(String value) {
    prefs.setString(FMCTOKEN, value);
  }

  static String getFMCToken() {
    return prefs.getString(FMCTOKEN) ?? '';
  }

  static void savePassword(String value) {
    prefs.setString(PASSWORD, value);
  }

  static String getPassword() {
    return prefs.getString(PASSWORD) ?? '';
  }

  static void saveNumber(String value) {
    prefs.setString(NUMBER, value);
  }

  static String getNumber() {
    return prefs.getString(NUMBER) ?? '';
  }

  static void saveAuthId(String value) {
    prefs.setString(AUTH_ID, value);
  }

  static String getAuthId() {
    return prefs.getString(AUTH_ID) ?? '';
  }

  static void saveProfilePicture(String value) {
    prefs.setString(PROFILE_PICTURE, value);
  }

  static String getProfilePicture() {
    return prefs.getString(PROFILE_PICTURE) ?? '';
  }

  static void saveUserCountry(String value) {
    prefs.setString(COUNTRY, value);
  }

  static String getUserCountry() {
    return prefs.getString(COUNTRY) ?? '';
  }

  static void saveUserState(String value) {
    prefs.setString(STATE, value);
  }

  static String getUserState() {
    return prefs.getString(STATE) ?? '';
  }

  static void saveUserCity(String value) {
    prefs.setString(CITY, value);
  }

  static String getUserCity() {
    return prefs.getString(CITY) ?? '';
  }

  static void saveUserProfession(String value) {
    prefs.setString(PROFESSION, value);
  }

  static String getUserProfession() {
    return prefs.getString(PROFESSION) ?? '';
  }

  static void saveUserPremium(String value) {
    prefs.setString("PREMIUM", value);
  }

  static String getUserPremium() {
    return prefs.getString("PREMIUM") ?? 'false';
  }

  static void saveLocation(String value) {
    prefs.setString(LOCATION, value);
  }

  static String getLocation() {
    return prefs.getString(LOCATION) ?? '';
  }

  static void saveCompanyName(String value) {
    prefs.setString(COMPANY, value);
  }

  static String getCompanyName() {
    return prefs.getString(COMPANY) ?? '';
  }

  static void saveUserProfilePercentage(int value) {
    prefs.setInt(PROFILE_PERCENTAGE, value);
  }

  static int getUserProfilePercentage() {
    return prefs.getInt(PROFILE_PERCENTAGE) ?? 0;
  }

  static void setIsLoggedIn(bool value) {
    prefs.setBool(IS_LOGGED_IN, value);
  }

  static bool isLoggedIn() {
    return prefs.getBool(IS_LOGGED_IN) ?? false;
  }

  static void setIsPremium(bool value) {
    prefs.setBool(IS_PREMIUM, value);
  }
  static bool isPremium() {
    return prefs.getBool(IS_PREMIUM) ?? false;
  }
  static void setIsOnTrial(bool value) {
    prefs.setBool(ON_TRIAL, value);
  }

  static bool isOnTrial() {
    return prefs.getBool(ON_TRIAL) ?? false;
  }

  static void setIsOnTrialDone(bool value) {
    prefs.setBool(ON_TRIAL_DONE, value);
  }

  static bool getIsOnTrialDone() {
    return prefs.getBool(ON_TRIAL_DONE) ?? false;
  }

  static void setIsProfessionalFilled(bool value) {
    prefs.setBool(PROFESSIONAL_DETAIL, value);
  }

  static bool isProfessionalFilled() {
    return prefs.getBool(PROFESSIONAL_DETAIL) ?? true;
  }


  static void setIsFirstTime(bool value) {
    prefs.setString(IS_FIRST_TIME, value);
  }

  static bool isFirstTime() {
    return prefs.getBool(IS_FIRST_TIME) ?? true;
  }

  static void setIsVerified(bool value) {
    prefs.setBool(IS_VERIFIED, value);
  }

  static bool isVerified() {
    return prefs.getBool(IS_VERIFIED) ?? false;
  }
}
