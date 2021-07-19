import 'package:electronic/src/pages/dashboard_page.dart';
import 'package:electronic/src/pages/addDevice_page.dart';
import 'package:electronic/src/pages/getDevice_page.dart';
import 'package:electronic/src/pages/login_page.dart';
import 'package:electronic/src/pages/register_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'login': (_) => LoginPage(),
  'dash': (_) => DashboardPage(),
  'register': (_) => TestPage(),
  'devices':(_) => DispositivosPage(),
  'listar': (_) => ListarPage()
};
