import 'package:electronic/src/pages/dashboard_page.dart';
import 'package:electronic/src/pages/dispositivos.dart';
import 'package:electronic/src/pages/listarData_page.dart';
import 'package:electronic/src/pages/login_page.dart';
import 'package:electronic/src/pages/register_page.dart';
import 'package:electronic/src/pages/test_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'dash': (_) => DashboardPage(),
  'test': (_) => TestPage(),
  'devices':(_) => DispositivosPage(),
  'listar': (_) => ListarPage()
};
