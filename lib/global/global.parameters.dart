import 'package:flutter/material.dart';
import 'package:demo_app_2/pages/home.page.dart';
import 'package:demo_app_2/pages/counter.page.dart';
import 'package:demo_app_2/pages/contacts.page.dart';
import 'package:demo_app_2/pages/gallery.page.dart';
import 'package:demo_app_2/pages/meteo.page.dart';

class GlobalParameters {
  // ✅ Routes nommées comme constantes
  static const String home = "/";
  static const String counter = "/counter";
  static const String contacts = "/contacts";
  static const String gallery = "/gallery";
  static const String meteo = "/meteo";

  // ✅ Mapping des routes
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    counter: (context) => const CounterPage(),
    contacts: (context) => ContactsPage(),
    gallery: (context) => GalleryPage(),
    meteo: (context) => const MeteoPage(),
  };

  // ✅ Menu drawer / bottom navigation
  static final List<Map<String, dynamic>> menus = [
    {"title": "Home", "route": home, "icon": const Icon(Icons.home)},
    {"title": "Counter", "route": counter, "icon": const Icon(Icons.memory)},
    {"title": "Contacts", "route": contacts, "icon": const Icon(Icons.contacts)},
    {"title": "Meteo", "route": meteo, "icon": const Icon(Icons.cloud)},
    {"title": "Gallery", "route": gallery, "icon": const Icon(Icons.image)},
  ];
}
