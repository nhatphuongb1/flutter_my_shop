import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/utils/routers.dart';
import 'pages/products_overview_page.dart';
import 'providers/orders.dart';
import 'providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final cart = Cart();
  final products = Products();
  final orders = Orders();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: products),
        ChangeNotifierProvider.value(value: cart),
        ChangeNotifierProvider.value(value: orders),
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        ),
        home: ProductsOverviewPage(),
        routes: routes,
      ),
    );
  }
}
