import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/firebase_options.dart';
import 'package:shopify_app/models/product.model.dart';
import 'package:shopify_app/pages/splash_page.dart';
import 'package:shopify_app/provider/auth_provider.dart';
import 'package:shopify_app/services/prefrences.service.dart';
import 'package:shopify_app/utils/theme.utils.dart';

import 'provider/home_provider.dart';
import 'provider/productprovider.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

  await PrefrencesService.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppAuthProvider()),
    FutureProvider<List<Product>?>(
      create: (_) => ProductProvider().getProducts(),
      initialData: null,
      catchError: (_, err) {
        return [];
      },
    ),
    ChangeNotifierProvider(create: (_) => HomeProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopify Application',
      theme: ThemeUtils.themeData,
      home: SplashPage(),
    );
  }
}
