import "package:universal_html/html.dart";

class LocalStorageHelper {
  static Storage localStorage = window.localStorage;

  /// To save data in local storage
  static void saveValue(String key, dynamic value) {
    localStorage[key] = value;
  }

  /// To get data from local storage
  static dynamic getValue(String key) {
    return localStorage[key];
  }

  /// To remove data in local storage
  static void removeValue(String key) {
    localStorage.remove(key);
  }

  /// To clear all data in local storage
  static void clearLocalStorage() {
    localStorage.clear();
  }
}
