import 'package:flutter/material.dart';
import './pages/index.dart';
import './pages/login_page/index.dart';
import './pages/equipment_handover_page/index.dart';
import './pages/chip_bind_page/index.dart';
import './pages/vibration_curves_page/index.dart';
import './pages/equipment_error_page/index.dart';


final Map<String, WidgetBuilder> routeTable = {
  '/login' : (content) => LoginPage(),
  '/' : (content) => Layout(),
  '/equipment_handover':(content) => EquipmentHandoverPage(),
  '/chip_bind':(content) => ChipBindPage(),
  '/vibration_curves':(content) => VibrationCurvesPage(),
  '/equipment_error':(content) => EquipmentErrorPage()
};

// 动态生成路由
final onGenerateRoute = (RouteSettings settings) {
  // 从路由表得到builder
  final name = settings.name;
  var builder = routeTable[name];

  // 如果路由表中未定义，跳转到未定义路由页面
  if (builder == null) {
    builder = (content) => LoginPage();
  }

  // 构建动态的route
  final route = MaterialPageRoute(
    builder: builder,
    settings: settings,
  );

  return route;
};
