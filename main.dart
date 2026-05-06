import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';
import 'pages/counter_page.dart';
import 'pages/widget_bertingkat_page.dart';
import 'pages/user_input_page.dart';
import 'pages/dynamic_list_page.dart';
import 'pages/navigasi_sederhana_page.dart';
import 'pages/grid_view_page.dart';
import 'pages/tentang_saya_page.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
    title: 'MyPorto',  debugShowCheckedModeBanner: false,
theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5C6BC0)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        elevation: 2,
        ), ),
initialRoute: '/',
routes: {
        '/': (context) => const DashboardPage(),
        '/counter': (context) => const CounterPage(),
        '/widget-bertingkat': (context) => const WidgetBertingkatPage(),
        '/user-input': (context) => const UserInputPage(),
        '/dynamic-list': (context) => const DynamicListPage(),
        '/navigasi-sederhana': (context) => const NavigasiSederhanaPage(),
        '/grid-view': (context) => const GridViewPage(),
        '/tentang-saya': (context) => const TentangSayaPage(),
},
    );
}
}
