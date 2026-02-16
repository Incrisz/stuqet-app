var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text =
      "@ Stuqet " + this_year; //this shows in the splash screen
  static String app_name = "Stuqet"; //this shows in the splash screen



  //Default language config
  static String default_language = "en";
  static String mobile_app_code = "en";
  static bool app_language_rtl = false;

  //configure this
  static const bool HTTPS = false;

  static const DOMAIN_PATH = "192.168.172.246:8000"; // local network backend

  //do not configure these below
  static const String API_ENDPATH = "api/v2";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
